module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c7_i16 = arith.constant 7 : i16
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
          %23 = arith.addi %11, %arg12 : index
          %24 = arith.index_cast %arg12 : index to i64
          %25 = arith.muli %24, %c1024_i64 : i64
          %26 = arith.addi %25, %c14336_i64 : i64
          %27 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %25 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %42 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %45 = arith.index_cast %arg13 : i16 to index
              %46 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
              %47 = arith.index_cast %scalar_out : i32 to index
              %48 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.addptr %12, %45 : <f32, ub> -> <f32, ub>
              pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %47 : index
            }
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %27[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_1, %27[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_2, %27[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_3, %27[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %45 = arith.index_cast %arg13 : i16 to index
              %46 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
              %47 = arith.index_cast %scalar_out : i32 to index
              %48 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.addptr %12, %45 : <f32, ub> -> <f32, ub>
              pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %47 : index
            }
            %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_4, %28[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_5, %28[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_6, %28[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_7, %28[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.if %13 {
            %42 = arith.divsi %23, %c4 : index
            %43 = arith.muli %42, %c4 : index
            %44 = arith.subi %23, %43 : index
            %45 = pto.load_scalar %arg2[%42] : !pto.ptr<i32, gm> -> i32
            %46 = arith.index_cast %45 : i32 to index
            %47 = arith.cmpi sge, %46, %c0 : index
            scf.if %47 {
              %48 = arith.muli %46, %c4 : index
              %49 = arith.addi %48, %44 : index
              %50 = arith.muli %49, %c2048 : index
              %51 = arith.addi %50, %4 : index
              %52 = pto.addptr %arg3, %51 : <f32, gm> -> <f32, gm>
              %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
              %54 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %53, %54, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %27[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %27[%c64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %27[%c128], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %27[%c192], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %55 = arith.addi %4, %c1024 : index
              %56 = arith.addi %50, %55 : index
              %57 = pto.addptr %arg3, %56 : <f32, gm> -> <f32, gm>
              %58 = pto.addptr %57, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %58, %54, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %28[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %28[%c64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %28[%c128], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %28[%c192], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
          %29 = arith.addi %10, %arg12 : index
          %30 = arith.addi %arg12, %c4 : index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c1024_i64 : i64
          %33 = arith.addi %32, %c14336_i64 : i64
          %34 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %42 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %45 = arith.index_cast %arg13 : i16 to index
              %46 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
              %47 = arith.index_cast %scalar_out : i32 to index
              %48 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.addptr %12, %45 : <f32, ub> -> <f32, ub>
              pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %47 : index
            }
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %result, %34[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_1, %34[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_2, %34[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_3, %34[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %45 = arith.index_cast %arg13 : i16 to index
              %46 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
              %47 = arith.index_cast %scalar_out : i32 to index
              %48 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.addptr %12, %45 : <f32, ub> -> <f32, ub>
              pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %47 : index
            }
            %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_4, %35[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_5, %35[%c64], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_6, %35[%c128], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %result_7, %35[%c192], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %36 = arith.divsi %29, %c4 : index
          %37 = arith.muli %36, %c4 : index
          %38 = arith.subi %29, %37 : index
          %39 = pto.load_scalar %arg2[%36] : !pto.ptr<i32, gm> -> i32
          %40 = arith.index_cast %39 : i32 to index
          %41 = arith.cmpi sge, %40, %c0 : index
          scf.if %41 {
            %42 = arith.muli %40, %c4 : index
            %43 = arith.addi %42, %38 : index
            %44 = arith.addi %4, %c512 : index
            %45 = arith.muli %43, %c2048 : index
            %46 = arith.addi %45, %44 : index
            %47 = pto.addptr %arg3, %46 : <f32, gm> -> <f32, gm>
            %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
            %49 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %48, %49, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %result, %34[%c0], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_1, %34[%c64], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_2, %34[%c128], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_3, %34[%c192], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %50 = arith.addi %4, %c1536 : index
            %51 = arith.addi %45, %50 : index
            %52 = pto.addptr %arg3, %51 : <f32, gm> -> <f32, gm>
            %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %53, %49, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %result, %35[%c0], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_1, %35[%c64], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_2, %35[%c128], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_3, %35[%c192], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %23 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %24 = arith.cmpi sle, %23, %8 : i32
          scf.if %24 {
            %25 = arith.index_cast %23 : i32 to index
            %26 = arith.cmpi sle, %11, %25 : index
            scf.if %26 {
              %27 = arith.cmpi slt, %25, %10 : index
              %28:2 = scf.if %27 -> (index, index) {
                %44 = arith.subi %25, %11 : index
                scf.yield %4, %44 : index, index
              } else {
                %44 = arith.subi %25, %10 : index
                %45 = arith.addi %44, %c4 : index
                %46 = arith.addi %4, %c512 : index
                scf.yield %46, %45 : index, index
              }
              %29 = arith.remsi %25, %c4 : index
              %30 = arith.muli %29, %c1024 : index
              %31 = arith.addi %30, %28#0 : index
              %32 = pto.addptr %arg5, %31 : <f32, gm> -> <f32, gm>
              %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
              %34 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %33, %34, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %35 = arith.muli %arg12, %c1024 : index
              %36 = arith.addi %35, %28#0 : index
              %37 = pto.addptr %arg6, %36 : <f32, gm> -> <f32, gm>
              %38 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
              %39 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
              %40 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %39, %40, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %41 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
              pto.vecscope {
                %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %38[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %38[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %38[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %46 = pto.vadd %result, %result_4, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %47 = pto.vadd %result_1, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %48 = pto.vadd %result_2, %result_6, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %49 = pto.vadd %result_3, %result_7, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %12[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %47, %12[%c64], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %48, %12[%c128], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %49, %12[%c192], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %42 = pto.addptr %arg7, %36 : <f32, gm> -> <f32, gm>
              %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %43, %40, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.vecscope {
                %44 = arith.index_cast %28#1 : index to i64
                %45 = arith.muli %44, %c1024_i64 : i64
                %46 = arith.addi %45, %c14336_i64 : i64
                %47 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
                %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %38[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %38[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %38[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %47[%c0], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_1, %47[%c64], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_2, %47[%c128], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_3, %47[%c192], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %49 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
                %result_4 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_5 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_6 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result_4, %49[%c0], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_5, %49[%c64], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_6, %49[%c128], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %result_7, %49[%c192], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
        }
        %14 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
        %15 = pto.castptr %c10240_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %23 = pto.castptr %c7168_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %23[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %23[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %23[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %12[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_1, %12[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_2, %12[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_3, %12[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.vsub %result, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vsub %result_1, %result_1, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vsub %result_2, %result_2, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vsub %result_3, %result_3, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.castptr %c11264_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.vexp %26, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vexp %27, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vexp %28, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vexp %29, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %30[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %30[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %30[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %30[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %31, %14[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %14[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %14[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %14[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.castptr %c21504_i64 : i64 -> !pto.ptr<f32, ub>
          %result_4 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %35[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %35[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %35[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %15[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_5, %15[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_6, %15[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %result_7, %15[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c7_i16 step %c1_i16  : i16 {
            %36 = arith.index_cast %arg12 : i16 to index
            %37 = arith.cmpi sge, %36, %c4 : index
            %38 = arith.ori %37, %13 : i1
            scf.if %38 {
              %39 = arith.index_cast %36 : index to i64
              %40 = arith.muli %39, %c1024_i64 : i64
              %41 = arith.addi %40, %c14336_i64 : i64
              %42 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
              %result_8 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %42[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %42[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %42[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vmax %result_8, %result_12, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.vmax %result_9, %result_13, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vmax %result_10, %result_14, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.vmax %result_11, %result_15, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %30[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %44, %30[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %45, %30[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %46, %30[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_16 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vsub %result_16, %43, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vsub %result_17, %44, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vsub %result_18, %45, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vsub %result_19, %46, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %52 = pto.vexp %47, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %53 = pto.vexp %48, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %54 = pto.vexp %49, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %55 = pto.vexp %50, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %52, %51[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %53, %51[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %54, %51[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %55, %51[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_20 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %42[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %42[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_23 = pto.vlds %42[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_24 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_25 = pto.vlds %30[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_26 = pto.vlds %30[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_27 = pto.vlds %30[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vsub %result_20, %result_24, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vsub %result_21, %result_25, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vsub %result_22, %result_26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.vsub %result_23, %result_27, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
              %61 = pto.vexp %56, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %62 = pto.vexp %57, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %63 = pto.vexp %58, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.vexp %59, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %61, %60[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %62, %60[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %63, %60[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %64, %60[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_28 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_29 = pto.vlds %51[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_30 = pto.vlds %51[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_31 = pto.vlds %51[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_32 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_33 = pto.vlds %14[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_34 = pto.vlds %14[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_35 = pto.vlds %14[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.vmul %result_28, %result_32, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vmul %result_29, %result_33, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vmul %result_30, %result_34, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = pto.vmul %result_31, %result_35, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.castptr %c13312_i64 : i64 -> !pto.ptr<f32, ub>
              %70 = pto.vadd %65, %61, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vadd %66, %62, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vadd %67, %63, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vadd %68, %64, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %69[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %69[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %69[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %69[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_36 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_37 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_38 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_39 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result_36, %result_28, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmul %result_37, %result_29, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmul %result_38, %result_30, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vmul %result_39, %result_31, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %51[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %51[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %51[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %77, %51[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %78 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
              %result_40 = pto.vlds %78[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_41 = pto.vlds %78[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_42 = pto.vlds %78[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_43 = pto.vlds %78[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_44 = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_45 = pto.vlds %60[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_46 = pto.vlds %60[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_47 = pto.vlds %60[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = pto.vmul %result_40, %result_44, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vmul %result_41, %result_45, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vmul %result_42, %result_46, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vmul %result_43, %result_47, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
              %result_48 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_49 = pto.vlds %51[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_50 = pto.vlds %51[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_51 = pto.vlds %51[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %84 = pto.vadd %result_48, %79, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vadd %result_49, %80, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vadd %result_50, %81, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vadd %result_51, %82, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %84, %83[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %83[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %83[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %83[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_52 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_53 = pto.vlds %30[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_54 = pto.vlds %30[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_55 = pto.vlds %30[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_52, %12[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_53, %12[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_54, %12[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_55, %12[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_56 = pto.vlds %69[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_57 = pto.vlds %69[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_58 = pto.vlds %69[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_59 = pto.vlds %69[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_56, %14[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_57, %14[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_58, %14[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %result_59, %14[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %15[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %15[%c64], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %15[%c128], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %15[%c192], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        %16 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %17 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %result = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %14[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %14[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %14[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %24 = pto.vdiv %result, %result_4, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vdiv %result_1, %result_5, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vdiv %result_2, %result_6, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vdiv %result_3, %result_7, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %24, %17[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %25, %17[%c64], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %26, %17[%c128], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %27, %17[%c192], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %18 = arith.muli %1, %c512 : index
        %19 = arith.addi %18, %4 : index
        %20 = pto.addptr %arg8, %19 : <f32, gm> -> <f32, gm>
        %21 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
        %22 = pto.addptr %20, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %21, %22, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
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
