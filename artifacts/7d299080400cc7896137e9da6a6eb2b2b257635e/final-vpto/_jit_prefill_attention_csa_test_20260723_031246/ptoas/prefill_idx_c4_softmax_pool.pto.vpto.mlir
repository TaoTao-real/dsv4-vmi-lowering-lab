module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c7_i16 = arith.constant 7 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c2688_i64 = arith.constant 2688 : i64
      %c896_i64 = arith.constant 896 : i64
      %c128_i64 = arith.constant 128 : i64
      %c-7 = arith.constant -7 : index
      %c1792_i64 = arith.constant 1792 : i64
      %c0_i64 = arith.constant 0 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c1152_i64 = arith.constant 1152 : i64
      %c1280_i64 = arith.constant 1280 : i64
      %c1408_i64 = arith.constant 1408 : i64
      %c1536_i64 = arith.constant 1536 : i64
      %c1664_i64 = arith.constant 1664 : i64
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c512 = arith.constant 512 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c128 = arith.constant 128 : index
      %c0 = arith.constant 0 : index
      %c-3 = arith.constant -3 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c7 = arith.constant 7 : index
      %c384 = arith.constant 384 : index
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg10 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c4 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c32 : index
      %5 = pto.load_scalar %arg0[%1] : !pto.ptr<i32, gm> -> i32
      %6 = arith.index_cast %5 : i32 to index
      %7 = arith.cmpi sge, %6, %c0 : index
      scf.if %7 {
        %8 = pto.load_scalar %arg1[%1] : !pto.ptr<i32, gm> -> i32
        %9 = arith.index_cast %8 : i32 to index
        %10 = arith.addi %9, %c-3 : index
        %11 = arith.addi %9, %c-7 : index
        %12 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
        %13 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
        %14 = arith.cmpi sge, %9, %c7 : index
        scf.for %arg12 = %c0 to %c4 step %c1 {
          %24 = arith.addi %11, %arg12 : index
          %25 = arith.index_cast %arg12 : index to i64
          %26 = arith.muli %25, %c128_i64 : i64
          %27 = arith.addi %26, %c1792_i64 : i64
          %28 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %43 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %46 = pto.pand %44, %mask, %45 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result, %28[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %47 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %29[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.if %14 {
            %43 = arith.divsi %24, %c4 : index
            %44 = arith.muli %43, %c4 : index
            %45 = arith.subi %24, %44 : index
            %46 = pto.load_scalar %arg2[%43] : !pto.ptr<i32, gm> -> i32
            %47 = arith.index_cast %46 : i32 to index
            %48 = arith.cmpi sge, %47, %c0 : index
            scf.if %48 {
              %49 = arith.muli %47, %c4 : index
              %50 = arith.addi %49, %45 : index
              %51 = arith.muli %50, %c512 : index
              %52 = arith.addi %51, %4 : index
              %53 = pto.addptr %arg3, %52 : <f32, gm> -> <f32, gm>
              %54 = pto.addptr %53, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %54, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                %61 = pto.pand %59, %mask, %60 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                pto.vsts %result, %28[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %55 = arith.addi %4, %c256 : index
              %56 = arith.addi %51, %55 : index
              %57 = pto.addptr %arg3, %56 : <f32, gm> -> <f32, gm>
              %58 = pto.addptr %57, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %58, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                %61 = pto.pand %59, %mask, %60 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                pto.vsts %result, %29[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
          %30 = arith.addi %10, %arg12 : index
          %31 = arith.addi %arg12, %c4 : index
          %32 = arith.index_cast %31 : index to i64
          %33 = arith.muli %32, %c128_i64 : i64
          %34 = arith.addi %33, %c1792_i64 : i64
          %35 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %43 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %46 = pto.pand %44, %mask, %45 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result, %35[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %47 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %36[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %37 = arith.divsi %30, %c4 : index
          %38 = arith.muli %37, %c4 : index
          %39 = arith.subi %30, %38 : index
          %40 = pto.load_scalar %arg2[%37] : !pto.ptr<i32, gm> -> i32
          %41 = arith.index_cast %40 : i32 to index
          %42 = arith.cmpi sge, %41, %c0 : index
          scf.if %42 {
            %43 = arith.muli %41, %c4 : index
            %44 = arith.addi %43, %39 : index
            %45 = arith.addi %4, %c128 : index
            %46 = arith.muli %44, %c512 : index
            %47 = arith.addi %46, %45 : index
            %48 = pto.addptr %arg3, %47 : <f32, gm> -> <f32, gm>
            %49 = pto.addptr %48, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %49, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %56 = pto.pand %54, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %result, %35[%c0], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %50 = arith.addi %4, %c384 : index
            %51 = arith.addi %46, %50 : index
            %52 = pto.addptr %arg3, %51 : <f32, gm> -> <f32, gm>
            %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %53, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %56 = pto.pand %54, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %result, %36[%c0], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %24 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %25 = arith.cmpi sle, %24, %8 : i32
          scf.if %25 {
            %26 = arith.index_cast %24 : i32 to index
            %27 = arith.cmpi sle, %11, %26 : index
            scf.if %27 {
              %28 = arith.remsi %26, %c4 : index
              %29 = arith.cmpi slt, %26, %10 : index
              scf.if %29 {
                %30 = arith.subi %26, %11 : index
                %31 = arith.muli %28, %c256 : index
                %32 = arith.addi %31, %4 : index
                %33 = pto.addptr %arg5, %32 : <f32, gm> -> <f32, gm>
                %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %34, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %35 = arith.muli %arg12, %c256 : index
                %36 = arith.addi %35, %4 : index
                %37 = pto.addptr %arg6, %36 : <f32, gm> -> <f32, gm>
                %38 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
                %39 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
                %40 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %39, %40, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %41 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
                pto.vecscope {
                  %44 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %46 = pto.vadd %result, %result_1, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %47 = pto.pand %44, %mask, %45 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %46, %12[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
                %42 = pto.addptr %arg7, %36 : <f32, gm> -> <f32, gm>
                %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %43, %40, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.vecscope {
                  %44 = arith.index_cast %30 : index to i64
                  %45 = arith.muli %44, %c128_i64 : i64
                  %46 = arith.addi %45, %c1792_i64 : i64
                  %47 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
                  %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %48 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %50 = pto.pand %48, %mask, %49 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %result, %47[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %51 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %51[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              } else {
                %30 = arith.subi %26, %10 : index
                %31 = arith.addi %30, %c4 : index
                %32 = arith.addi %4, %c128 : index
                %33 = arith.muli %28, %c256 : index
                %34 = arith.addi %33, %32 : index
                %35 = pto.addptr %arg5, %34 : <f32, gm> -> <f32, gm>
                %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %36, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %37 = arith.muli %arg12, %c256 : index
                %38 = arith.addi %37, %32 : index
                %39 = pto.addptr %arg6, %38 : <f32, gm> -> <f32, gm>
                %40 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
                %41 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
                %42 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %41, %42, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %43 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
                pto.vecscope {
                  %46 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %48 = pto.vadd %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %49 = pto.pand %46, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %48, %12[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
                %44 = pto.addptr %arg7, %38 : <f32, gm> -> <f32, gm>
                %45 = pto.addptr %44, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %45, %42, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.vecscope {
                  %46 = arith.index_cast %31 : index to i64
                  %47 = arith.muli %46, %c128_i64 : i64
                  %48 = arith.addi %47, %c1792_i64 : i64
                  %49 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
                  %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %50 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %51 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %52 = pto.pand %50, %mask, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %result, %49[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %53 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %53[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              }
            }
          }
        }
        %15 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
        %16 = pto.castptr %c1280_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %24 = pto.castptr %c896_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %27 = pto.pand %25, %mask, %26 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %result, %12[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = pto.vsub %result, %result, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.castptr %c1408_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.vexp %28, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %29[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %15[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.castptr %c2688_i64 : i64 -> !pto.ptr<f32, ub>
          %result_1 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_1, %16[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c7_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.cmpi sge, %32, %c4 : index
            %34 = arith.ori %33, %14 : i1
            scf.if %34 {
              %35 = arith.index_cast %32 : index to i64
              %36 = arith.muli %35, %c128_i64 : i64
              %37 = arith.addi %36, %c1792_i64 : i64
              %38 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
              %result_2 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = pto.vmax %result_2, %result_3, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %39, %29[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.vsub %result_4, %39, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
              %42 = pto.vexp %40, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %42, %41[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_5 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vsub %result_5, %result_6, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
              %45 = pto.vexp %43, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %45, %44[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_7 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vmul %result_7, %result_8, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.castptr %c1664_i64 : i64 -> !pto.ptr<f32, ub>
              %48 = pto.vadd %46, %45, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %48, %47[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_9 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %49 = pto.vmul %result_9, %result_7, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %49, %41[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %50 = pto.castptr %37 : i64 -> !pto.ptr<f32, ub>
              %result_10 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmul %result_10, %result_11, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
              %result_12 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_12, %51, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %52[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_13 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_13, %12[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_14 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_14, %15[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %53, %16[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        %17 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %18 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %25 = pto.vdiv %result, %result_1, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %25, %18[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %19 = arith.muli %1, %c128 : index
        %20 = arith.addi %19, %4 : index
        %21 = pto.addptr %arg8, %20 : <f32, gm> -> <f32, gm>
        %22 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
        %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %22, %23, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      } else {
        %8 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %14 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %14, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %10 = arith.muli %1, %c128 : index
        %11 = arith.addi %10, %4 : index
        %12 = pto.addptr %arg8, %11 : <f32, gm> -> <f32, gm>
        %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %9, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
