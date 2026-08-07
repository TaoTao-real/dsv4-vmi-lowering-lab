module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
      %c256_i64 = arith.constant 256 : i64
      %c8_i64 = arith.constant 8 : i64
      %c128_i32 = arith.constant 128 : i32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c1_i32 = arith.constant 1 : i32
      %c8_i32 = arith.constant 8 : i32
      %c32768 = arith.constant 32768 : index
      %0 = arith.index_cast %arg3 : i32 to index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
      %1 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %17, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %3 = arith.muli %0, %c32768 : index
      %4 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %5 = pto.addptr %4, %c0 : <bf16, ub> -> <bf16, ub>
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %7 = pto.addptr %6, %c0 : <bf16, ub> -> <bf16, ub>
      %8 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %17 = arith.muli %arg5, %c128 : index
        %18 = arith.addi %17, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %19 = arith.addi %3, %17 : index
        %20 = pto.addptr %arg0, %19 : <bf16, gm> -> <bf16, gm>
        %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %21, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %22 = arith.addi %3, %18 : index
        %23 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %24, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %26 = arith.index_cast %arg6 : i16 to index
            %27 = arith.muli %26, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %28 = arith.index_cast %arg7 : i16 to index
              %29 = arith.addi %27, %28 : index
              %30 = pto.addptr %4, %29 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %30[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %31 = pto.vcvt %result, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %32 = pto.addptr %8, %29 : <f32, ub> -> <f32, ub>
              pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.vecscope {
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg6 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %31 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %32 = arith.index_cast %arg7 : i16 to index
              %33 = arith.index_cast %arg8 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
              %34 = arith.index_cast %scalar_out_7 : i32 to index
              %35 = arith.addi %30, %32 : index
              %36 = pto.addptr %8, %35 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = pto.vmul %result_8, %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %37, %36[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %34 : index
            }
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %25 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          %26 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg6 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %31:2 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %26, %arg9 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %33 = arith.index_cast %arg7 : i16 to index
              %34 = arith.index_cast %arg9 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %34 : i32 -> !pto.mask<b32>, i32
              %35 = arith.index_cast %scalar_out_7 : i32 to index
              %36 = arith.addi %30, %33 : index
              %37 = pto.addptr %8, %36 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = pto.vcadd %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.vadd %arg8, %38, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %39, %35 : !pto.vreg<64xf32>, index
            }
            %32 = pto.addptr %25, %29 : <f32, ub> -> <f32, ub>
            pto.vsts %31#0, %32[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %28 = pto.vadd %result, %result_3, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %9[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %27 = arith.index_cast %arg6 : i16 to index
            %28 = arith.muli %27, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %29 = arith.index_cast %arg7 : i16 to index
              %30 = arith.addi %28, %29 : index
              %31 = pto.addptr %6, %30 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %31[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %32 = pto.vcvt %result, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %33 = pto.addptr %26, %30 : <f32, ub> -> <f32, ub>
              pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %25 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %30 = arith.index_cast %arg6 : i16 to index
            %31 = arith.muli %30, %c128 : index
            %32 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %33 = arith.index_cast %arg7 : i16 to index
              %34 = arith.index_cast %arg8 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %34 : i32 -> !pto.mask<b32>, i32
              %35 = arith.index_cast %scalar_out_7 : i32 to index
              %36 = arith.addi %31, %33 : index
              %37 = pto.addptr %25, %36 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = pto.vmul %result_8, %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %38, %37[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %35 : index
            }
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %26 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %30 = arith.index_cast %arg6 : i16 to index
            %31 = arith.muli %30, %c128 : index
            %32:2 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %27, %arg9 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %34 = arith.index_cast %arg7 : i16 to index
              %35 = arith.index_cast %arg9 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %35 : i32 -> !pto.mask<b32>, i32
              %36 = arith.index_cast %scalar_out_7 : i32 to index
              %37 = arith.addi %31, %34 : index
              %38 = pto.addptr %25, %37 : <f32, ub> -> <f32, ub>
              %result_8 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = pto.vcadd %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %40 = pto.vadd %arg8, %39, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %40, %36 : !pto.vreg<64xf32>, index
            }
            %33 = pto.addptr %26, %30 : <f32, ub> -> <f32, ub>
            pto.vsts %32#0, %33[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.vadd %result, %result_3, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %2[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %17, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %10 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vadds %result, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %17, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %18 = pto.vsqrt %result_3, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vmuls %18, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vadds %19, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vdiv %20, %18, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
      %13 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %14 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.addptr %15, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %17 = arith.muli %arg5, %c128 : index
        %18 = arith.addi %17, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %19 = arith.addi %3, %17 : index
        %20 = pto.addptr %arg0, %19 : <bf16, gm> -> <bf16, gm>
        %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %21, %12, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %22 = pto.addptr %arg2, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %22, %13, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %23 = arith.addi %3, %18 : index
        %24 = pto.addptr %arg0, %23 : <bf16, gm> -> <bf16, gm>
        %25 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %25, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        %26 = pto.addptr %arg2, %18 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %26, %14, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %34 = arith.index_cast %arg7 : i16 to index
              %35 = arith.addi %33, %34 : index
              %36 = pto.addptr %11, %35 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %36[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %37 = pto.vcvt %result, %31 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %38 = pto.addptr %8, %35 : <f32, ub> -> <f32, ub>
              pto.vsts %37, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %32 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = pto.addptr %13, %33 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %34[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %35 = pto.vcvt %result, %31 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %36 = pto.addptr %32, %33 : <f32, ub> -> <f32, ub>
            pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = arith.muli %33, %c128 : index
            %35 = pto.addptr %10, %33 : <f32, ub> -> <f32, ub>
            %36 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %37 = arith.index_cast %arg7 : i16 to index
              %38 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %38 : i32 -> !pto.mask<b32>, i32
              %39 = arith.index_cast %scalar_out_4 : i32 to index
              %40 = arith.addi %34, %37 : index
              %41 = pto.addptr %8, %40 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %43 = pto.vmul %result, %42, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %41[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %39 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = arith.muli %33, %c128 : index
            %35 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %36 = arith.index_cast %arg7 : i16 to index
              %37 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %37 : i32 -> !pto.mask<b32>, i32
              %38 = arith.index_cast %scalar_out_4 : i32 to index
              %39 = arith.addi %34, %36 : index
              %40 = pto.addptr %8, %39 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.addptr %32, %36 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %42, %40[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %38 : index
            }
          } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg6 : i16 to index
            %32 = arith.muli %31, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %33 = arith.index_cast %arg7 : i16 to index
              %34 = arith.addi %32, %33 : index
              %35 = pto.addptr %8, %34 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %36 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %37 = pto.addptr %15, %34 : <bf16, ub> -> <bf16, ub>
              pto.vsts %36, %37[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.barrier <PIPE_MTE3>
        %27 = pto.addptr %arg1, %19 : <bf16, gm> -> <bf16, gm>
        %28 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %16, %28, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %32 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = arith.muli %33, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %35 = arith.index_cast %arg7 : i16 to index
              %36 = arith.addi %34, %35 : index
              %37 = pto.addptr %6, %36 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %37[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %38 = pto.vcvt %result, %31 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %39 = pto.addptr %32, %36 : <f32, ub> -> <f32, ub>
              pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %32 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %34 = arith.index_cast %arg6 : i16 to index
            %35 = pto.addptr %14, %34 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %35[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %36 = pto.vcvt %result, %31 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %37 = pto.addptr %32, %34 : <f32, ub> -> <f32, ub>
            pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %33 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg6 : i16 to index
            %35 = arith.muli %34, %c128 : index
            %36 = pto.addptr %10, %34 : <f32, ub> -> <f32, ub>
            %37 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %38 = arith.index_cast %arg7 : i16 to index
              %39 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %39 : i32 -> !pto.mask<b32>, i32
              %40 = arith.index_cast %scalar_out_4 : i32 to index
              %41 = arith.addi %35, %38 : index
              %42 = pto.addptr %33, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.vmul %result, %43, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %42[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %40 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg6 : i16 to index
            %35 = arith.muli %34, %c128 : index
            %36 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %37 = arith.index_cast %arg7 : i16 to index
              %38 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %38 : i32 -> !pto.mask<b32>, i32
              %39 = arith.index_cast %scalar_out_4 : i32 to index
              %40 = arith.addi %35, %37 : index
              %41 = pto.addptr %33, %40 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.addptr %32, %37 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %41[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %39 : index
            }
          } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %34 = arith.index_cast %arg7 : i16 to index
              %35 = arith.addi %33, %34 : index
              %36 = pto.addptr %31, %35 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %38 = pto.addptr %4, %35 : <bf16, ub> -> <bf16, ub>
              pto.vsts %37, %38[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.barrier <PIPE_MTE3>
        %29 = pto.addptr %arg1, %23 : <bf16, gm> -> <bf16, gm>
        %30 = pto.addptr %29, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %5, %30, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
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
