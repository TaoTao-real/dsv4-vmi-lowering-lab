module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c2 = arith.constant 2 : index
      %c128 = arith.constant 128 : index
      %cst_0 = arith.constant 2.44140625E-4 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c8_i64 = arith.constant 8 : i64
      %c256_i64 = arith.constant 256 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
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
      %0 = arith.index_cast %arg4 : i32 to index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %8 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %9 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %9, %10[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %1 = arith.muli %0, %c32768 : index
      %2 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %3 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg6 = %c0 to %c32 step %c2 {
        %8 = arith.muli %arg6, %c128 : index
        %9 = arith.addi %8, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %10 = arith.addi %1, %8 : index
        %11 = pto.addptr %arg0, %10 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %11, %2, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %12 = arith.addi %1, %9 : index
        %13 = pto.addptr %arg0, %12 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %13, %3, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %15 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %low, %high = pto.pintlv_b32 %16, %16 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %18 = arith.index_cast %arg7 : i16 to index
            %19 = arith.muli %18, %c128 : index
            %result = pto.vlds %2[%19] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %20 = pto.vcvt %result, %17 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %21 = pto.vcvt %result, %17 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %20, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %15[%19], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %22 = arith.addi %19, %c64 : index
            pto.vsts %high_4, %15[%22], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.vecscope {
          %15 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %36 = arith.index_cast %arg7 : i16 to index
            %37 = arith.muli %36, %c128 : index
            %result_18 = pto.vlds %15[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = arith.addi %37, %c64 : index
            %result_19 = pto.vlds %15[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = pto.vmul %result_18, %result_18, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result_19, %result_19, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %39, %15[%37], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %40, %15[%38], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %18 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %15[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %15[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %15[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %15[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %15[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %15[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %15[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %15[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %15[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %15[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %15[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %15[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vadd %result, %result_3, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %20 = pto.vcadd %19, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = pto.vadd %result_4, %result_5, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %22 = pto.vcadd %21, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.vadd %result_6, %result_7, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.vcadd %23, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vadd %result_8, %result_9, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vcadd %25, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result_10, %result_11, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vcadd %27, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vadd %result_12, %result_13, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vcadd %29, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result_14, %result_15, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vcadd %31, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result_16, %result_17, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vcadd %33, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %20, %18[%c0], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %22, %18[%c1], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %24, %18[%c2], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %26, %18[%c3], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %28, %18[%c4], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %30, %18[%c5], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %32, %18[%c6], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %34, %18[%c7], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %14 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %15 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %17 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          %18 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %19 = pto.vadd %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %20 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %19, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low, %high = pto.pintlv_b32 %17, %17 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %18 = arith.index_cast %arg7 : i16 to index
            %19 = arith.muli %18, %c128 : index
            %result = pto.vlds %3[%19] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %20 = pto.vcvt %result, %16 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %21 = pto.vcvt %result, %16 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %20, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %15[%19], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %22 = arith.addi %19, %c64 : index
            pto.vsts %high_4, %15[%22], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %42 = arith.index_cast %arg7 : i16 to index
            %43 = arith.muli %42, %c128 : index
            %result_20 = pto.vlds %15[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %43, %c64 : index
            %result_21 = pto.vlds %15[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.vmul %result_20, %result_20, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vmul %result_21, %result_21, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %15[%43], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %46, %15[%44], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %18 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %15[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %15[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %15[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %15[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %15[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %15[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %15[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %15[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %15[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %15[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %15[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %15[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %15[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %15[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %15[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vadd %result, %result_3, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %20 = pto.vcadd %19, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = pto.vadd %result_4, %result_5, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %22 = pto.vcadd %21, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.vadd %result_6, %result_7, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.vcadd %23, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vadd %result_8, %result_9, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vcadd %25, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result_10, %result_11, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vcadd %27, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vadd %result_12, %result_13, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vcadd %29, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result_14, %result_15, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vcadd %31, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result_16, %result_17, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vcadd %33, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %20, %18[%c0], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %22, %18[%c1], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %24, %18[%c2], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %26, %18[%c3], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %28, %18[%c4], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %30, %18[%c5], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %32, %18[%c6], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %34, %18[%c7], %35 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %36 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
          %result_18 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
          pto.mem_bar "VST_VLD"
          %result_19 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %39 = pto.vadd %result_18, %result_19, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
          %41 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %39, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %8 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %10 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %11 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
        %12 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %10, %12[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.vecscope {
        %8 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %10 = pto.vadds %result, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %10, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %11 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VST_VLD"
        %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %12 = pto.vsqrt %result_3, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %13 = pto.vmuls %12, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %14 = pto.vadds %13, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.vdiv %14, %12, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %15, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %5 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %7 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg6 = %c0 to %c32 step %c2 {
        %8 = arith.muli %arg6, %c128 : index
        %9 = arith.addi %8, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %10 = arith.addi %1, %8 : index
        %11 = pto.addptr %arg0, %10 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %11, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %12 = pto.addptr %arg2, %8 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %12, %5, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %13 = arith.addi %1, %9 : index
        %14 = pto.addptr %arg0, %13 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %14, %3, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        %15 = pto.addptr %arg2, %9 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %15, %6, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %20 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %22 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %low, %high = pto.pintlv_b32 %21, %21 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c128 : index
            %result = pto.vlds %4[%24] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %25 = pto.vcvt %result, %22 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %26 = pto.vcvt %result, %22 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %25, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %20[%24], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %27 = arith.addi %24, %c64 : index
            pto.vsts %high_4, %20[%27], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %5[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %21 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %22 = pto.vcvt %result, %21 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %23 = pto.vcvt %result, %21 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %22, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_3, %high_4 = pto.pintlv_b32 %24, %24 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %20[%c0], %low_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %20[%c64], %high_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %25 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result_5 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %20[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %28 = arith.index_cast %arg7 : i16 to index
            %result_7 = pto.vlds %26[%28] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.muli %28, %c128 : index
            %result_8 = pto.vlds %25[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = arith.addi %29, %c64 : index
            %result_9 = pto.vlds %25[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vmul %result_8, %result_7, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.vmul %result_9, %result_7, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %31, %25[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %32, %25[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VLD"
            %result_10 = pto.vlds %25[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %25[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_10, %result_5, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %34 = pto.vmul %result_11, %result_6, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %33, %25[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %34, %25[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %16 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %20 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c128 : index
            %result = pto.vlds %20[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = arith.addi %24, %c64 : index
            %result_3 = pto.vlds %20[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vcvt %result, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %27 = pto.vcvt %result_3, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %26, %7[%24], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.mem_bar "VLD_VST"
            pto.vsts %27, %7[%25], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.mem_bar "VLD_VST"
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.barrier <PIPE_MTE3>
        %17 = pto.addptr %arg1, %10 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %7, %17, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %20 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %22 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %low, %high = pto.pintlv_b32 %21, %21 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c128 : index
            %result = pto.vlds %3[%24] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %25 = pto.vcvt %result, %22 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %26 = pto.vcvt %result, %22 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low_3, %high_4 = pto.vintlv %25, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_3, %20[%24], %low : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %27 = arith.addi %24, %c64 : index
            pto.vsts %high_4, %20[%27], %high : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %20 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %6[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %21 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %22 = pto.vcvt %result, %21 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %23 = pto.vcvt %result, %21 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %22, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_3, %high_4 = pto.pintlv_b32 %24, %24 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %20[%c0], %low_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %20[%c64], %high_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %25 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result_5 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %20[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %28 = arith.index_cast %arg7 : i16 to index
            %result_7 = pto.vlds %26[%28] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.muli %28, %c128 : index
            %result_8 = pto.vlds %25[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = arith.addi %29, %c64 : index
            %result_9 = pto.vlds %25[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vmul %result_8, %result_7, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.vmul %result_9, %result_7, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %31, %25[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %32, %25[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VLD"
            %result_10 = pto.vlds %25[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %25[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_10, %result_5, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %34 = pto.vmul %result_11, %result_6, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %33, %25[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %34, %25[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %18 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %20 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c128 : index
            %result = pto.vlds %20[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = arith.addi %24, %c64 : index
            %result_3 = pto.vlds %20[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vcvt %result, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %27 = pto.vcvt %result_3, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %26, %2[%24], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.mem_bar "VLD_VST"
            pto.vsts %27, %2[%25], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.mem_bar "VLD_VST"
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.barrier <PIPE_MTE3>
        %19 = pto.addptr %arg1, %13 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %2, %19, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
