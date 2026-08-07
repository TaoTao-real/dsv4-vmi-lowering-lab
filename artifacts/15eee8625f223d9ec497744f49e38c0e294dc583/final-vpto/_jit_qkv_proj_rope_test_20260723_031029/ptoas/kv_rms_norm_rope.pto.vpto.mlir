module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @kv_rms_norm_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c6208_i64 = arith.constant 6208 : i64
      %c14912_i64 = arith.constant 14912 : i64
      %c2080_i64 = arith.constant 2080 : i64
      %c12864_i64 = arith.constant 12864 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32_i64 = arith.constant 32 : i64
      %c6176_i64 = arith.constant 6176 : i64
      %c10560_i64 = arith.constant 10560 : i64
      %c8256_i64 = arith.constant 8256 : i64
      %c10304_i64 = arith.constant 10304 : i64
      %c12608_i64 = arith.constant 12608 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %cst_0 = arith.constant 0.001953125 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c6 = arith.constant 6 : index
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c384 = arith.constant 384 : index
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
      %c128_i64 = arith.constant 128 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c448 = arith.constant 448 : index
      %c64_i32 = arith.constant 64 : i32
      %cst_5 = arith.constant -1.000000e+00 : f32
      %c2048_i64 = arith.constant 2048 : i64
      %c8_i32 = arith.constant 8 : i32
      %c4096 = arith.constant 4096 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c5 = arith.constant 5 : index
      %c7 = arith.constant 7 : index
      %0 = arith.index_cast %arg6 : i32 to index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      %1 = pto.castptr %c6208_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %36 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %36, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %3 = arith.muli %0, %c4096 : index
      %4 = pto.castptr %c14912_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      %6 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c2 {
        %36 = arith.muli %arg8, %c64 : index
        %37 = arith.addi %36, %c64 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %38 = arith.addi %3, %36 : index
        %39 = pto.addptr %arg0, %38 : <f32, gm> -> <f32, gm>
        %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %40, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %41 = arith.addi %3, %37 : index
        %42 = pto.addptr %arg0, %41 : <f32, gm> -> <f32, gm>
        %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %43, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %45 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %57 = arith.index_cast %arg9 : i16 to index
            %58 = arith.muli %57, %c64 : index
            %result_13 = pto.vlds %4[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_13, %result_13, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %45[%58], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %45[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %45[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %45[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %45[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %45[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %45[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vcadd %result, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcadd %result_6, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vcadd %result_7, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vcadd %result_8, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcadd %result_9, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcadd %result_10, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vcadd %result_11, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vcadd %result_12, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %48, %8[%c0], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %8[%c1], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %8[%c2], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %8[%c3], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %8[%c4], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %8[%c5], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %8[%c6], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %55, %8[%c7], %56 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %44 = pto.alloc_tile addr = %c14912_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %46 = pto.vadd %result, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %5[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c64 : index
            %result = pto.vlds %6[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result, %result, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %49, %9[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %45 = pto.castptr %c6176_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %9[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %9[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %9[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %9[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %9[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %9[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %9[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.vcadd %result, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcadd %result_6, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcadd %result_7, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vcadd %result_8, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vcadd %result_9, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcadd %result_10, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcadd %result_11, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vcadd %result_12, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %47, %45[%c0], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %45[%c1], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %45[%c2], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %45[%c3], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %45[%c4], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %45[%c5], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %45[%c6], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %45[%c7], %55 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_13 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %56 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
          %result_14 = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %57 = pto.vadd %result_13, %result_14, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %57, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %10 = pto.castptr %c10560_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %36 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %36, %5[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %37 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %37, %5[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %38 = pto.vsqrt %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vmuls %38, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %40 = pto.vadds %39, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %41 = pto.vdiv %40, %38, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %42 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %11 = pto.castptr %c6208_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c14912_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg8 = %c0 to %c6 step %c2 {
        %36 = arith.muli %arg8, %c64 : index
        %37 = arith.addi %36, %c64 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        %38 = arith.addi %3, %36 : index
        %39 = pto.addptr %arg0, %38 : <f32, gm> -> <f32, gm>
        %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %40, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %41 = pto.addptr %arg2, %36 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %41, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        %42 = arith.addi %3, %37 : index
        %43 = pto.addptr %arg0, %42 : <f32, gm> -> <f32, gm>
        %44 = pto.addptr %43, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %44, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %45 = pto.addptr %arg2, %37 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %45, %12, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %51 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %51[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %52 = pto.vcvt %result, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %53 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg9 : i16 to index
            %result_6 = pto.vlds %10[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vdup %result_6, %55 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = arith.muli %56, %c64 : index
            %result_7 = pto.vlds %4[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_7, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %4[%58], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %46 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %52 = arith.index_cast %arg9 : i16 to index
            %53 = arith.muli %52, %c64 : index
            %result_6 = pto.vlds %4[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_6, %result, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %54, %4[%53], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %52 = arith.index_cast %arg9 : i16 to index
            %53 = arith.muli %52, %c64 : index
            %54 = pto.addptr %4, %53 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vcvt %result_6, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %56 = pto.addptr %14, %53 : <bf16, ub> -> <bf16, ub>
            pto.vsts %55, %56[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.barrier <PIPE_MTE3>
        %47 = pto.addptr %arg1, %38 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %14, %47, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %50 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %50[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %52 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %53 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg9 : i16 to index
            %result_6 = pto.vlds %10[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vdup %result_6, %54 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = arith.muli %56, %c64 : index
            %result_7 = pto.vlds %6[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_7, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %6[%58], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %48 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %52 = arith.index_cast %arg9 : i16 to index
            %53 = arith.muli %52, %c64 : index
            %result_6 = pto.vlds %6[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_6, %result, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %54, %6[%53], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %52 = arith.index_cast %arg9 : i16 to index
            %53 = arith.muli %52, %c64 : index
            %54 = pto.addptr %6, %53 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vcvt %result_6, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %56 = pto.addptr %15, %53 : <bf16, ub> -> <bf16, ub>
            pto.vsts %55, %56[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.barrier <PIPE_MTE3>
        %49 = pto.addptr %arg1, %42 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %15, %49, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      }
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      %16 = arith.addi %3, %c384 : index
      %17 = pto.addptr %arg0, %16 : <f32, gm> -> <f32, gm>
      %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %18, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %19 = pto.addptr %arg2, %c384 : <bf16, gm> -> <bf16, gm>
      %20 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %19, %20, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %37 = pto.addptr %20, %c0 : <bf16, ub> -> <bf16, ub>
        %result = pto.vlds %37[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %38 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %38, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %10[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vdup %result, %37 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %4[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_6, %39, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %4[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %21 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %result, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %4[%39], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %4, %39 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result_6, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %42 = pto.addptr %14, %39 : <bf16, ub> -> <bf16, ub>
          pto.vsts %41, %42[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
      %22 = pto.addptr %arg1, %16 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %14, %22, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID3>]
      %23 = pto.addptr %arg2, %c448 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %23, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
      pto.vecscope {
        %36 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
        %result = pto.vlds %36[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %37 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %38 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %38, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      %24 = arith.addi %3, %c448 : index
      %25 = pto.addptr %arg0, %24 : <f32, gm> -> <f32, gm>
      %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %26, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
      pto.vecscope {
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %10[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vdup %result, %36 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %4[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_6, %39, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %4[%40], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.vecscope {
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %result, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %4[%39], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %27 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.vdup %cst_2, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg8 : i16 to index
          %40 = arith.muli %39, %c64 : index
          pto.vsts %37, %6[%40], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %28 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %36 = arith.index_cast %arg8 : index to i32
        pto.store %36, %28[%arg8] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %result = pto.vlds %28[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.vcvt %result, %36 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %37, %13[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg8 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_6, %37, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %6[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vmuls %43, %cst_3, %38 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %13[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg8 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %13[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vcvt %result_6, %36 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %43, %28[%42], %38 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %39 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg8 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %28[%42] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %43 = pto.vcvt %result_6, %36 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %13[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vcvt %43, %36 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %44, %39[%42], %38 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg8 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %13[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmuls %result_6, %cst_4, %38 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vsub %result_7, %43, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %13[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %45 = pto.vadds %result_7, %cst_2, %38 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmuls %44, %cst_4, %38 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %1[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = pto.vsub %45, %46, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %6[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %40 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg8 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vcvt %result_6, %36 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %43, %40[%42], %38 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %13[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vmuls %result_7, %cst_4, %38 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %13[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %29 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg8 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %13[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vadds %result, %cst_5, %36 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %13[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %30 = arith.muli %0, %c512 : index
      %31 = pto.addptr %arg3, %30 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %31, %12, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
      pto.vecscope {
        %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg8 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %42 = pto.addptr %12, %41 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %42[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %43 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %44 = pto.addptr %1, %41 : <f32, ub> -> <f32, ub>
          pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %37 = pto.castptr %c10304_i64 : i64 -> !pto.ptr<f32, ub>
        %38 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
        %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg8 : i16 to index
          %41 = arith.index_cast %40 : index to i64
          %42 = arith.muli %41, %c256_i64 : i64
          %43 = arith.addi %42, %c6208_i64 : i64
          %44 = arith.addi %42, %c32_i64 : i64
          %45 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %46 = pto.castptr %44 : i64 -> !pto.ptr<i32, ub>
          %47 = pto.addptr %46, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %47[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %48 = pto.vgather2 %45, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = arith.addi %42, %c8256_i64 : i64
          %50 = pto.castptr %49 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %50[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      %32 = pto.addptr %arg4, %30 : <bf16, gm> -> <bf16, gm>
      %33 = pto.castptr %c10560_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %32, %33, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg8 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %46 = pto.addptr %33, %45 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %46[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %47 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %48 = pto.addptr %1, %45 : <f32, ub> -> <f32, ub>
          pto.vsts %47, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %37 = pto.castptr %c12608_i64 : i64 -> !pto.ptr<f32, ub>
        %38 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
        %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg8 : i16 to index
          %45 = arith.index_cast %44 : index to i64
          %46 = arith.muli %45, %c256_i64 : i64
          %47 = arith.addi %46, %c6208_i64 : i64
          %48 = arith.addi %46, %c32_i64 : i64
          %49 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %50 = pto.castptr %48 : i64 -> !pto.ptr<i32, ub>
          %51 = pto.addptr %50, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %51[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %52 = pto.vgather2 %49, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %53 = arith.addi %46, %c10560_i64 : i64
          %54 = pto.castptr %53 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %54[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %40 = pto.castptr %c10304_i64 : i64 -> !pto.ptr<f32, ub>
        %41 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg8 : i16 to index
          %45 = arith.index_cast %44 : index to i64
          %46 = arith.muli %45, %c256_i64 : i64
          %47 = arith.addi %46, %c14912_i64 : i64
          %48 = arith.addi %46, %c2080_i64 : i64
          %49 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %50 = pto.castptr %48 : i64 -> !pto.ptr<i32, ub>
          %51 = pto.addptr %50, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %51[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %52 = pto.vgather2 %49, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %53 = arith.addi %46, %c32_i64 : i64
          %54 = pto.castptr %53 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %54[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %42 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
        %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg8 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %4[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %42[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result, %result_6, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %4[%45], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %9[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %13[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_7, %result_8, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %10[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vmul %47, %result_9, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %6[%45], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %34 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vadd %result, %result_6, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %4[%39], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %4, %39 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %42 = pto.addptr %14, %39 : <bf16, ub> -> <bf16, ub>
          pto.vsts %41, %42[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID3>]
      %35 = pto.addptr %arg1, %24 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %14, %35, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
