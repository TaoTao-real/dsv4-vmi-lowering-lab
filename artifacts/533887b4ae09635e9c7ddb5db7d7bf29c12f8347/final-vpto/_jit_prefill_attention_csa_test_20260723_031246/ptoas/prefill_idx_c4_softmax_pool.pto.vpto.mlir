module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
          %27 = arith.addi %11, %arg12 : index
          %28 = arith.index_cast %arg12 : index to i64
          %29 = arith.muli %28, %c128_i64 : i64
          %30 = arith.addi %29, %c1792_i64 : i64
          %31 = pto.castptr %30 : i64 -> !pto.ptr<f32, ub>
          %32 = pto.castptr %29 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %46 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %47 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %49 = pto.pand %47, %mask, %48 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result, %31[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %50 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %50, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %32[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.if %14 {
            %46 = arith.divsi %27, %c4 : index
            %47 = arith.muli %46, %c4 : index
            %48 = arith.subi %27, %47 : index
            %49 = pto.load_scalar %arg2[%46] : !pto.ptr<i32, gm> -> i32
            %50 = arith.index_cast %49 : i32 to index
            %51 = arith.cmpi sge, %50, %c0 : index
            scf.if %51 {
              %52 = arith.muli %50, %c4 : index
              %53 = arith.addi %52, %48 : index
              %54 = arith.muli %53, %c512 : index
              %55 = arith.addi %54, %4 : index
              %56 = pto.addptr %arg3, %55 : <f32, gm> -> <f32, gm>
              %57 = pto.addptr %56, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %57, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                %63 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                %64 = pto.pand %62, %mask, %63 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                pto.vsts %result, %31[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %58 = arith.addi %4, %c256 : index
              %59 = arith.addi %54, %58 : index
              %60 = pto.addptr %arg3, %59 : <f32, gm> -> <f32, gm>
              %61 = pto.addptr %60, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %61, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                %63 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                %64 = pto.pand %62, %mask, %63 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                pto.vsts %result, %32[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
          %33 = arith.addi %10, %arg12 : index
          %34 = arith.addi %arg12, %c4 : index
          %35 = arith.index_cast %34 : index to i64
          %36 = arith.muli %35, %c128_i64 : i64
          %37 = arith.addi %36, %c1792_i64 : i64
          %38 = pto.castptr %37 : i64 -> !pto.ptr<f32, ub>
          %39 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %46 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %49 = pto.pand %47, %mask, %48 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result, %38[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %50 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %50, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %39[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %40 = arith.divsi %33, %c4 : index
          %41 = arith.muli %40, %c4 : index
          %42 = arith.subi %33, %41 : index
          %43 = pto.load_scalar %arg2[%40] : !pto.ptr<i32, gm> -> i32
          %44 = arith.index_cast %43 : i32 to index
          %45 = arith.cmpi sge, %44, %c0 : index
          scf.if %45 {
            %46 = arith.muli %44, %c4 : index
            %47 = arith.addi %46, %42 : index
            %48 = arith.addi %4, %c128 : index
            %49 = arith.muli %47, %c512 : index
            %50 = arith.addi %49, %48 : index
            %51 = pto.addptr %arg3, %50 : <f32, gm> -> <f32, gm>
            %52 = pto.addptr %51, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %52, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %59 = pto.pand %57, %mask, %58 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %result, %38[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %53 = arith.addi %4, %c384 : index
            %54 = arith.addi %49, %53 : index
            %55 = pto.addptr %arg3, %54 : <f32, gm> -> <f32, gm>
            %56 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %56, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %59 = pto.pand %57, %mask, %58 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %result, %39[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %27 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %28 = arith.cmpi sle, %27, %8 : i32
          scf.if %28 {
            %29 = arith.index_cast %27 : i32 to index
            %30 = arith.cmpi sle, %11, %29 : index
            scf.if %30 {
              %31 = arith.remsi %29, %c4 : index
              %32 = arith.cmpi slt, %29, %10 : index
              scf.if %32 {
                %33 = arith.subi %29, %11 : index
                %34 = arith.muli %31, %c256 : index
                %35 = arith.addi %34, %4 : index
                %36 = pto.addptr %arg5, %35 : <f32, gm> -> <f32, gm>
                %37 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %37, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %38 = arith.muli %arg12, %c256 : index
                %39 = arith.addi %38, %4 : index
                %40 = pto.addptr %arg6, %39 : <f32, gm> -> <f32, gm>
                %41 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
                %42 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
                %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %42, %43, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %44 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
                pto.vecscope {
                  %47 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %49 = pto.vadd %result, %result_1, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %50 = pto.pand %47, %mask, %48 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %49, %12[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
                %45 = pto.addptr %arg7, %39 : <f32, gm> -> <f32, gm>
                %46 = pto.addptr %45, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %46, %43, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.vecscope {
                  %47 = arith.index_cast %33 : index to i64
                  %48 = arith.muli %47, %c128_i64 : i64
                  %49 = arith.addi %48, %c1792_i64 : i64
                  %50 = pto.castptr %49 : i64 -> !pto.ptr<f32, ub>
                  %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %51 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %52 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %53 = pto.pand %51, %mask, %52 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %result, %50[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %54 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %54[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              } else {
                %33 = arith.subi %29, %10 : index
                %34 = arith.addi %33, %c4 : index
                %35 = arith.addi %4, %c128 : index
                %36 = arith.muli %31, %c256 : index
                %37 = arith.addi %36, %35 : index
                %38 = pto.addptr %arg5, %37 : <f32, gm> -> <f32, gm>
                %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %39, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %40 = arith.muli %arg12, %c256 : index
                %41 = arith.addi %40, %35 : index
                %42 = pto.addptr %arg6, %41 : <f32, gm> -> <f32, gm>
                %43 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
                %44 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
                %45 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %44, %45, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %46 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
                pto.vecscope {
                  %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %51 = pto.vadd %result, %result_1, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %52 = pto.pand %49, %mask, %50 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %51, %12[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
                %47 = pto.addptr %arg7, %41 : <f32, gm> -> <f32, gm>
                %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %48, %45, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.vecscope {
                  %49 = arith.index_cast %34 : index to i64
                  %50 = arith.muli %49, %c128_i64 : i64
                  %51 = arith.addi %50, %c1792_i64 : i64
                  %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
                  %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %53 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                  %55 = pto.pand %53, %mask, %54 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
                  pto.vsts %result, %52[%c0], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %56 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
                  %result_1 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %56[%c0], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              }
            }
          }
        }
        pto.vecscope {
          %27 = pto.castptr %c896_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %30 = pto.pand %28, %mask, %29 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %result, %12[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %15 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %16 = pto.castptr %c1408_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.vsub %result, %result, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %28, %16[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %17 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %18 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
        %19 = pto.castptr %c1280_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.vexp %result, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %28, %16[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_1 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_1, %18[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.castptr %c2688_i64 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %19[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg12 = %c0 to %c7 step %c1 {
          %27 = arith.cmpi sge, %arg12, %c4 : index
          %28 = arith.ori %27, %14 : i1
          scf.if %28 {
            %29 = arith.index_cast %arg12 : index to i64
            %30 = arith.muli %29, %c128_i64 : i64
            %31 = arith.addi %30, %c1792_i64 : i64
            %32 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %33 = pto.castptr %30 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vmax %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %16[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %34 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %35 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vsub %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %35[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %36 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vexp %result, %47 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %35[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %37 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %38 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vsub %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %38[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %39 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vexp %result, %47 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %38[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %40 = pto.alloc_tile addr = %c1664_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %41 = pto.castptr %c1664_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vmul %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %41[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %42 = pto.alloc_tile addr = %c1664_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vadd %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %41[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %43 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vmul %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %35[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %44 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %45 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %47 = pto.castptr %31 : i64 -> !pto.ptr<f32, ub>
              %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %49 = pto.vmul %result, %result_1, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %51 = pto.pand %50, %mask, %48 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %49, %45[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %46 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vadd %result, %result_1, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %50 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %48, %45[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_2 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_2, %12[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_3 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %18[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_4 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_4, %19[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        %20 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %21 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.vdiv %result, %result_1, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %28, %21[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %22 = arith.muli %1, %c128 : index
        %23 = arith.addi %22, %4 : index
        %24 = pto.addptr %arg8, %23 : <f32, gm> -> <f32, gm>
        %25 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
        %26 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %25, %26, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
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

