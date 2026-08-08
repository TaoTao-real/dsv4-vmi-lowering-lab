module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
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
      %c128_i32 = arith.constant 128 : i32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c1_i32 = arith.constant 1 : i32
      %c8_i32 = arith.constant 8 : i32
      %c32768 = arith.constant 32768 : index
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
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %14 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %15 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %16 = arith.index_cast %arg7 : i16 to index
            %17 = arith.muli %16, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %18 = arith.index_cast %arg8 : i16 to index
              %19 = arith.addi %17, %18 : index
              %20 = pto.addptr %2, %19 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %20[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %21 = pto.vcvt %result, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %22 = pto.addptr %15, %19 : <f32, ub> -> <f32, ub>
              pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.vecscope {
          %14 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c128 : index
            %24 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %25 = arith.index_cast %arg8 : i16 to index
              %26 = arith.index_cast %arg9 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %26 : i32 -> !pto.mask<b32>, i32
              %27 = arith.index_cast %scalar_out_7 : i32 to index
              %28 = arith.addi %23, %25 : index
              %29 = pto.addptr %14, %28 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %30 = pto.vmul %result_8, %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %30, %29[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %27 : index
            }
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %15 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          pto.mem_bar "VST_VLD"
          %16 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c128 : index
            %24:2 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %16, %arg10 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.index_cast %arg10 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
              %28 = arith.index_cast %scalar_out_7 : i32 to index
              %29 = arith.addi %23, %26 : index
              %30 = pto.addptr %14, %29 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vcadd %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %32 = pto.vadd %arg9, %31, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %32, %28 : !pto.vreg<64xf32>, index
            }
            %25 = pto.addptr %15, %22 : <f32, ub> -> <f32, ub>
            pto.vsts %24#0, %25[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %mask_3, %scalar_out_4 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %17 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
          %18 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          pto.mem_bar "VST_VLD"
          %result_5 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vadd %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
          pto.mem_bar "VST_VST"
          pto.vsts %20, %21[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %14 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %16 = arith.index_cast %arg7 : i16 to index
            %17 = arith.muli %16, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %18 = arith.index_cast %arg8 : i16 to index
              %19 = arith.addi %17, %18 : index
              %20 = pto.addptr %3, %19 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %20[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %21 = pto.vcvt %result, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %22 = pto.addptr %15, %19 : <f32, ub> -> <f32, ub>
              pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c128 : index
            %25 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.index_cast %arg9 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
              %28 = arith.index_cast %scalar_out_7 : i32 to index
              %29 = arith.addi %24, %26 : index
              %30 = pto.addptr %14, %29 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vmul %result_8, %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %31, %30[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %28 : index
            }
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %15 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          pto.mem_bar "VST_VLD"
          %16 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c128 : index
            %25:2 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %16, %arg10 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %27 = arith.index_cast %arg8 : i16 to index
              %28 = arith.index_cast %arg10 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %28 : i32 -> !pto.mask<b32>, i32
              %29 = arith.index_cast %scalar_out_7 : i32 to index
              %30 = arith.addi %24, %27 : index
              %31 = pto.addptr %14, %30 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %32 = pto.vcadd %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %33 = pto.vadd %arg9, %32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %33, %29 : !pto.vreg<64xf32>, index
            }
            %26 = pto.addptr %15, %23 : <f32, ub> -> <f32, ub>
            pto.vsts %25#0, %26[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %mask_3, %scalar_out_4 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %17 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %18 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          pto.mem_bar "VST_VLD"
          %result_5 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vadd %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %20, %22[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %8 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %10 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %11 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
        %12 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %10, %12[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %8 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
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
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %19 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %20 = arith.index_cast %arg7 : i16 to index
            %21 = arith.muli %20, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %22 = arith.index_cast %arg8 : i16 to index
              %23 = arith.addi %21, %22 : index
              %24 = pto.addptr %4, %23 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %24[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %25 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %26 = pto.addptr %19, %23 : <f32, ub> -> <f32, ub>
              pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = pto.addptr %5, %22 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %23[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %24 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %25 = pto.addptr %19, %22 : <f32, ub> -> <f32, ub>
            pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %20 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c128 : index
            %24 = pto.addptr %21, %22 : <f32, ub> -> <f32, ub>
            %25 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.index_cast %arg9 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
              %28 = arith.index_cast %scalar_out_4 : i32 to index
              %29 = arith.addi %23, %26 : index
              %30 = pto.addptr %20, %29 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %24[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %31, %30[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %28 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          pto.mem_bar "VST_VLD"
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c128 : index
            %24 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %25 = arith.index_cast %arg8 : i16 to index
              %26 = arith.index_cast %arg9 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %26 : i32 -> !pto.mask<b32>, i32
              %27 = arith.index_cast %scalar_out_4 : i32 to index
              %28 = arith.addi %23, %25 : index
              %29 = pto.addptr %20, %28 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %30 = pto.addptr %19, %25 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %31, %29[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %27 : index
            }
          } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %18 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %19 = arith.index_cast %arg7 : i16 to index
            %20 = arith.muli %19, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %21 = arith.index_cast %arg8 : i16 to index
              %22 = arith.addi %20, %21 : index
              %23 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %24 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %25 = pto.addptr %7, %22 : <bf16, ub> -> <bf16, ub>
              pto.vsts %24, %25[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.mem_bar "VLD_VST"
            }
            pto.mem_bar "VLD_VST"
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.barrier <PIPE_MTE3>
        %16 = pto.addptr %arg1, %10 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %7, %16, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %19 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %20 = arith.index_cast %arg7 : i16 to index
            %21 = arith.muli %20, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %22 = arith.index_cast %arg8 : i16 to index
              %23 = arith.addi %21, %22 : index
              %24 = pto.addptr %3, %23 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %24[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %25 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %26 = pto.addptr %19, %23 : <f32, ub> -> <f32, ub>
              pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %19 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = pto.addptr %6, %22 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %23[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %24 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %25 = pto.addptr %19, %22 : <f32, ub> -> <f32, ub>
            pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %20 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c128 : index
            %24 = pto.addptr %21, %22 : <f32, ub> -> <f32, ub>
            %25 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.index_cast %arg9 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
              %28 = arith.index_cast %scalar_out_4 : i32 to index
              %29 = arith.addi %23, %26 : index
              %30 = pto.addptr %20, %29 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %24[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %31, %30[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %28 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          pto.mem_bar "VST_VLD"
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c128 : index
            %24 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %25 = arith.index_cast %arg8 : i16 to index
              %26 = arith.index_cast %arg9 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %26 : i32 -> !pto.mask<b32>, i32
              %27 = arith.index_cast %scalar_out_4 : i32 to index
              %28 = arith.addi %23, %25 : index
              %29 = pto.addptr %20, %28 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %30 = pto.addptr %19, %25 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %31, %29[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %27 : index
            }
          } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %18 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %19 = arith.index_cast %arg7 : i16 to index
            %20 = arith.muli %19, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %21 = arith.index_cast %arg8 : i16 to index
              %22 = arith.addi %20, %21 : index
              %23 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %24 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %25 = pto.addptr %2, %22 : <bf16, ub> -> <bf16, ub>
              pto.vsts %24, %25[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.mem_bar "VLD_VST"
            }
            pto.mem_bar "VLD_VST"
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.barrier <PIPE_MTE3>
        %17 = pto.addptr %arg1, %13 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %2, %17, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
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

