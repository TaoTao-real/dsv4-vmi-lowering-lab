module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c16_i32 = arith.constant 16 : i32
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
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
              %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %46 = arith.index_cast %arg11 : i16 to index
                %result_2 = pto.vlds %28[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.vdup %result_2, %45 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %48 = arith.muli %46, %c512 : index
                %result_3 = pto.vlds %19[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %49 = arith.addi %48, %c64 : index
                %result_4 = pto.vlds %19[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %50 = arith.addi %48, %c128 : index
                %result_5 = pto.vlds %19[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %51 = arith.addi %48, %c192 : index
                %result_6 = pto.vlds %19[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %52 = arith.addi %48, %c256 : index
                %result_7 = pto.vlds %19[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %53 = arith.addi %48, %c320 : index
                %result_8 = pto.vlds %19[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %54 = arith.addi %48, %c384 : index
                %result_9 = pto.vlds %19[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %55 = arith.addi %48, %c448 : index
                %result_10 = pto.vlds %19[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %56 = pto.vmul %result_3, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %57 = pto.vmul %result_4, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %58 = pto.vmul %result_5, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %59 = pto.vmul %result_6, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %60 = pto.vmul %result_7, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %61 = pto.vmul %result_8, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %62 = pto.vmul %result_9, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.vmul %result_10, %47, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %56, %26[%48], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %57, %26[%49], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %58, %26[%50], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %59, %26[%51], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %60, %26[%52], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %61, %26[%53], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %62, %26[%54], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %63, %26[%55], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            }
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %45 = arith.index_cast %arg11 : i16 to index
                %result = pto.vlds %30[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vdup %result, %43 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %47 = arith.muli %45, %c512 : index
                %result_1 = pto.vlds %22[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = arith.addi %47, %c64 : index
                %result_2 = pto.vlds %22[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %49 = arith.addi %47, %c128 : index
                %result_3 = pto.vlds %22[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %50 = arith.addi %47, %c192 : index
                %result_4 = pto.vlds %22[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %51 = arith.addi %47, %c256 : index
                %result_5 = pto.vlds %22[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %52 = arith.addi %47, %c320 : index
                %result_6 = pto.vlds %22[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %53 = arith.addi %47, %c384 : index
                %result_7 = pto.vlds %22[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %54 = arith.addi %47, %c448 : index
                %result_8 = pto.vlds %22[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %55 = pto.vmul %result_1, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %56 = pto.vmul %result_2, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %57 = pto.vmul %result_3, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %58 = pto.vmul %result_4, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %59 = pto.vmul %result_5, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %60 = pto.vmul %result_6, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %61 = pto.vmul %result_7, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %62 = pto.vmul %result_8, %46, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %55, %22[%47], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %56, %22[%48], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %57, %22[%49], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %58, %22[%50], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %59, %22[%51], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %60, %22[%52], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %61, %22[%53], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %62, %22[%54], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_9 = pto.vlds %26[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_10 = pto.vlds %26[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_11 = pto.vlds %26[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_12 = pto.vlds %26[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_13 = pto.vlds %26[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_14 = pto.vlds %26[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_15 = pto.vlds %26[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_16 = pto.vlds %26[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %63 = pto.vadd %result_9, %55, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.vadd %result_10, %56, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %65 = pto.vadd %result_11, %57, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %66 = pto.vadd %result_12, %58, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %67 = pto.vadd %result_13, %59, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %68 = pto.vadd %result_14, %60, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %69 = pto.vadd %result_15, %61, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %70 = pto.vadd %result_16, %62, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %63, %19[%47], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %64, %19[%48], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %65, %19[%49], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %66, %19[%50], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %67, %19[%51], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %68, %19[%52], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %69, %19[%53], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %70, %19[%54], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
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
            %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %40 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %22[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.vdup %result, %38 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %42 = arith.muli %40, %c512 : index
              %result_1 = pto.vlds %19[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = arith.addi %42, %c64 : index
              %result_2 = pto.vlds %19[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = arith.addi %42, %c128 : index
              %result_3 = pto.vlds %19[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = arith.addi %42, %c192 : index
              %result_4 = pto.vlds %19[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = arith.addi %42, %c256 : index
              %result_5 = pto.vlds %19[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = arith.addi %42, %c320 : index
              %result_6 = pto.vlds %19[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = arith.addi %42, %c384 : index
              %result_7 = pto.vlds %19[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %49 = arith.addi %42, %c448 : index
              %result_8 = pto.vlds %19[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vdiv %result_1, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vdiv %result_2, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.vdiv %result_3, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %53 = pto.vdiv %result_4, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %54 = pto.vdiv %result_5, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %55 = pto.vdiv %result_6, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %56 = pto.vdiv %result_7, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vdiv %result_8, %41, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %50, %19[%42], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %51, %19[%43], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %52, %19[%44], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %53, %19[%45], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %54, %19[%46], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %55, %19[%47], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %56, %19[%48], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %57, %19[%49], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_trowexpanddiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
            %39 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %40 = arith.index_cast %arg10 : i16 to index
              %41 = arith.muli %40, %c512 : index
              %result = pto.vlds %19[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = arith.addi %41, %c64 : index
              %result_1 = pto.vlds %19[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = arith.addi %41, %c128 : index
              %result_2 = pto.vlds %19[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = arith.addi %41, %c192 : index
              %result_3 = pto.vlds %19[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = arith.addi %41, %c256 : index
              %result_4 = pto.vlds %19[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = arith.addi %41, %c320 : index
              %result_5 = pto.vlds %19[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = arith.addi %41, %c384 : index
              %result_6 = pto.vlds %19[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = arith.addi %41, %c448 : index
              %result_7 = pto.vlds %19[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %49 = pto.vcvt %result, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %50 = pto.vcvt %result_1, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %51 = pto.vcvt %result_2, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %52 = pto.vcvt %result_3, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %53 = pto.vcvt %result_4, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %54 = pto.vcvt %result_5, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %55 = pto.vcvt %result_6, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %56 = pto.vcvt %result_7, %38 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %49, %39[%41], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %50, %39[%42], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %51, %39[%43], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %52, %39[%44], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %53, %39[%45], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %54, %39[%46], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %55, %39[%47], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %56, %39[%48], %37 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        } else {
          pto.vecscope {
            %11 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
            %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %14 = pto.vdup %cst, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %15 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<bf16, ub>
            %16 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %17 = pto.vdup %cst_0, %16 : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
            %18 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            %19 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %20 = arith.index_cast %arg10 : i16 to index
              %21 = arith.muli %20, %c512 : index
              pto.vsts %14, %11[%21], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %22 = arith.addi %21, %c64 : index
              pto.vsts %14, %11[%22], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %23 = arith.addi %21, %c128 : index
              pto.vsts %14, %11[%23], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %24 = arith.addi %21, %c192 : index
              pto.vsts %14, %11[%24], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %25 = arith.addi %21, %c256 : index
              pto.vsts %14, %11[%25], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %26 = arith.addi %21, %c320 : index
              pto.vsts %14, %11[%26], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %27 = arith.addi %21, %c384 : index
              pto.vsts %14, %11[%27], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %28 = arith.addi %21, %c448 : index
              pto.vsts %14, %11[%28], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %17, %15[%21], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %15[%23], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %15[%25], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %15[%27], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %18[%21], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %18[%23], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %18[%25], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %17, %18[%27], %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
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
