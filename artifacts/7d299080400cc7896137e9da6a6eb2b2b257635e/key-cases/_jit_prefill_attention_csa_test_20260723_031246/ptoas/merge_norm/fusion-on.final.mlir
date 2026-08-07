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
      %c16_i32 = arith.constant 16 : i32
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg7 : i32 to index
      %1 = arith.muli %0, %c192 : index
      %2 = arith.muli %0, %c64 : index
      %3 = arith.cmpi slt, %0, %c128 : index
      %4 = pto.castptr %c67776_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %6 = arith.muli %arg9, %c16 : index
        %7 = arith.addi %2, %6 : index
        scf.if %3 {
          %11 = arith.muli %arg9, %c48 : index
          %12 = arith.addi %1, %11 : index
          %13 = pto.addptr %arg2, %12 : <f32, gm> -> <f32, gm>
          %14 = pto.castptr %c65856_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %13, %14, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %15 = pto.addptr %arg3, %12 : <f32, gm> -> <f32, gm>
          %16 = pto.castptr %c65920_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %15, %16, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %17 = arith.muli %12, %c512 : index
          %18 = pto.addptr %arg4, %17 : <f32, gm> -> <f32, gm>
          %19 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %18, %19, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %20 = pto.castptr %c98752_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %c64_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg10 = %c1 to %c3 step %c1 {
            %24 = arith.muli %arg10, %c16 : index
            %25 = arith.addi %12, %24 : index
            %26 = pto.addptr %arg2, %25 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %26, %20, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %27 = pto.addptr %arg3, %25 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %27, %21, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %28 = arith.muli %25, %c512 : index
            %29 = pto.addptr %arg4, %28 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %29, %22, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %30 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
              %31 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
              %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %33 = pto.vmax %result, %result_1, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              %34 = pto.pand %31, %mask, %32 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %33, %30[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %35 = pto.vsub %result, %33, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %36 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
              %37 = pto.vexp %35, %32 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %37, %36[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %38 = pto.vsub %result_1, %33, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.castptr %c32960_i64 : i64 -> !pto.ptr<f32, ub>
              %40 = pto.vexp %38, %32 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %40, %39[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %41 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<f32, ub>
              %result_2 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.vmul %37, %result_2, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %42, %41[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_3 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vmul %40, %result_3, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
              %45 = pto.vadd %42, %43, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %45, %44[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %51 = arith.index_cast %arg11 : i16 to index
                %52 = arith.muli %51, %c512 : index
                %53 = pto.addptr %36, %51 : <f32, ub> -> <f32, ub>
                %54 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %55 = arith.index_cast %arg12 : i16 to index
                  %56 = arith.index_cast %arg13 : index to i32
                  %mask_6, %scalar_out_7 = pto.plt_b32 %56 : i32 -> !pto.mask<b32>, i32
                  %57 = arith.index_cast %scalar_out_7 : i32 to index
                  %58 = arith.addi %52, %55 : index
                  %59 = pto.addptr %19, %58 : <f32, ub> -> <f32, ub>
                  %result_8 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_9 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %60 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %61 = pto.vmul %result_8, %60, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %62 = pto.addptr %41, %58 : <f32, ub> -> <f32, ub>
                  pto.vsts %61, %62[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %57 : index
                }
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %51 = arith.index_cast %arg11 : i16 to index
                %52 = arith.muli %51, %c512 : index
                %53 = pto.addptr %39, %51 : <f32, ub> -> <f32, ub>
                %54 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %55 = arith.index_cast %arg12 : i16 to index
                  %56 = arith.index_cast %arg13 : index to i32
                  %mask_6, %scalar_out_7 = pto.plt_b32 %56 : i32 -> !pto.mask<b32>, i32
                  %57 = arith.index_cast %scalar_out_7 : i32 to index
                  %58 = arith.addi %52, %55 : index
                  %59 = pto.addptr %22, %58 : <f32, ub> -> <f32, ub>
                  %result_8 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_9 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %60 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %61 = pto.vmul %result_8, %60, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %61, %59[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %57 : index
                }
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
              %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %51 = arith.index_cast %arg11 : i16 to index
                %52 = arith.muli %51, %c512 : index
                %result_6 = pto.vlds %41[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %53 = arith.addi %52, %c64 : index
                %result_7 = pto.vlds %41[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %54 = arith.addi %52, %c128 : index
                %result_8 = pto.vlds %41[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %55 = arith.addi %52, %c192 : index
                %result_9 = pto.vlds %41[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %56 = arith.addi %52, %c256 : index
                %result_10 = pto.vlds %41[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %57 = arith.addi %52, %c320 : index
                %result_11 = pto.vlds %41[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %58 = arith.addi %52, %c384 : index
                %result_12 = pto.vlds %41[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = arith.addi %52, %c448 : index
                %result_13 = pto.vlds %41[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_14 = pto.vlds %22[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_15 = pto.vlds %22[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_16 = pto.vlds %22[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_17 = pto.vlds %22[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_18 = pto.vlds %22[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_19 = pto.vlds %22[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_20 = pto.vlds %22[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_21 = pto.vlds %22[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %60 = pto.vadd %result_6, %result_14, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %61 = pto.vadd %result_7, %result_15, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %62 = pto.vadd %result_8, %result_16, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.vadd %result_9, %result_17, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.vadd %result_10, %result_18, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %65 = pto.vadd %result_11, %result_19, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %66 = pto.vadd %result_12, %result_20, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %67 = pto.vadd %result_13, %result_21, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %60, %19[%52], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %61, %19[%53], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %62, %19[%54], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %63, %19[%55], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %64, %19[%56], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %65, %19[%57], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %66, %19[%58], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %67, %19[%59], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
              %47 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
              %result_4 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %result_4, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %49 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %result_5, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %23 = pto.addptr %arg5, %6 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %23, %22, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %24 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<f32, ub>
            %25 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
            %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %27 = pto.vsub %result, %result, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
            %28 = pto.pand %25, %mask, %26 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %27, %24[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = pto.vadd %27, %result_1, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.vsub %29, %result, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %31 = pto.vexp %30, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vadd %result_2, %31, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %22[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg10 : i16 to index
              %36 = arith.muli %35, %c512 : index
              %37 = pto.addptr %22, %35 : <f32, ub> -> <f32, ub>
              %38 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %39 = arith.index_cast %arg11 : i16 to index
                %40 = arith.index_cast %arg12 : index to i32
                %mask_3, %scalar_out_4 = pto.plt_b32 %40 : i32 -> !pto.mask<b32>, i32
                %41 = arith.index_cast %scalar_out_4 : i32 to index
                %42 = arith.addi %36, %39 : index
                %43 = pto.addptr %19, %42 : <f32, ub> -> <f32, ub>
                %result_5 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_6 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vdup %result_6, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %45 = pto.vdiv %result_5, %44, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %45, %43[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %41 : index
              }
            } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
            %33 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg10 : i16 to index
              %36 = arith.muli %35, %c512 : index
              %result_3 = pto.vlds %19[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = arith.addi %36, %c64 : index
              %result_4 = pto.vlds %19[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = arith.addi %36, %c128 : index
              %result_5 = pto.vlds %19[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = arith.addi %36, %c192 : index
              %result_6 = pto.vlds %19[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = arith.addi %36, %c256 : index
              %result_7 = pto.vlds %19[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = arith.addi %36, %c320 : index
              %result_8 = pto.vlds %19[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = arith.addi %36, %c384 : index
              %result_9 = pto.vlds %19[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = arith.addi %36, %c448 : index
              %result_10 = pto.vlds %19[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vcvt %result_3, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %45 = pto.vcvt %result_4, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %46 = pto.vcvt %result_5, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %47 = pto.vcvt %result_6, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %48 = pto.vcvt %result_7, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %49 = pto.vcvt %result_8, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %50 = pto.vcvt %result_9, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %51 = pto.vcvt %result_10, %26 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %44, %33[%36], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %45, %33[%37], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %46, %33[%38], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %47, %33[%39], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %48, %33[%40], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %49, %33[%41], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %50, %33[%42], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %51, %33[%43], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
        } else {
          pto.vecscope {
            %11 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %15 = arith.index_cast %arg10 : i16 to index
              %16 = arith.muli %15, %c512 : index
              %17 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %18 = arith.index_cast %arg11 : i16 to index
                %19 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b32 %19 : i32 -> !pto.mask<b32>, i32
                %20 = arith.index_cast %scalar_out : i32 to index
                %21 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %22 = arith.addi %16, %18 : index
                %23 = pto.addptr %11, %22 : <f32, ub> -> <f32, ub>
                pto.vsts %21, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %20 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %12 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %15 = arith.index_cast %arg10 : i16 to index
              %16 = arith.muli %15, %c512 : index
              %17 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c128_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %18 = arith.index_cast %arg11 : i16 to index
                %19 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b16 %19 : i32 -> !pto.mask<b16>, i32
                %20 = arith.index_cast %scalar_out : i32 to index
                %21 = pto.vdup %cst_0, %mask : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
                %22 = arith.addi %16, %18 : index
                %23 = pto.addptr %12, %22 : <bf16, ub> -> <bf16, ub>
                pto.vsts %21, %23[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                scf.yield %20 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %13 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            %14 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %15 = arith.index_cast %arg10 : i16 to index
              %16 = arith.muli %15, %c512 : index
              %result = pto.vlds %12[%16] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %17 = arith.addi %16, %c128 : index
              %result_1 = pto.vlds %12[%17] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %18 = arith.addi %16, %c256 : index
              %result_2 = pto.vlds %12[%18] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %19 = arith.addi %16, %c384 : index
              %result_3 = pto.vlds %12[%19] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              pto.vsts %result, %13[%16], %14 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %result_1, %13[%17], %14 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %result_2, %13[%18], %14 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
              pto.vsts %result_3, %13[%19], %14 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          }
        }
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
          %21 = pto.castptr %20 : i64 -> !pto.ptr<bf16, ub>
          %22 = arith.muli %14, %c4096 : index
          %23 = arith.addi %22, %17 : index
          %24 = pto.addptr %arg1, %23 : <bf16, gm> -> <bf16, gm>
          %25 = pto.addptr %21, %c0 : <bf16, ub> -> <bf16, ub>
          %26 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %25, %26, %c0_i64, %c1_i64, %c896_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
