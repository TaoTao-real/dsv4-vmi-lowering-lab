module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %0 = arith.index_cast %arg10 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c256 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      %5 = pto.load_scalar %arg0[%1] : !pto.ptr<i32, gm> -> i32
      %6 = arith.index_cast %5 : i32 to index
      %7 = arith.cmpi sge, %6, %c0 : index
      scf.if %7 {
        %8 = pto.load_scalar %arg1[%1] : !pto.ptr<i32, gm> -> i32
        %9 = arith.index_cast %8 : i32 to index
        %10 = arith.addi %9, %c-3 : index
        %11 = arith.addi %9, %c-7 : index
        %12 = arith.cmpi sge, %9, %c7 : index
        scf.for %arg12 = %c0 to %c4 step %c1 {
          %19 = arith.addi %11, %arg12 : index
          %20 = arith.index_cast %arg12 : index to i64
          %21 = arith.muli %20, %c1024_i64 : i64
          %22 = arith.addi %21, %c14336_i64 : i64
          pto.vecscope {
            %34 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %35 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
            pto.mem_bar "VST_VLD"
            %36 = pto.castptr %22 : i64 -> !pto.ptr<f32, ub>
            %37 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %36, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
            pto.mem_bar "VV_ALL"
            %38 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
            pto.mem_bar "VST_VLD"
            %39 = pto.castptr %21 : i64 -> !pto.ptr<f32, ub>
            %40 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %39, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          scf.if %12 {
            %34 = arith.divsi %19, %c4 : index
            %35 = arith.muli %34, %c4 : index
            %36 = arith.subi %19, %35 : index
            %37 = pto.load_scalar %arg2[%34] : !pto.ptr<i32, gm> -> i32
            %38 = arith.index_cast %37 : i32 to index
            %39 = arith.cmpi sge, %38, %c0 : index
            scf.if %39 {
              %40 = arith.muli %38, %c4 : index
              %41 = arith.addi %40, %36 : index
              %42 = arith.muli %41, %c2048 : index
              %43 = arith.addi %42, %4 : index
              %44 = pto.addptr %arg3, %43 : <f32, gm> -> <f32, gm>
              %45 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
              %46 = pto.addptr %44, %c0 : <f32, gm> -> <f32, gm>
              %47 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %46, %47, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.vecscope {
                %52 = pto.castptr %22 : i64 -> !pto.ptr<f32, ub>
                %53 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %54 = arith.index_cast %arg13 : i16 to index
                  %55 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %55 : i32 -> !pto.mask<b32>, i32
                  %56 = arith.index_cast %scalar_out : i32 to index
                  %57 = pto.addptr %45, %54 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %58 = pto.addptr %52, %54 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %58[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %56 : index
                }
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %48 = arith.addi %4, %c1024 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %49 = arith.addi %42, %48 : index
              %50 = pto.addptr %arg3, %49 : <f32, gm> -> <f32, gm>
              %51 = pto.addptr %50, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %51, %47, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.vecscope {
                %52 = pto.castptr %21 : i64 -> !pto.ptr<f32, ub>
                %53 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %54 = arith.index_cast %arg13 : i16 to index
                  %55 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %55 : i32 -> !pto.mask<b32>, i32
                  %56 = arith.index_cast %scalar_out : i32 to index
                  %57 = pto.addptr %45, %54 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %58 = pto.addptr %52, %54 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %58[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %56 : index
                }
              }
            }
          }
          %23 = arith.addi %10, %arg12 : index
          %24 = arith.addi %arg12, %c4 : index
          %25 = arith.index_cast %24 : index to i64
          %26 = arith.muli %25, %c1024_i64 : i64
          %27 = arith.addi %26, %c14336_i64 : i64
          pto.vecscope {
            %34 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %35 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
            pto.mem_bar "VST_VLD"
            %36 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
            %37 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %36, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
            pto.mem_bar "VV_ALL"
            %38 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
            pto.mem_bar "VST_VLD"
            %39 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
            %40 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.addptr %34, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %39, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          %28 = arith.divsi %23, %c4 : index
          %29 = arith.muli %28, %c4 : index
          %30 = arith.subi %23, %29 : index
          %31 = pto.load_scalar %arg2[%28] : !pto.ptr<i32, gm> -> i32
          %32 = arith.index_cast %31 : i32 to index
          %33 = arith.cmpi sge, %32, %c0 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          scf.if %33 {
            %34 = arith.muli %32, %c4 : index
            %35 = arith.addi %34, %30 : index
            %36 = arith.addi %4, %c512 : index
            %37 = arith.muli %35, %c2048 : index
            %38 = arith.addi %37, %36 : index
            %39 = pto.addptr %arg3, %38 : <f32, gm> -> <f32, gm>
            %40 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %41 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
            %42 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %41, %42, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %47 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
              %48 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %49 = arith.index_cast %arg13 : i16 to index
                %50 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %50 : i32 -> !pto.mask<b32>, i32
                %51 = arith.index_cast %scalar_out : i32 to index
                %52 = pto.addptr %40, %49 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %53 = pto.addptr %47, %49 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %51 : index
              }
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %43 = arith.addi %4, %c1536 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %44 = arith.addi %37, %43 : index
            %45 = pto.addptr %arg3, %44 : <f32, gm> -> <f32, gm>
            %46 = pto.addptr %45, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %46, %42, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.vecscope {
              %47 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
              %48 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %49 = arith.index_cast %arg13 : i16 to index
                %50 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %50 : i32 -> !pto.mask<b32>, i32
                %51 = arith.index_cast %scalar_out : i32 to index
                %52 = pto.addptr %40, %49 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %53 = pto.addptr %47, %49 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %51 : index
              }
            }
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %19 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %20 = arith.cmpi sle, %19, %8 : i32
          scf.if %20 {
            %21 = arith.index_cast %19 : i32 to index
            %22 = arith.cmpi sle, %11, %21 : index
            scf.if %22 {
              %23 = arith.cmpi slt, %21, %10 : index
              %24:2 = scf.if %23 -> (index, index) {
                %43 = arith.subi %21, %11 : index
                scf.yield %4, %43 : index, index
              } else {
                %43 = arith.subi %21, %10 : index
                %44 = arith.addi %43, %c4 : index
                %45 = arith.addi %4, %c512 : index
                scf.yield %45, %44 : index, index
              }
              %25 = arith.remsi %21, %c4 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              %26 = arith.muli %25, %c1024 : index
              %27 = arith.addi %26, %24#0 : index
              %28 = pto.addptr %arg5, %27 : <f32, gm> -> <f32, gm>
              %29 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
              %30 = pto.addptr %28, %c0 : <f32, gm> -> <f32, gm>
              %31 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %30, %31, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %32 = arith.muli %arg12, %c1024 : index
              %33 = arith.addi %32, %24#0 : index
              %34 = pto.addptr %arg6, %33 : <f32, gm> -> <f32, gm>
              %35 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
              %36 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
              %37 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %36, %37, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              pto.vecscope {
                %43 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %44 = arith.index_cast %arg13 : i16 to index
                  %45 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %45 : i32 -> !pto.mask<b32>, i32
                  %46 = arith.index_cast %scalar_out : i32 to index
                  %47 = pto.addptr %35, %44 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %48 = pto.addptr %29, %44 : <f32, ub> -> <f32, ub>
                  %result_1 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %49 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %49, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %46 : index
                }
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
              %38 = pto.addptr %arg7, %33 : <f32, gm> -> <f32, gm>
              %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %39, %37, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              %40 = arith.index_cast %24#1 : index to i64
              %41 = arith.muli %40, %c1024_i64 : i64
              %42 = arith.addi %41, %c14336_i64 : i64
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              pto.vecscope {
                %43 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
                %44 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %47 = arith.index_cast %arg13 : i16 to index
                  %48 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %48 : i32 -> !pto.mask<b32>, i32
                  %49 = arith.index_cast %scalar_out : i32 to index
                  %50 = pto.addptr %35, %47 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %51 = pto.addptr %43, %47 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %49 : index
                }
                %45 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
                %46 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %47 = arith.index_cast %arg13 : i16 to index
                  %48 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %48 : i32 -> !pto.mask<b32>, i32
                  %49 = arith.index_cast %scalar_out : i32 to index
                  %50 = pto.addptr %29, %47 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %51 = pto.addptr %45, %47 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %49 : index
                }
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
            }
          }
        }
        pto.vecscope {
          %19 = pto.castptr %c7168_i64 : i64 -> !pto.ptr<f32, ub>
          %20 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = pto.addptr %19, %32 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.addptr %20, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
          pto.mem_bar "VST_VLD"
          %22 = pto.castptr %c11264_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = pto.addptr %20, %32 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vsub %result, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.addptr %22, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
          pto.mem_bar "VST_VLD"
          %24 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = pto.addptr %22, %32 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
          pto.mem_bar "VST_VLD"
          %25 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
          %26 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = pto.addptr %22, %32 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.addptr %25, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
          %27 = pto.castptr %c21504_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %c10240_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = pto.addptr %27, %32 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.addptr %28, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
          pto.mem_bar "VV_ALL"
          scf.for %arg12 = %c0_i16 to %c7_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.cmpi sge, %32, %c4 : index
            %34 = arith.ori %33, %12 : i1
            scf.if %34 {
              %35 = arith.index_cast %32 : index to i64
              %36 = arith.muli %35, %c1024_i64 : i64
              %37 = arith.addi %36, %c14336_i64 : i64
              %38 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
              %39 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %20, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %38, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vmax %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.addptr %22, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %62, %63[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %40 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %41 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %20, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %22, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vsub %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.addptr %40, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %62, %63[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %42 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %40, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %61, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %43 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
              %44 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %38, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %22, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vsub %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.addptr %43, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %62, %63[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %45 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %43, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %61, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %46 = pto.castptr %c13312_i64 : i64 -> !pto.ptr<f32, ub>
              %47 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %40, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %25, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vmul %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.addptr %46, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %62, %63[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %48 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %46, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %43, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %62, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %49 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %28, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %40, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vmul %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %62, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %50 = pto.castptr %37 : i64 -> !pto.ptr<f32, ub>
              %51 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
              %52 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %50, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %43, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vmul %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.addptr %51, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %62, %63[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %53 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %40, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %51, %57 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %62, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %54 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %22, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %20, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %55 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %46, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %25, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
              pto.mem_bar "VST_VLD"
              %56 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %57 = arith.index_cast %arg13 : i16 to index
                %58 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
                %59 = arith.index_cast %scalar_out : i32 to index
                %60 = pto.addptr %51, %57 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %61 = pto.addptr %28, %57 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %59 : index
              }
            }
            pto.mem_bar "VV_ALL"
          }
          pto.mem_bar "VV_ALL"
          %30 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg12 : i16 to index
            %33 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = pto.addptr %28, %32 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.addptr %25, %32 : <f32, ub> -> <f32, ub>
            %result_1 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vdiv %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.addptr %30, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %37, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %13 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        %14 = arith.muli %1, %c512 : index
        %15 = arith.addi %14, %4 : index
        %16 = pto.addptr %arg8, %15 : <f32, gm> -> <f32, gm>
        %17 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        %18 = pto.addptr %16, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %17, %18, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      } else {
        pto.vecscope {
          %14 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
          %15 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %16 = arith.index_cast %arg12 : i16 to index
            %17 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %17 : i32 -> !pto.mask<b32>, i32
            %18 = arith.index_cast %scalar_out : i32 to index
            %19 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %20 = pto.addptr %14, %16 : <f32, ub> -> <f32, ub>
            pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %18 : index
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        %8 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = arith.muli %1, %c512 : index
        %10 = arith.addi %9, %4 : index
        %11 = pto.addptr %arg8, %10 : <f32, gm> -> <f32, gm>
        %12 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %13 = pto.addptr %11, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %12, %13, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
