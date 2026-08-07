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
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
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
          %21 = arith.addi %11, %arg12 : index
          %22 = arith.index_cast %arg12 : index to i64
          %23 = arith.muli %22, %c128_i64 : i64
          %24 = arith.addi %23, %c1792_i64 : i64
          %25 = pto.castptr %24 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
          %27 = pto.castptr %23 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %44 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %44, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %45 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          scf.if %14 {
            %44 = arith.divsi %21, %c4 : index
            %45 = arith.muli %44, %c4 : index
            %46 = arith.subi %21, %45 : index
            %47 = pto.load_scalar %arg2[%44] : !pto.ptr<i32, gm> -> i32
            %48 = arith.index_cast %47 : i32 to index
            %49 = arith.cmpi sge, %48, %c0 : index
            scf.if %49 {
              %50 = arith.muli %48, %c4 : index
              %51 = arith.addi %50, %46 : index
              %52 = arith.muli %51, %c512 : index
              %53 = arith.addi %52, %4 : index
              %54 = pto.addptr %arg3, %53 : <f32, gm> -> <f32, gm>
              %55 = pto.addptr %54, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %55, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.vecscope {
                %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                pto.vsts %result, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %56 = arith.addi %4, %c256 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %57 = arith.addi %52, %56 : index
              %58 = pto.addptr %arg3, %57 : <f32, gm> -> <f32, gm>
              %59 = pto.addptr %58, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %59, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.vecscope {
                %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                pto.vsts %result, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
          }
          %29 = arith.addi %10, %arg12 : index
          %30 = arith.addi %arg12, %c4 : index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c128_i64 : i64
          %33 = arith.addi %32, %c1792_i64 : i64
          %34 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.addptr %34, %c0 : <f32, ub> -> <f32, ub>
          %36 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %44 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %44, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %45 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          %38 = arith.divsi %29, %c4 : index
          %39 = arith.muli %38, %c4 : index
          %40 = arith.subi %29, %39 : index
          %41 = pto.load_scalar %arg2[%38] : !pto.ptr<i32, gm> -> i32
          %42 = arith.index_cast %41 : i32 to index
          %43 = arith.cmpi sge, %42, %c0 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          scf.if %43 {
            %44 = arith.muli %42, %c4 : index
            %45 = arith.addi %44, %40 : index
            %46 = arith.addi %4, %c128 : index
            %47 = arith.muli %45, %c512 : index
            %48 = arith.addi %47, %46 : index
            %49 = pto.addptr %arg3, %48 : <f32, gm> -> <f32, gm>
            %50 = pto.addptr %49, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %50, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              pto.vsts %result, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %51 = arith.addi %4, %c384 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %52 = arith.addi %47, %51 : index
            %53 = pto.addptr %arg3, %52 : <f32, gm> -> <f32, gm>
            %54 = pto.addptr %53, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %54, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.vecscope {
              %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              pto.vsts %result, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %21 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %22 = arith.cmpi sle, %21, %8 : i32
          scf.if %22 {
            %23 = arith.index_cast %21 : i32 to index
            %24 = arith.cmpi sle, %11, %23 : index
            scf.if %24 {
              %25 = arith.remsi %23, %c4 : index
              %26 = arith.cmpi slt, %23, %10 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              scf.if %26 {
                %27 = arith.subi %23, %11 : index
                %28 = arith.muli %25, %c256 : index
                %29 = arith.addi %28, %4 : index
                %30 = pto.addptr %arg5, %29 : <f32, gm> -> <f32, gm>
                %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %31, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %32 = arith.muli %arg12, %c256 : index
                %33 = arith.addi %32, %4 : index
                %34 = pto.addptr %arg6, %33 : <f32, gm> -> <f32, gm>
                %35 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
                %36 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
                %37 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %36, %37, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
                pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
                pto.vecscope {
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %43 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %43, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
                pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
                pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
                %38 = pto.addptr %arg7, %33 : <f32, gm> -> <f32, gm>
                %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %39, %37, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
                %40 = arith.index_cast %27 : index to i64
                %41 = arith.muli %40, %c128_i64 : i64
                %42 = arith.addi %41, %c1792_i64 : i64
                pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
                pto.vecscope {
                  %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %43 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
                  %44 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  pto.vsts %result, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %45 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
                  %46 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
                  pto.vsts %result_1, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              } else {
                %27 = arith.subi %23, %10 : index
                %28 = arith.addi %27, %c4 : index
                %29 = arith.addi %4, %c128 : index
                %30 = arith.muli %25, %c256 : index
                %31 = arith.addi %30, %29 : index
                %32 = pto.addptr %arg5, %31 : <f32, gm> -> <f32, gm>
                %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %33, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %34 = arith.muli %arg12, %c256 : index
                %35 = arith.addi %34, %29 : index
                %36 = pto.addptr %arg6, %35 : <f32, gm> -> <f32, gm>
                %37 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
                %38 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
                %39 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %38, %39, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
                pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
                pto.vecscope {
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %45 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %45, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
                pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID7>]
                pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID7>]
                %40 = pto.addptr %arg7, %35 : <f32, gm> -> <f32, gm>
                %41 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
                pto.copy_gm_to_ubuf %41, %39, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
                %42 = arith.index_cast %28 : index to i64
                %43 = arith.muli %42, %c128_i64 : i64
                %44 = arith.addi %43, %c1792_i64 : i64
                pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
                pto.vecscope {
                  %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %45 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
                  %46 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
                  %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
                  pto.vsts %result, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %47 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
                  %48 = pto.addptr %47, %c0 : <f32, ub> -> <f32, ub>
                  pto.vsts %result_1, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
            }
          }
        }
        %15 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %21 = pto.castptr %c896_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vsub %result_1, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.castptr %c1408_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_2 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vexp %result_2, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_3 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.castptr %c1152_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_3, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %29 = pto.castptr %c2688_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
          %result_4 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.castptr %c1280_i64 : i64 -> !pto.ptr<f32, ub>
          %32 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_4, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c7_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg12 : i16 to index
            %35 = arith.cmpi sge, %34, %c4 : index
            %36 = arith.ori %35, %14 : i1
            scf.if %36 {
              %37 = arith.index_cast %34 : index to i64
              %38 = arith.muli %37, %c128_i64 : i64
              %39 = arith.addi %38, %c1792_i64 : i64
              %result_7 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
              %41 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.vmax %result_7, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %42, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_9 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vsub %result_9, %result_10, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
              %45 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %43, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_11 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vexp %result_11, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_12 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vsub %result_12, %result_13, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
              %49 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %47, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_14 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vexp %result_14, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %50, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_15 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmul %result_15, %result_16, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.castptr %c1664_i64 : i64 -> !pto.ptr<f32, ub>
              %53 = pto.addptr %52, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %51, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_17 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.vadd %result_17, %result_18, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %54, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_19 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %55 = pto.vmul %result_19, %result_20, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %55, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %56 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
              %57 = pto.addptr %56, %c0 : <f32, ub> -> <f32, ub>
              %result_21 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.vmul %result_21, %result_22, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_23 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_24 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.vadd %result_23, %result_24, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %59, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_25 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_25, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_26 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_26, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_27 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_27, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %result_5 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vdiv %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %17 = arith.muli %1, %c128 : index
        %18 = arith.addi %17, %4 : index
        %19 = pto.addptr %arg8, %18 : <f32, gm> -> <f32, gm>
        %20 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %16, %20, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      } else {
        %8 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %14 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %14, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        %10 = arith.muli %1, %c128 : index
        %11 = arith.addi %10, %4 : index
        %12 = pto.addptr %arg8, %11 : <f32, gm> -> <f32, gm>
        %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %9, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
