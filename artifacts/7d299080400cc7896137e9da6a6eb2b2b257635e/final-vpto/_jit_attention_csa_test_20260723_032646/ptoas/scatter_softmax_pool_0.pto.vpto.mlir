module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @scatter_softmax_pool_0(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i64, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c-1 = arith.constant -1 : index
      %c-8 = arith.constant -8 : index
      %c-4 = arith.constant -4 : index
      %c4608_i64 = arith.constant 4608 : i64
      %c5632_i64 = arith.constant 5632 : i64
      %c0_i64 = arith.constant 0 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c3072_i64 = arith.constant 3072 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c4352_i64 = arith.constant 4352 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %c3 = arith.constant 3 : index
      %c384 = arith.constant 384 : index
      %cst = arith.constant -3.40282347E+38 : f32
      %cst_0 = arith.constant 0.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c256_i64 = arith.constant 256 : i64
      %c64_i32 = arith.constant 64 : i32
      %c192 = arith.constant 192 : index
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
          %22 = arith.muli %arg8, %c512 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c4608_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c5632_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %4, %c256 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %36 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %28[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %28[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %28[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %33[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %33[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %33[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %45 = pto.vadd %result, %result_4, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vadd %result_1, %result_5, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result_2, %result_6, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %result_3, %result_7, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %28[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %46, %28[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %28[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %28[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %37 = arith.muli %10, %c512 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          %40 = arith.addi %37, %c256 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        %12 = arith.index_cast %7 : i64 to index
        %13 = arith.cmpi sge, %12, %c0 : index
        scf.if %13 {
          %22 = arith.muli %5, %c256 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %9, %c256 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %36 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %28[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %28[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %28[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %33[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %33[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %33[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %45 = pto.vadd %result, %result_4, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vadd %result_1, %result_5, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result_2, %result_6, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %result_3, %result_7, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %28[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %46, %28[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %28[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %28[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %37 = arith.muli %12, %c512 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          %40 = arith.addi %37, %c256 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
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
          %27 = pto.castptr %c4608_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
          %29 = pto.castptr %c5632_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %32 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
          %33 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = arith.cmpi sge, %15, %c4 : index
          %35 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
          %36 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          %37 = arith.muli %arg8, %c128 : index
          scf.for %arg9 = %c0 to %c2 step %c1 {
            %38 = arith.muli %arg9, %c64 : index
            %39 = pto.load_scalar %arg7[%26] : !pto.ptr<i32, gm> -> i32
            %40 = arith.index_cast %39 : i32 to index
            %41 = arith.muli %40, %c4 : index
            %42 = arith.addi %41, %24 : index
            %43 = arith.addi %38, %c384 : index
            %44 = arith.muli %42, %c512 : index
            %45 = arith.addi %44, %43 : index
            %46 = pto.addptr %arg0, %45 : <f32, gm> -> <f32, gm>
            %47 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %47, %28, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %59 = pto.vsub %result, %result, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %59, %29[%c0], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %48 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %58 = pto.vexp %result, %57 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %58, %29[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %49 = arith.addi %38, %c128 : index
            %50 = arith.addi %44, %49 : index
            %51 = pto.addptr %arg0, %50 : <f32, gm> -> <f32, gm>
            %52 = pto.addptr %51, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %52, %31, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            scf.for %arg10 = %c0 to %c4 step %c1 {
              %57 = arith.addi %20, %arg10 : index
              pto.vecscope {
                %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
                %58 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %58, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %59 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %59, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              scf.if %34 {
                %58 = arith.divsi %57, %c4 : index
                %59 = arith.remsi %57, %c4 : index
                %60 = arith.addi %25, %58 : index
                %61 = pto.load_scalar %arg7[%60] : !pto.ptr<i32, gm> -> i32
                %62 = arith.index_cast %61 : i32 to index
                %63 = arith.muli %62, %c4 : index
                %64 = arith.addi %63, %59 : index
                %65 = arith.addi %38, %c256 : index
                %66 = arith.muli %64, %c512 : index
                %67 = arith.addi %66, %65 : index
                %68 = pto.addptr %arg0, %67 : <f32, gm> -> <f32, gm>
                %69 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
                %70 = pto.addptr %68, %c0 : <f32, gm> -> <f32, gm>
                %71 = pto.addptr %69, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %70, %71, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %72 = arith.addi %66, %38 : index
                %73 = pto.addptr %arg0, %72 : <f32, gm> -> <f32, gm>
                %74 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
                %75 = pto.addptr %73, %c0 : <f32, gm> -> <f32, gm>
                %76 = pto.addptr %74, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %75, %76, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              } else {
                pto.vecscope {
                  %58 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
                  %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                  pto.vsts %result, %58[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %60 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
                  %result_1 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %60[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              }
              pto.vecscope {
                %58 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
                %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %60 = pto.vmax %result, %result_1, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %60, %32[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %62 = pto.vsub %result, %60, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.vexp %62, %59 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.vsub %result_1, %60, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %65 = pto.vexp %64, %59 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %66 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
                %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %67 = pto.vmul %63, %result_2, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %67, %66[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %68 = pto.vadd %67, %65, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %68, %29[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %69 = pto.vmul %result_3, %63, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %69, %33[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %70 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
                %result_4 = pto.vlds %70[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %71 = pto.vmul %result_4, %65, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %71, %58[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %72 = pto.vadd %69, %71, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %72, %30[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %60, %27[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
            scf.for %arg10 = %c0 to %c3 step %c1 {
              %57 = arith.addi %19, %arg10 : index
              %58 = arith.divsi %57, %c4 : index
              %59 = arith.remsi %57, %c4 : index
              %60 = arith.addi %25, %58 : index
              %61 = pto.load_scalar %arg7[%60] : !pto.ptr<i32, gm> -> i32
              %62 = arith.index_cast %61 : i32 to index
              %63 = arith.muli %62, %c4 : index
              %64 = arith.addi %63, %59 : index
              %65 = arith.muli %64, %c512 : index
              %66 = arith.addi %65, %43 : index
              %67 = pto.addptr %arg0, %66 : <f32, gm> -> <f32, gm>
              %68 = pto.addptr %67, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %68, %35, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %69 = arith.addi %65, %49 : index
              %70 = pto.addptr %arg0, %69 : <f32, gm> -> <f32, gm>
              %71 = pto.addptr %70, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %71, %36, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %72 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
                %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %73 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %74 = pto.vmax %result, %result_1, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %75 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %74, %72[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %76 = pto.vsub %result, %74, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %77 = pto.vexp %76, %73 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %78 = pto.vsub %result_1, %74, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %79 = pto.vexp %78, %73 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %80 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
                %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %81 = pto.vmul %77, %result_2, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %81, %80[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %82 = pto.vadd %81, %79, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %82, %29[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %83 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
                %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %84 = pto.vmul %result_3, %77, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %84, %83[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_4 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %85 = pto.vmul %result_4, %79, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %85, %32[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %86 = pto.vadd %84, %85, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %86, %30[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %74, %27[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
            %53 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %58 = pto.vdiv %result, %result_1, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %58, %27[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %54 = arith.addi %37, %38 : index
            %55 = pto.addptr %arg1, %54 : <f32, gm> -> <f32, gm>
            %56 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %28, %56, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
}
