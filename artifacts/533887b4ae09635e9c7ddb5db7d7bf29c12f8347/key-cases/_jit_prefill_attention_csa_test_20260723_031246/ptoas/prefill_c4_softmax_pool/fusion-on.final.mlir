module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c21504_i64 = arith.constant 21504 : i64
      %c7168_i64 = arith.constant 7168 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c-7 = arith.constant -7 : index
      %c14336_i64 = arith.constant 14336 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c9216_i64 = arith.constant 9216 : i64
      %c10240_i64 = arith.constant 10240 : i64
      %c11264_i64 = arith.constant 11264 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c13312_i64 = arith.constant 13312 : i64
      %c1 = arith.constant 1 : index
      %c2048 = arith.constant 2048 : index
      %c4 = arith.constant 4 : index
      %c1024 = arith.constant 1024 : index
      %c128 = arith.constant 128 : index
      %c512 = arith.constant 512 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c-3 = arith.constant -3 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c7 = arith.constant 7 : index
      %c1536 = arith.constant 1536 : index
      %c1_i64 = arith.constant 1 : i64
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
      %0 = arith.index_cast %arg10 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c256 : index
      %5 = pto.load_scalar %arg0[%1] : !pto.ptr<i32, gm> -> i32
      %6 = arith.index_cast %5 : i32 to index
      %7 = arith.cmpi sge, %6, %c0 : index
      scf.if %7 {
        %8 = pto.load_scalar %arg1[%1] : !pto.ptr<i32, gm> -> i32
        %9 = arith.index_cast %8 : i32 to index
        %10 = arith.addi %9, %c-3 : index
        %11 = arith.addi %9, %c-7 : index
        %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
        %13 = arith.cmpi sge, %9, %c7 : index
        scf.for %arg12 = %c0 to %c4 step %c1 {
          %26 = arith.addi %11, %arg12 : index
          %27 = arith.index_cast %arg12 : index to i64
          %28 = arith.muli %27, %c1024_i64 : i64
          %29 = arith.addi %28, %c14336_i64 : i64
          %30 = pto.castptr %29 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.castptr %28 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %45 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %48 = arith.index_cast %arg13 : i16 to index
              %49 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %49 : i32 -> !pto.mask<b32>, i32
              %50 = arith.index_cast %scalar_out : i32 to index
              %51 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.addptr %12, %48 : <f32, ub> -> <f32, ub>
              pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %50 : index
            }
            %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %30[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_1, %30[%c64], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_2, %30[%c128], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_3, %30[%c192], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %47 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %48 = arith.index_cast %arg13 : i16 to index
              %49 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %49 : i32 -> !pto.mask<b32>, i32
              %50 = arith.index_cast %scalar_out : i32 to index
              %51 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.addptr %12, %48 : <f32, ub> -> <f32, ub>
              pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %50 : index
            }
            %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_4, %31[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_5, %31[%c64], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_6, %31[%c128], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_7, %31[%c192], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.if %13 {
            %45 = arith.divsi %26, %c4 : index
            %46 = arith.muli %45, %c4 : index
            %47 = arith.subi %26, %46 : index
            %48 = pto.load_scalar %arg2[%45] : !pto.ptr<i32, gm> -> i32
            %49 = arith.index_cast %48 : i32 to index
            %50 = arith.cmpi sge, %49, %c0 : index
            scf.if %50 {
              %51 = arith.muli %49, %c4 : index
              %52 = arith.addi %51, %47 : index
              %53 = arith.muli %52, %c2048 : index
              %54 = arith.addi %53, %4 : index
              %55 = pto.addptr %arg3, %54 : <f32, gm> -> <f32, gm>
              %56 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
              %57 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %56, %57, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %30[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %30[%c64], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %30[%c128], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %30[%c192], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %58 = arith.addi %4, %c1024 : index
              %59 = arith.addi %53, %58 : index
              %60 = pto.addptr %arg3, %59 : <f32, gm> -> <f32, gm>
              %61 = pto.addptr %60, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %61, %57, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %31[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %31[%c64], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %31[%c128], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %31[%c192], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
          %32 = arith.addi %10, %arg12 : index
          %33 = arith.addi %arg12, %c4 : index
          %34 = arith.index_cast %33 : index to i64
          %35 = arith.muli %34, %c1024_i64 : i64
          %36 = arith.addi %35, %c14336_i64 : i64
          %37 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.castptr %35 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %45 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %48 = arith.index_cast %arg13 : i16 to index
              %49 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %49 : i32 -> !pto.mask<b32>, i32
              %50 = arith.index_cast %scalar_out : i32 to index
              %51 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.addptr %12, %48 : <f32, ub> -> <f32, ub>
              pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %50 : index
            }
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %result, %37[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_1, %37[%c64], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_2, %37[%c128], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_3, %37[%c192], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %47 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %48 = arith.index_cast %arg13 : i16 to index
              %49 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %49 : i32 -> !pto.mask<b32>, i32
              %50 = arith.index_cast %scalar_out : i32 to index
              %51 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.addptr %12, %48 : <f32, ub> -> <f32, ub>
              pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %50 : index
            }
            %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_4, %38[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_5, %38[%c64], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_6, %38[%c128], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_7, %38[%c192], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %39 = arith.divsi %32, %c4 : index
          %40 = arith.muli %39, %c4 : index
          %41 = arith.subi %32, %40 : index
          %42 = pto.load_scalar %arg2[%39] : !pto.ptr<i32, gm> -> i32
          %43 = arith.index_cast %42 : i32 to index
          %44 = arith.cmpi sge, %43, %c0 : index
          scf.if %44 {
            %45 = arith.muli %43, %c4 : index
            %46 = arith.addi %45, %41 : index
            %47 = arith.addi %4, %c512 : index
            %48 = arith.muli %46, %c2048 : index
            %49 = arith.addi %48, %47 : index
            %50 = pto.addptr %arg3, %49 : <f32, gm> -> <f32, gm>
            %51 = pto.addptr %50, %c0 : <f32, gm> -> <f32, gm>
            %52 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %51, %52, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %result, %37[%c0], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_1, %37[%c64], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_2, %37[%c128], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_3, %37[%c192], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %53 = arith.addi %4, %c1536 : index
            %54 = arith.addi %48, %53 : index
            %55 = pto.addptr %arg3, %54 : <f32, gm> -> <f32, gm>
            %56 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %56, %52, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %result, %38[%c0], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_1, %38[%c64], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_2, %38[%c128], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_3, %38[%c192], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %26 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %27 = arith.cmpi sle, %26, %8 : i32
          scf.if %27 {
            %28 = arith.index_cast %26 : i32 to index
            %29 = arith.cmpi sle, %11, %28 : index
            scf.if %29 {
              %30 = arith.cmpi slt, %28, %10 : index
              %31:2 = scf.if %30 -> (index, index) {
                %47 = arith.subi %28, %11 : index
                scf.yield %4, %47 : index, index
              } else {
                %47 = arith.subi %28, %10 : index
                %48 = arith.addi %47, %c4 : index
                %49 = arith.addi %4, %c512 : index
                scf.yield %49, %48 : index, index
              }
              %32 = arith.remsi %28, %c4 : index
              %33 = arith.muli %32, %c1024 : index
              %34 = arith.addi %33, %31#0 : index
              %35 = pto.addptr %arg5, %34 : <f32, gm> -> <f32, gm>
              %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
              %37 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %36, %37, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %38 = arith.muli %arg12, %c1024 : index
              %39 = arith.addi %38, %31#0 : index
              %40 = pto.addptr %arg6, %39 : <f32, gm> -> <f32, gm>
              %41 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
              %42 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
              %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %42, %43, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %44 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
              pto.vecscope {
                %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %41[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %41[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %41[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %49 = pto.vadd %result, %result_4, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %50 = pto.vadd %result_1, %result_5, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %51 = pto.vadd %result_2, %result_6, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %52 = pto.vadd %result_3, %result_7, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %49, %12[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %50, %12[%c64], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %51, %12[%c128], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %52, %12[%c192], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %45 = pto.addptr %arg7, %39 : <f32, gm> -> <f32, gm>
              %46 = pto.addptr %45, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %46, %43, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %47 = arith.index_cast %31#1 : index to i64
                %48 = arith.muli %47, %c1024_i64 : i64
                %49 = arith.addi %48, %c14336_i64 : i64
                %50 = pto.castptr %49 : i64 -> !pto.ptr<f32, ub>
                %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %41[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %41[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %41[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %50[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %50[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %50[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %50[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %52 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
                %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result_4, %52[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_5, %52[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_6, %52[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_7, %52[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
        }
        pto.vecscope {
          %26 = pto.castptr %c7168_i64 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %26[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %26[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %26[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %12[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_1, %12[%c64], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_2, %12[%c128], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_3, %12[%c192], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %14 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %15 = pto.castptr %c11264_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %27 = pto.vsub %result, %result, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vsub %result_1, %result_1, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vsub %result_2, %result_2, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vsub %result_3, %result_3, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %27, %15[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %15[%c64], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %15[%c128], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %15[%c192], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %16 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %17 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
        %18 = pto.castptr %c10240_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %27 = pto.vexp %result, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vexp %result_1, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vexp %result_2, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vexp %result_3, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %27, %15[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %15[%c64], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %15[%c128], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %15[%c192], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %17[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_5, %17[%c64], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_6, %17[%c128], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_7, %17[%c192], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = pto.castptr %c21504_i64 : i64 -> !pto.ptr<f32, ub>
          %result_8 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %32[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %32[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %32[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_8, %18[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_9, %18[%c64], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_10, %18[%c128], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_11, %18[%c192], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg12 = %c0 to %c7 step %c1 {
          %26 = arith.cmpi sge, %arg12, %c4 : index
          %27 = arith.ori %26, %13 : i1
          scf.if %27 {
            %28 = arith.index_cast %arg12 : index to i64
            %29 = arith.muli %28, %c1024_i64 : i64
            %30 = arith.addi %29, %c14336_i64 : i64
            %31 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %32 = pto.castptr %29 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %32[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %32[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %32[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vmax %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vmax %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmax %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vmax %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %15[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %15[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %15[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %15[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %33 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %34 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vsub %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vsub %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vsub %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vsub %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %34[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %34[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %34[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %34[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %35 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vexp %result, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vexp %result_1, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vexp %result_2, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vexp %result_3, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %34[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %34[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %34[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %34[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %32[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %32[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %32[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vsub %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vsub %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vsub %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vsub %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %37[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %37[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %37[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %37[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %38 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vexp %result, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vexp %result_1, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vexp %result_2, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vexp %result_3, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %37[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %37[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %37[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %37[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %39 = pto.alloc_tile addr = %c13312_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.castptr %c13312_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %17[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %17[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %17[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vmul %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vmul %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmul %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vmul %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %40[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %40[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %40[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %40[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %41 = pto.alloc_tile addr = %c13312_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %40[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %40[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %40[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vadd %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vadd %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vadd %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vadd %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %40[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %40[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %40[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %40[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %42 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %18[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %18[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %18[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vmul %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vmul %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmul %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vmul %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %34[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %34[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %34[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %34[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %43 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %44 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
            pto.vecscope {
              %46 = pto.castptr %30 : i64 -> !pto.ptr<f32, ub>
              %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %46[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %46[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %46[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %37[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %37[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %48 = pto.vmul %result, %result_4, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmul %result_1, %result_5, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vmul %result_2, %result_6, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vmul %result_3, %result_7, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %48, %44[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %44[%c64], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %44[%c128], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %51, %44[%c192], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %45 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %34[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %34[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %44[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %44[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %44[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %47 = pto.vadd %result, %result_4, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vadd %result_1, %result_5, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vadd %result_2, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vadd %result_3, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %47, %44[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %44[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %44[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %44[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_8 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_8, %12[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_9, %12[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_10, %12[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_11, %12[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_12 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %40[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %40[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %40[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_12, %17[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_13, %17[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_14, %17[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_15, %17[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_16 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %44[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %44[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %44[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_16, %18[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_17, %18[%c64], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_18, %18[%c128], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_19, %18[%c192], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        %19 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %20 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %18[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %18[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %18[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %17[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %17[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %17[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %27 = pto.vdiv %result, %result_4, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vdiv %result_1, %result_5, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vdiv %result_2, %result_6, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vdiv %result_3, %result_7, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %27, %20[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %20[%c64], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %20[%c128], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %20[%c192], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %21 = arith.muli %1, %c512 : index
        %22 = arith.addi %21, %4 : index
        %23 = pto.addptr %arg8, %22 : <f32, gm> -> <f32, gm>
        %24 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %24, %25, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      } else {
        %8 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %14 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %15 = arith.index_cast %arg12 : i16 to index
            %16 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %16 : i32 -> !pto.mask<b32>, i32
            %17 = arith.index_cast %scalar_out : i32 to index
            %18 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %19 = pto.addptr %8, %15 : <f32, ub> -> <f32, ub>
            pto.vsts %18, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %17 : index
          }
        }
        %9 = arith.muli %1, %c512 : index
        %10 = arith.addi %9, %4 : index
        %11 = pto.addptr %arg8, %10 : <f32, gm> -> <f32, gm>
        %12 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %13 = pto.addptr %11, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %12, %13, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

