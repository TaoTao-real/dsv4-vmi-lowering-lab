module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @scatter_softmax_pool(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i64, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c-1 = arith.constant -1 : index
      %c-8 = arith.constant -8 : index
      %c-4 = arith.constant -4 : index
      %c20480_i64 = arith.constant 20480 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c18432_i64 = arith.constant 18432 : i64
      %c2048 = arith.constant 2048 : index
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c1024 = arith.constant 1024 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %cst = arith.constant -3.40282347E+38 : f32
      %cst_0 = arith.constant 0.000000e+00 : f32
      %c1536 = arith.constant 1536 : index
      %c1_i64 = arith.constant 1 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      scf.for %arg8 = %c0 to %c4 step %c1 {
        %0 = arith.muli %arg8, %c2 : index
        %1 = pto.load_scalar %arg2[%0] : !pto.ptr<i32, gm> -> i32
        %2 = pto.load_scalar %arg3[%0] : !pto.ptr<i64, gm> -> i64
        %3 = arith.index_cast %1 : i32 to index
        %4 = arith.remsi %3, %c4 : index
        %5 = arith.addi %0, %c1 : index
        %6 = pto.load_scalar %arg2[%5] : !pto.ptr<i32, gm> -> i32
        %7 = pto.load_scalar %arg3[%5] : !pto.ptr<i64, gm> -> i64
        %8 = arith.index_cast %6 : i32 to index
        %9 = arith.remsi %8, %c4 : index
        %10 = arith.index_cast %2 : i64 to index
        %11 = arith.cmpi sge, %10, %c0 : index
        scf.if %11 {
          %22 = arith.muli %arg8, %c2048 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c20480_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %4, %c1024 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %36 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %28[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %28[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %28[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %28[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %28[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %28[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %28[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %28[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %28[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %28[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %28[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %28[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %28[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %28[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %28[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %33[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %33[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_19 = pto.vlds %33[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_20 = pto.vlds %33[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_21 = pto.vlds %33[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_22 = pto.vlds %33[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_23 = pto.vlds %33[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_24 = pto.vlds %33[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_25 = pto.vlds %33[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_26 = pto.vlds %33[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_27 = pto.vlds %33[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_28 = pto.vlds %33[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_29 = pto.vlds %33[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_30 = pto.vlds %33[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_31 = pto.vlds %33[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %45 = pto.vadd %result, %result_16, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vadd %result_1, %result_17, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result_2, %result_18, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %result_3, %result_19, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %result_4, %result_20, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %result_5, %result_21, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %result_6, %result_22, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %result_7, %result_23, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %result_8, %result_24, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vadd %result_9, %result_25, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %result_10, %result_26, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %result_11, %result_27, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_12, %result_28, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %result_13, %result_29, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %result_14, %result_30, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_15, %result_31, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %28[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %46, %28[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %28[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %28[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %28[%c256], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %28[%c320], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %28[%c384], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %28[%c448], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %28[%c512], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %28[%c576], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %28[%c640], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %28[%c704], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %28[%c768], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %28[%c832], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %28[%c896], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %28[%c960], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %37 = arith.muli %10, %c2048 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          %40 = arith.addi %37, %c1024 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        %12 = arith.index_cast %7 : i64 to index
        %13 = arith.cmpi sge, %12, %c0 : index
        scf.if %13 {
          %22 = arith.muli %5, %c1024 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %9, %c1024 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %28[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %28[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %28[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %28[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %28[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %28[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %28[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %28[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %28[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %28[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %28[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %28[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %28[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %28[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %28[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %33[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %33[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_19 = pto.vlds %33[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_20 = pto.vlds %33[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_21 = pto.vlds %33[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_22 = pto.vlds %33[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_23 = pto.vlds %33[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_24 = pto.vlds %33[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_25 = pto.vlds %33[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_26 = pto.vlds %33[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_27 = pto.vlds %33[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_28 = pto.vlds %33[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_29 = pto.vlds %33[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_30 = pto.vlds %33[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_31 = pto.vlds %33[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %45 = pto.vadd %result, %result_16, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vadd %result_1, %result_17, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result_2, %result_18, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %result_3, %result_19, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %result_4, %result_20, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %result_5, %result_21, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %result_6, %result_22, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %result_7, %result_23, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %result_8, %result_24, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vadd %result_9, %result_25, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %result_10, %result_26, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %result_11, %result_27, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_12, %result_28, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %result_13, %result_29, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %result_14, %result_30, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_15, %result_31, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %28[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %46, %28[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %28[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %28[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %28[%c256], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %28[%c320], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %28[%c384], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %28[%c448], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %28[%c512], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %28[%c576], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %28[%c640], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %28[%c704], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %28[%c768], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %28[%c832], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %28[%c896], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %28[%c960], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %37 = arith.muli %12, %c2048 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          %40 = arith.addi %37, %c1024 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        %14 = pto.load_scalar %arg2[%0] : !pto.ptr<i32, gm> -> i32
        %15 = arith.index_cast %14 : i32 to index
        %16 = arith.remsi %15, %c4 : index
        %17 = arith.subi %c4, %16 : index
        %18 = arith.addi %15, %17 : index
        %19 = arith.addi %18, %c-4 : index
        %20 = arith.addi %18, %c-8 : index
        %21 = arith.cmpi sge, %16, %c2 : index
        scf.if %21 {
          %22 = arith.addi %18, %c-1 : index
          %23 = arith.divsi %22, %c4 : index
          %24 = arith.remsi %22, %c4 : index
          %25 = arith.muli %arg8, %c4096 : index
          %26 = arith.addi %25, %23 : index
          %27 = pto.load_scalar %arg7[%26] : !pto.ptr<i32, gm> -> i32
          %28 = arith.index_cast %27 : i32 to index
          %29 = arith.muli %28, %c4 : index
          %30 = arith.addi %29, %24 : index
          %31 = arith.muli %30, %c2048 : index
          %32 = arith.addi %31, %c1536 : index
          %33 = pto.addptr %arg0, %32 : <f32, gm> -> <f32, gm>
          %34 = pto.castptr %c20480_i64 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
          %36 = pto.addptr %34, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %35, %36, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %37 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %34[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %34[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %34[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %34[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %55 = pto.vsub %result, %result, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vsub %result_1, %result_1, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vsub %result_2, %result_2, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vsub %result_3, %result_3, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vsub %result_4, %result_4, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vsub %result_5, %result_5, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vsub %result_6, %result_6, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vsub %result_7, %result_7, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %37[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %37[%c64], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %37[%c128], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %37[%c192], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %37[%c256], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %37[%c320], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %37[%c384], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %37[%c448], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %38 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %37[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %37[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %37[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %37[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %54 = pto.vexp %result, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vexp %result_1, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vexp %result_2, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vexp %result_3, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vexp %result_4, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vexp %result_5, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vexp %result_6, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vexp %result_7, %53 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %54, %37[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %37[%c64], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %37[%c128], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %37[%c192], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %37[%c256], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %37[%c320], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %37[%c384], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %37[%c448], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %39 = arith.addi %31, %c512 : index
          %40 = pto.addptr %arg0, %39 : <f32, gm> -> <f32, gm>
          %41 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
          %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %42, %43, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %44 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %46 = arith.cmpi sge, %15, %c4 : index
          scf.for %arg9 = %c0 to %c4 step %c1 {
            %53 = arith.addi %20, %arg9 : index
            pto.vecscope {
              %54 = scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg11 = %c512) -> (index)  : i16 {
                %56 = arith.index_cast %arg10 : i16 to index
                %57 = arith.index_cast %arg11 : index to i32
                %mask, %scalar_out = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
                %58 = arith.index_cast %scalar_out : i32 to index
                %59 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %60 = pto.addptr %44, %56 : <f32, ub> -> <f32, ub>
                pto.vsts %59, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %58 : index
              }
              %55 = scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg11 = %c512) -> (index)  : i16 {
                %56 = arith.index_cast %arg10 : i16 to index
                %57 = arith.index_cast %arg11 : index to i32
                %mask, %scalar_out = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
                %58 = arith.index_cast %scalar_out : i32 to index
                %59 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %60 = pto.addptr %45, %56 : <f32, ub> -> <f32, ub>
                pto.vsts %59, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %58 : index
              }
            }
            scf.if %46 {
              %54 = arith.divsi %53, %c4 : index
              %55 = arith.remsi %53, %c4 : index
              %56 = arith.addi %25, %54 : index
              %57 = pto.load_scalar %arg7[%56] : !pto.ptr<i32, gm> -> i32
              %58 = arith.index_cast %57 : i32 to index
              %59 = arith.muli %58, %c4 : index
              %60 = arith.addi %59, %55 : index
              %61 = arith.muli %60, %c2048 : index
              %62 = arith.addi %61, %c1024 : index
              %63 = pto.addptr %arg0, %62 : <f32, gm> -> <f32, gm>
              %64 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %65 = pto.addptr %63, %c0 : <f32, gm> -> <f32, gm>
              %66 = pto.addptr %64, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %65, %66, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %67 = pto.addptr %arg0, %61 : <f32, gm> -> <f32, gm>
              %68 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
              %69 = pto.addptr %67, %c0 : <f32, gm> -> <f32, gm>
              %70 = pto.addptr %68, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %69, %70, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            } else {
              pto.vecscope {
                %54 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
                %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %45[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %45[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_4 = pto.vlds %45[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_5 = pto.vlds %45[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_6 = pto.vlds %45[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %45[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %54[%c0], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %54[%c64], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %54[%c128], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %54[%c192], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_4, %54[%c256], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_5, %54[%c320], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_6, %54[%c384], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_7, %54[%c448], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %56 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
                %result_8 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_9 = pto.vlds %44[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_10 = pto.vlds %44[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_11 = pto.vlds %44[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_12 = pto.vlds %44[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_13 = pto.vlds %44[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_14 = pto.vlds %44[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_15 = pto.vlds %44[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result_8, %56[%c0], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_9, %56[%c64], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_10, %56[%c128], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_11, %56[%c192], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_12, %56[%c256], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_13, %56[%c320], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_14, %56[%c384], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_15, %56[%c448], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
            pto.vecscope {
              %54 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %34[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %34[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %34[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %34[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %54[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %54[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %54[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %54[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %54[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %54[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %54[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %56 = pto.vmax %result, %result_8, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vmax %result_1, %result_9, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vmax %result_2, %result_10, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.vmax %result_3, %result_11, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.vmax %result_4, %result_12, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = pto.vmax %result_5, %result_13, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %62 = pto.vmax %result_6, %result_14, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %63 = pto.vmax %result_7, %result_15, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %56, %44[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %57, %44[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %58, %44[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %59, %44[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %60, %44[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %61, %44[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %62, %44[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %63, %44[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %65 = pto.vsub %result, %56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vsub %result_1, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vsub %result_2, %58, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = pto.vsub %result_3, %59, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.vsub %result_4, %60, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vsub %result_5, %61, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vsub %result_6, %62, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vsub %result_7, %63, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vexp %65, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vexp %66, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vexp %67, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vexp %68, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vexp %69, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vexp %70, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vexp %71, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vexp %72, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vsub %result_8, %56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vsub %result_9, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vsub %result_10, %58, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vsub %result_11, %59, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vsub %result_12, %60, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vsub %result_13, %61, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vsub %result_14, %62, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vsub %result_15, %63, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vexp %81, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vexp %82, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vexp %83, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %92 = pto.vexp %84, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %93 = pto.vexp %85, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %94 = pto.vexp %86, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %95 = pto.vexp %87, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vexp %88, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
              %result_16 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %37[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %37[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %37[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_23 = pto.vlds %37[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %98 = pto.vmul %73, %result_16, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %99 = pto.vmul %74, %result_17, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %100 = pto.vmul %75, %result_18, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %101 = pto.vmul %76, %result_19, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %102 = pto.vmul %77, %result_20, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %103 = pto.vmul %78, %result_21, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %104 = pto.vmul %79, %result_22, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %105 = pto.vmul %80, %result_23, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %98, %97[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %99, %97[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %100, %97[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %101, %97[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %102, %97[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %103, %97[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %104, %97[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %105, %97[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %106 = pto.vadd %98, %89, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %107 = pto.vadd %99, %90, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %108 = pto.vadd %100, %91, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %109 = pto.vadd %101, %92, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %110 = pto.vadd %102, %93, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %111 = pto.vadd %103, %94, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %112 = pto.vadd %104, %95, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %113 = pto.vadd %105, %96, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %106, %37[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %107, %37[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %108, %37[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %109, %37[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %110, %37[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %111, %37[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %112, %37[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %113, %37[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_24 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_25 = pto.vlds %41[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_26 = pto.vlds %41[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_27 = pto.vlds %41[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_28 = pto.vlds %41[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_29 = pto.vlds %41[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_30 = pto.vlds %41[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_31 = pto.vlds %41[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %114 = pto.vmul %result_24, %73, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %115 = pto.vmul %result_25, %74, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %116 = pto.vmul %result_26, %75, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %117 = pto.vmul %result_27, %76, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %118 = pto.vmul %result_28, %77, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %119 = pto.vmul %result_29, %78, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %120 = pto.vmul %result_30, %79, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %121 = pto.vmul %result_31, %80, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %114, %45[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %115, %45[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %116, %45[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %117, %45[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %118, %45[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %119, %45[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %120, %45[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %121, %45[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %122 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
              %result_32 = pto.vlds %122[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_33 = pto.vlds %122[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_34 = pto.vlds %122[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_35 = pto.vlds %122[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_36 = pto.vlds %122[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_37 = pto.vlds %122[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_38 = pto.vlds %122[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_39 = pto.vlds %122[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %123 = pto.vmul %result_32, %89, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %124 = pto.vmul %result_33, %90, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %125 = pto.vmul %result_34, %91, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %126 = pto.vmul %result_35, %92, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %127 = pto.vmul %result_36, %93, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %128 = pto.vmul %result_37, %94, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %129 = pto.vmul %result_38, %95, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %130 = pto.vmul %result_39, %96, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %123, %54[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %124, %54[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %125, %54[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %126, %54[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %127, %54[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %128, %54[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %129, %54[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %130, %54[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %131 = pto.vadd %114, %123, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %132 = pto.vadd %115, %124, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %133 = pto.vadd %116, %125, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %134 = pto.vadd %117, %126, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %135 = pto.vadd %118, %127, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %136 = pto.vadd %119, %128, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %137 = pto.vadd %120, %129, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %138 = pto.vadd %121, %130, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %131, %41[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %132, %41[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %133, %41[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %134, %41[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %135, %41[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %136, %41[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %137, %41[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %138, %41[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %56, %34[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %57, %34[%c64], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %58, %34[%c128], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %59, %34[%c192], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %60, %34[%c256], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %61, %34[%c320], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %62, %34[%c384], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %63, %34[%c448], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %47 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          %48 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg9 = %c0 to %c3 step %c1 {
            %53 = arith.addi %19, %arg9 : index
            %54 = arith.divsi %53, %c4 : index
            %55 = arith.remsi %53, %c4 : index
            %56 = arith.addi %25, %54 : index
            %57 = pto.load_scalar %arg7[%56] : !pto.ptr<i32, gm> -> i32
            %58 = arith.index_cast %57 : i32 to index
            %59 = arith.muli %58, %c4 : index
            %60 = arith.addi %59, %55 : index
            %61 = arith.muli %60, %c2048 : index
            %62 = arith.addi %61, %c1536 : index
            %63 = pto.addptr %arg0, %62 : <f32, gm> -> <f32, gm>
            %64 = pto.addptr %63, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %64, %47, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %65 = arith.addi %61, %c512 : index
            %66 = pto.addptr %arg0, %65 : <f32, gm> -> <f32, gm>
            %67 = pto.addptr %66, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %67, %48, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %68 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %34[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %34[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %34[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %34[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %44[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %44[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %44[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %44[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %44[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %44[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %44[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %70 = pto.vmax %result, %result_8, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vmax %result_1, %result_9, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vmax %result_2, %result_10, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vmax %result_3, %result_11, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmax %result_4, %result_12, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmax %result_5, %result_13, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmax %result_6, %result_14, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vmax %result_7, %result_15, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %70, %68[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %68[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %68[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %68[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %68[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %68[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %68[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %77, %68[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %79 = pto.vsub %result, %70, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vsub %result_1, %71, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vsub %result_2, %72, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vsub %result_3, %73, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vsub %result_4, %74, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vsub %result_5, %75, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vsub %result_6, %76, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vsub %result_7, %77, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vexp %79, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vexp %80, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vexp %81, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vexp %82, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vexp %83, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %92 = pto.vexp %84, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %93 = pto.vexp %85, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %94 = pto.vexp %86, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %95 = pto.vsub %result_8, %70, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vsub %result_9, %71, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.vsub %result_10, %72, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %98 = pto.vsub %result_11, %73, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %99 = pto.vsub %result_12, %74, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %100 = pto.vsub %result_13, %75, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %101 = pto.vsub %result_14, %76, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %102 = pto.vsub %result_15, %77, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %103 = pto.vexp %95, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %104 = pto.vexp %96, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %105 = pto.vexp %97, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %106 = pto.vexp %98, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %107 = pto.vexp %99, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %108 = pto.vexp %100, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %109 = pto.vexp %101, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %110 = pto.vexp %102, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %111 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
              %result_16 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %37[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %37[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %37[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_23 = pto.vlds %37[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %112 = pto.vmul %87, %result_16, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %113 = pto.vmul %88, %result_17, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %114 = pto.vmul %89, %result_18, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %115 = pto.vmul %90, %result_19, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %116 = pto.vmul %91, %result_20, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %117 = pto.vmul %92, %result_21, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %118 = pto.vmul %93, %result_22, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %119 = pto.vmul %94, %result_23, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %112, %111[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %113, %111[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %114, %111[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %115, %111[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %116, %111[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %117, %111[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %118, %111[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %119, %111[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %120 = pto.vadd %112, %103, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %121 = pto.vadd %113, %104, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %122 = pto.vadd %114, %105, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %123 = pto.vadd %115, %106, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %124 = pto.vadd %116, %107, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %125 = pto.vadd %117, %108, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %126 = pto.vadd %118, %109, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %127 = pto.vadd %119, %110, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %120, %37[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %121, %37[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %122, %37[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %123, %37[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %124, %37[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %125, %37[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %126, %37[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %127, %37[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %128 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
              %result_24 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_25 = pto.vlds %41[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_26 = pto.vlds %41[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_27 = pto.vlds %41[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_28 = pto.vlds %41[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_29 = pto.vlds %41[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_30 = pto.vlds %41[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_31 = pto.vlds %41[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %129 = pto.vmul %result_24, %87, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %130 = pto.vmul %result_25, %88, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %131 = pto.vmul %result_26, %89, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %132 = pto.vmul %result_27, %90, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %133 = pto.vmul %result_28, %91, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %134 = pto.vmul %result_29, %92, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %135 = pto.vmul %result_30, %93, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %136 = pto.vmul %result_31, %94, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %129, %128[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %130, %128[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %131, %128[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %132, %128[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %133, %128[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %134, %128[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %135, %128[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %136, %128[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_32 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_33 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_34 = pto.vlds %45[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_35 = pto.vlds %45[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_36 = pto.vlds %45[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_37 = pto.vlds %45[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_38 = pto.vlds %45[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_39 = pto.vlds %45[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %137 = pto.vmul %result_32, %103, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %138 = pto.vmul %result_33, %104, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %139 = pto.vmul %result_34, %105, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %140 = pto.vmul %result_35, %106, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %141 = pto.vmul %result_36, %107, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %142 = pto.vmul %result_37, %108, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %143 = pto.vmul %result_38, %109, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %144 = pto.vmul %result_39, %110, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %137, %44[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %138, %44[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %139, %44[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %140, %44[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %141, %44[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %142, %44[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %143, %44[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %144, %44[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %145 = pto.vadd %129, %137, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %146 = pto.vadd %130, %138, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %147 = pto.vadd %131, %139, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %148 = pto.vadd %132, %140, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %149 = pto.vadd %133, %141, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %150 = pto.vadd %134, %142, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %151 = pto.vadd %135, %143, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %152 = pto.vadd %136, %144, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %145, %41[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %146, %41[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %147, %41[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %148, %41[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %149, %41[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %150, %41[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %151, %41[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %152, %41[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %34[%c0], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %34[%c64], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %34[%c128], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %34[%c192], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %34[%c256], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %34[%c320], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %34[%c384], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %77, %34[%c448], %78 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %49 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %41[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %41[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %41[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %41[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %41[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %41[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %41[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %37[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %37[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %37[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %37[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %54 = pto.vdiv %result, %result_8, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vdiv %result_1, %result_9, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vdiv %result_2, %result_10, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vdiv %result_3, %result_11, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vdiv %result_4, %result_12, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vdiv %result_5, %result_13, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vdiv %result_6, %result_14, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vdiv %result_7, %result_15, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %54, %34[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %34[%c64], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %34[%c128], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %34[%c192], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %34[%c256], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %34[%c320], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %34[%c384], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %34[%c448], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %50 = arith.muli %arg8, %c512 : index
          %51 = pto.addptr %arg1, %50 : <f32, gm> -> <f32, gm>
          %52 = pto.addptr %51, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %36, %52, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
