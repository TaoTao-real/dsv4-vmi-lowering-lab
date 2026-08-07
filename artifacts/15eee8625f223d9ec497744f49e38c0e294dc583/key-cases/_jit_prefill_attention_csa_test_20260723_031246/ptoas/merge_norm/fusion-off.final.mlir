module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1024_i64 = arith.constant 1024 : i64
      %c67776_i64 = arith.constant 67776 : i64
      %c65856_i64 = arith.constant 65856 : i64
      %c65920_i64 = arith.constant 65920 : i64
      %c65984_i64 = arith.constant 65984 : i64
      %c98752_i64 = arith.constant 98752 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c32832_i64 = arith.constant 32832 : i64
      %c33088_i64 = arith.constant 33088 : i64
      %c32896_i64 = arith.constant 32896 : i64
      %c32960_i64 = arith.constant 32960 : i64
      %c33024_i64 = arith.constant 33024 : i64
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %c4096 = arith.constant 4096 : index
      %c512 = arith.constant 512 : index
      %c192 = arith.constant 192 : index
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c128 = arith.constant 128 : index
      %c48 = arith.constant 48 : index
      %c3 = arith.constant 3 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant 0.000000e+00 : bf16
      %c8 = arith.constant 8 : index
      %c1_i64 = arith.constant 1 : i64
      %c896_i64 = arith.constant 896 : i64
      %c16_i64 = arith.constant 16 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c256_i64 = arith.constant 256 : i64
      %c4_i64 = arith.constant 4 : i64
      %c512_i32 = arith.constant 512 : i32
      %c16_i32 = arith.constant 16 : i32
      %0 = arith.index_cast %arg7 : i32 to index
      %1 = arith.muli %0, %c192 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      %2 = arith.muli %0, %c64 : index
      %3 = arith.cmpi slt, %0, %c128 : index
      %4 = pto.castptr %c67776_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %6 = arith.muli %arg9, %c16 : index
        %7 = arith.addi %2, %6 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        scf.if %3 {
          %11 = arith.muli %arg9, %c48 : index
          %12 = arith.addi %1, %11 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %13 = pto.addptr %arg2, %12 : <f32, gm> -> <f32, gm>
          %14 = pto.castptr %c65856_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %13, %14, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %15 = pto.addptr %arg3, %12 : <f32, gm> -> <f32, gm>
          %16 = pto.castptr %c65920_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %15, %16, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          %17 = arith.muli %12, %c512 : index
          %18 = pto.addptr %arg4, %17 : <f32, gm> -> <f32, gm>
          %19 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %18, %19, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %20 = pto.castptr %c98752_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %c64_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
          %24 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          %26 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
          %28 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          %30 = pto.castptr %c32960_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %32 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
          %33 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg10 = %c1 to %c3 step %c1 {
            %37 = arith.muli %arg10, %c16 : index
            %38 = arith.addi %12, %37 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %39 = pto.addptr %arg2, %38 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %39, %20, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
            %40 = pto.addptr %arg3, %38 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %40, %21, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
            %41 = arith.muli %38, %c512 : index
            %42 = pto.addptr %arg4, %41 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %42, %22, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
            pto.vecscope {
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
              %result_1 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vmax %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %45, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_4 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vexp %result_4, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_5 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vsub %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %47, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            pto.vecscope {
              %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              %43 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_1 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vmul %result_1, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            pto.vecscope {
              %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
              %result_1 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              %44 = pto.vmul %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
            pto.vecscope {
              %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              %43 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %44 = arith.index_cast %arg11 : i16 to index
                %45 = arith.muli %44, %c512 : index
                %46 = pto.addptr %28, %44 : <f32, ub> -> <f32, ub>
                %47 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %48 = arith.index_cast %arg12 : i16 to index
                  %49 = arith.index_cast %arg13 : index to i32
                  %mask_2, %scalar_out_3 = pto.plt_b32 %49 : i32 -> !pto.mask<b32>, i32
                  %50 = arith.index_cast %scalar_out_3 : i32 to index
                  %51 = arith.addi %45, %48 : index
                  %52 = pto.addptr %19, %51 : <f32, ub> -> <f32, ub>
                  %result_4 = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_5 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %53 = pto.vdup %result_5, %mask_2 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %54 = pto.vmul %result_4, %53, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %55 = pto.addptr %26, %51 : <f32, ub> -> <f32, ub>
                  pto.vsts %54, %55[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %50 : index
                }
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            }
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %43 = arith.index_cast %arg11 : i16 to index
                %44 = arith.muli %43, %c512 : index
                %45 = pto.addptr %30, %43 : <f32, ub> -> <f32, ub>
                %46 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %47 = arith.index_cast %arg12 : i16 to index
                  %48 = arith.index_cast %arg13 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %48 : i32 -> !pto.mask<b32>, i32
                  %49 = arith.index_cast %scalar_out : i32 to index
                  %50 = arith.addi %44, %47 : index
                  %51 = pto.addptr %22, %50 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %52 = pto.vdup %result_1, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %53 = pto.vmul %result, %52, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %53, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %49 : index
                }
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %43 = arith.index_cast %arg11 : i16 to index
                %44 = arith.muli %43, %c512 : index
                %45 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %46 = arith.index_cast %arg12 : i16 to index
                  %47 = arith.index_cast %arg13 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %47 : i32 -> !pto.mask<b32>, i32
                  %48 = arith.index_cast %scalar_out : i32 to index
                  %49 = arith.addi %44, %46 : index
                  %50 = pto.addptr %26, %49 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %51 = pto.addptr %22, %49 : <f32, ub> -> <f32, ub>
                  %result_1 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %52 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %53 = pto.addptr %19, %49 : <f32, ub> -> <f32, ub>
                  pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %48 : index
                }
              } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
            pto.vecscope {
              %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              pto.vsts %result, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_1 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_1, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
          %35 = pto.addptr %arg5, %6 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %35, %22, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
            %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vsub %result, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
          %36 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
          pto.vecscope {
            %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
            %37 = pto.vadd %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_2 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.vecscope {
            %result = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
            %37 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vadd %result_1, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          pto.vecscope {
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %38 = arith.index_cast %arg10 : i16 to index
              %39 = arith.muli %38, %c512 : index
              %40 = pto.addptr %22, %38 : <f32, ub> -> <f32, ub>
              %41 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %42 = arith.index_cast %arg11 : i16 to index
                %43 = arith.index_cast %arg12 : index to i32
                %mask_1, %scalar_out_2 = pto.plt_b32 %43 : i32 -> !pto.mask<b32>, i32
                %44 = arith.index_cast %scalar_out_2 : i32 to index
                %45 = arith.addi %39, %42 : index
                %46 = pto.addptr %19, %45 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.vdup %result_3, %mask_1 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %48 = pto.vdiv %result, %47, %mask_1 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %48, %46[%c0], %mask_1 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %44 : index
              }
            } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            %37 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %38 = arith.index_cast %arg10 : i16 to index
              %39 = arith.muli %38, %c512 : index
              scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %40 = arith.index_cast %arg11 : i16 to index
                %41 = arith.addi %39, %40 : index
                %42 = pto.addptr %19, %41 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %43 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                %44 = pto.addptr %37, %41 : <bf16, ub> -> <bf16, ub>
                pto.vsts %43, %44[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        } else {
          pto.vecscope {
            %11 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %14 = arith.index_cast %arg10 : i16 to index
              %15 = arith.muli %14, %c512 : index
              %16 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %17 = arith.index_cast %arg11 : i16 to index
                %18 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b32 %18 : i32 -> !pto.mask<b32>, i32
                %19 = arith.index_cast %scalar_out : i32 to index
                %20 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %21 = arith.addi %15, %17 : index
                %22 = pto.addptr %11, %21 : <f32, ub> -> <f32, ub>
                pto.vsts %20, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %19 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %12 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %14 = arith.index_cast %arg10 : i16 to index
              %15 = arith.muli %14, %c512 : index
              %16 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c128_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %17 = arith.index_cast %arg11 : i16 to index
                %18 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b16 %18 : i32 -> !pto.mask<b16>, i32
                %19 = arith.index_cast %scalar_out : i32 to index
                %20 = pto.vdup %cst_0, %mask : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
                %21 = arith.addi %15, %17 : index
                %22 = pto.addptr %12, %21 : <bf16, ub> -> <bf16, ub>
                pto.vsts %20, %22[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                scf.yield %19 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %13 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %14 = arith.index_cast %arg10 : i16 to index
              %15 = arith.muli %14, %c512 : index
              %16 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c128_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %17 = arith.index_cast %arg11 : i16 to index
                %18 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b16 %18 : i32 -> !pto.mask<b16>, i32
                %19 = arith.index_cast %scalar_out : i32 to index
                %20 = arith.addi %15, %17 : index
                %21 = pto.addptr %12, %20 : <bf16, ub> -> <bf16, ub>
                %result = pto.vlds %21[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                %22 = pto.addptr %13, %20 : <bf16, ub> -> <bf16, ub>
                pto.vsts %result, %22[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                scf.yield %19 : index
              }
            } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.barrier <PIPE_MTE3>
        %8 = arith.muli %7, %c64 : index
        %9 = pto.addptr %arg0, %8 : <f32, gm> -> <f32, gm>
        %10 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %5, %10, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c256_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %11 = arith.addi %6, %arg10 : index
          %12 = arith.divsi %11, %c8 : index
          %13 = arith.muli %12, %c128 : index
          %14 = arith.addi %13, %0 : index
          %15 = arith.muli %12, %c8 : index
          %16 = arith.subi %11, %15 : index
          %17 = arith.muli %16, %c512 : index
          %18 = arith.index_cast %arg10 : index to i64
          %19 = arith.muli %18, %c1024_i64 : i64
          %20 = arith.addi %19, %c64_i64 : i64
          pto.barrier <PIPE_MTE3>
          %21 = pto.castptr %20 : i64 -> !pto.ptr<bf16, ub>
          %22 = arith.muli %14, %c4096 : index
          %23 = arith.addi %22, %17 : index
          %24 = pto.addptr %arg1, %23 : <bf16, gm> -> <bf16, gm>
          %25 = pto.addptr %21, %c0 : <bf16, ub> -> <bf16, ub>
          %26 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %25, %26, %c0_i64, %c1_i64, %c896_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
