module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c8256_i64 = arith.constant 8256 : i64
      %c12864_i64 = arith.constant 12864 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c8768_i64 = arith.constant 8768 : i64
      %c16960_i64 = arith.constant 16960 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c8224_i64 = arith.constant 8224 : i64
      %c8512_i64 = arith.constant 8512 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c2 = arith.constant 2 : index
      %cst_0 = arith.constant 2.44140625E-4 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
      %c256_i64 = arith.constant 256 : i64
      %c8_i64 = arith.constant 8 : i64
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i32 = arith.constant 8 : i32
      %c32768 = arith.constant 32768 : index
      %c64 = arith.constant 64 : index
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
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %0 = arith.index_cast %arg3 : i32 to index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      %1 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %20, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %3 = arith.muli %0, %c32768 : index
      %4 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %5 = pto.addptr %4, %c0 : <bf16, ub> -> <bf16, ub>
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %7 = pto.addptr %6, %c0 : <bf16, ub> -> <bf16, ub>
      %8 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %20 = arith.muli %arg5, %c128 : index
        %21 = arith.addi %20, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %22 = arith.addi %3, %20 : index
        %23 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %24, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %25 = arith.addi %3, %21 : index
        %26 = pto.addptr %arg0, %25 : <bf16, gm> -> <bf16, gm>
        %27 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %27, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %low, %high = pto.pintlv_b32 %29, %29 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg6 : i16 to index
            %32 = arith.muli %31, %c128 : index
            %result = pto.vlds %4[%32] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %33 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %34 = pto.vcvt %result, %30 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %33, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %8[%32], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %35 = arith.addi %32, %c64 : index
            pto.vsts %high_4, %8[%35], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.vecscope {
          %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %48 = arith.index_cast %arg6 : i16 to index
            %49 = arith.muli %48, %c128 : index
            %result_18 = pto.vlds %8[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = arith.addi %49, %c64 : index
            %result_19 = pto.vlds %8[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_18, %result_18, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_19, %result_19, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %51, %8[%49], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %8[%50], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %8[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %8[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %8[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %8[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %8[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %8[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %8[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %8[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %8[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %8[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %8[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %8[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %8[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result, %result_3, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vcadd %31, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result_4, %result_5, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vcadd %33, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vadd %result_6, %result_7, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vcadd %35, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vadd %result_8, %result_9, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcadd %37, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result_10, %result_11, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcadd %39, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vadd %result_12, %result_13, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcadd %41, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vadd %result_14, %result_15, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcadd %43, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vadd %result_16, %result_17, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcadd %45, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %32, %9[%c0], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %9[%c1], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %9[%c2], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %9[%c3], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %9[%c4], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %9[%c5], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %9[%c6], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %9[%c7], %47 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %28 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.vadd %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %10[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %29 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low, %high = pto.pintlv_b32 %30, %30 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg6 : i16 to index
            %32 = arith.muli %31, %c128 : index
            %result = pto.vlds %6[%32] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %33 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %34 = pto.vcvt %result, %29 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %33, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %11[%32], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %35 = arith.addi %32, %c64 : index
            pto.vsts %high_4, %11[%35], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %51 = arith.index_cast %arg6 : i16 to index
            %52 = arith.muli %51, %c128 : index
            %result_20 = pto.vlds %11[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %52, %c64 : index
            %result_21 = pto.vlds %11[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_20, %result_20, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_21, %result_21, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %54, %11[%52], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %11[%53], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %31 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %11[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %11[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %11[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %11[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %11[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %11[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %11[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %11[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %11[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %11[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %11[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %11[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %11[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %11[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %11[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result, %result_3, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vcadd %32, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result_4, %result_5, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vcadd %34, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vadd %result_6, %result_7, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcadd %36, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vadd %result_8, %result_9, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcadd %38, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vadd %result_10, %result_11, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcadd %40, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vadd %result_12, %result_13, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcadd %42, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vadd %result_14, %result_15, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcadd %44, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vadd %result_16, %result_17, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vcadd %46, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %33, %31[%c0], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %31[%c1], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %31[%c2], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %31[%c3], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %31[%c4], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %31[%c5], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %31[%c6], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %31[%c7], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_18 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
          %result_19 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.vadd %result_18, %result_19, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %20, %10[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %12 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.vadds %result, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %20, %10[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %21 = pto.vsqrt %result_3, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vmuls %21, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.vadds %22, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vdiv %23, %21, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %14 = pto.addptr %13, %c0 : <bf16, ub> -> <bf16, ub>
      %15 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %18 = pto.addptr %17, %c0 : <bf16, ub> -> <bf16, ub>
      %19 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %20 = arith.muli %arg5, %c128 : index
        %21 = arith.addi %20, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %22 = arith.addi %3, %20 : index
        %23 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %24, %14, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %25 = pto.addptr %arg2, %20 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %25, %15, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %26 = arith.addi %3, %21 : index
        %27 = pto.addptr %arg0, %26 : <bf16, gm> -> <bf16, gm>
        %28 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %28, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        %29 = pto.addptr %arg2, %21 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %29, %16, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %37 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %low, %high = pto.pintlv_b32 %36, %36 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg6 : i16 to index
            %39 = arith.muli %38, %c128 : index
            %result = pto.vlds %13[%39] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %40 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %41 = pto.vcvt %result, %37 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %40, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %8[%39], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %42 = arith.addi %39, %c64 : index
            pto.vsts %high_4, %8[%42], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %result = pto.vlds %15[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %37 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result, %36 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %37, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_3, %high_4 = pto.pintlv_b32 %39, %39 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %11[%c0], %low_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %11[%c64], %high_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %41 = arith.index_cast %arg6 : i16 to index
            %result_5 = pto.vlds %12[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = pto.vdup %result_5, %40 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %43 = arith.muli %41, %c128 : index
            %low_6, %high_7 = pto.vldsx2 %8[%43], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %44 = pto.vmul %low_6, %42, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vmul %high_7, %42, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vmul %44, %37, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmul %45, %38, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %low_8, %high_9 = pto.vintlv %46, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_8, %8[%43], %low_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %48 = arith.addi %43, %c64 : index
            pto.vsts %high_9, %8[%48], %high_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %30 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg6 : i16 to index
            %39 = arith.muli %38, %c128 : index
            %result = pto.vlds %8[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %8[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = pto.vcvt %result, %36 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %42 = pto.vcvt %result_3, %36 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %41, %17[%39], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %42, %17[%40], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.barrier <PIPE_MTE3>
        %31 = pto.addptr %arg1, %22 : <bf16, gm> -> <bf16, gm>
        %32 = pto.addptr %31, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %18, %32, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.vecscope {
          %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low, %high = pto.pintlv_b32 %37, %37 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg6 : i16 to index
            %39 = arith.muli %38, %c128 : index
            %result = pto.vlds %6[%39] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %40 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %41 = pto.vcvt %result, %36 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %40, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %19[%39], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %42 = arith.addi %39, %c64 : index
            pto.vsts %high_4, %19[%42], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %36 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %16[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %37 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %38 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %39 = pto.vcvt %result, %37 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %38, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_3, %high_4 = pto.pintlv_b32 %40, %40 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %36[%c0], %low_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %36[%c64], %high_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %42 = arith.index_cast %arg6 : i16 to index
            %result_5 = pto.vlds %12[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.vdup %result_5, %41 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = arith.muli %42, %c128 : index
            %low_6, %high_7 = pto.vldsx2 %19[%44], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %45 = pto.vmul %low_6, %43, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vmul %high_7, %43, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmul %45, %38, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %46, %39, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %low_8, %high_9 = pto.vintlv %47, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_8, %19[%44], %low_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %49 = arith.addi %44, %c64 : index
            pto.vsts %high_9, %19[%49], %high_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %33 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg6 : i16 to index
            %39 = arith.muli %38, %c128 : index
            %result = pto.vlds %19[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %19[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = pto.vcvt %result, %36 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %42 = pto.vcvt %result_3, %36 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %41, %4[%39], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %42, %4[%40], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.barrier <PIPE_MTE3>
        %34 = pto.addptr %arg1, %26 : <bf16, gm> -> <bf16, gm>
        %35 = pto.addptr %34, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %5, %35, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
