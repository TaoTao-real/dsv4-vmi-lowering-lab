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
      %1 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %16, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %3 = arith.muli %0, %c32768 : index
      %4 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %5 = pto.addptr %4, %c0 : <bf16, ub> -> <bf16, ub>
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %7 = pto.addptr %6, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %16 = arith.muli %arg5, %c128 : index
        %17 = arith.addi %16, %c128 : index
        %18 = arith.addi %3, %16 : index
        %19 = pto.addptr %arg0, %18 : <bf16, gm> -> <bf16, gm>
        %20 = pto.addptr %19, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %20, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %21 = arith.addi %3, %17 : index
        %22 = pto.addptr %arg0, %21 : <bf16, gm> -> <bf16, gm>
        %23 = pto.addptr %22, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %23, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %25 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %37 = arith.index_cast %arg7 : i16 to index
              %38 = arith.addi %36, %37 : index
              %39 = pto.addptr %4, %38 : <bf16, ub> -> <bf16, ub>
              %result_10 = pto.vlds %39[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %40 = pto.vcvt %result_10, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %41 = pto.addptr %25, %38 : <f32, ub> -> <f32, ub>
              pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %37 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %38 = arith.index_cast %arg7 : i16 to index
              %39 = arith.index_cast %arg8 : index to i32
              %mask_10, %scalar_out_11 = pto.plt_b32 %39 : i32 -> !pto.mask<b32>, i32
              %40 = arith.index_cast %scalar_out_11 : i32 to index
              %41 = arith.addi %36, %38 : index
              %42 = pto.addptr %25, %41 : <f32, ub> -> <f32, ub>
              %result_12 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vmul %result_12, %result_12, %mask_10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %42[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %40 : index
            }
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %26 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          %27 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %37:2 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %27, %arg9 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %39 = arith.index_cast %arg7 : i16 to index
              %40 = arith.index_cast %arg9 : index to i32
              %mask_10, %scalar_out_11 = pto.plt_b32 %40 : i32 -> !pto.mask<b32>, i32
              %41 = arith.index_cast %scalar_out_11 : i32 to index
              %42 = arith.addi %36, %39 : index
              %43 = pto.addptr %25, %42 : <f32, ub> -> <f32, ub>
              %result_12 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vcadd %result_12, %mask_10 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vadd %arg8, %44, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %45, %41 : !pto.vreg<64xf32>, index
            }
            %38 = pto.addptr %26, %35 : <f32, ub> -> <f32, ub>
            pto.vsts %37#0, %38[%c0], %mask_3 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.vadd %result, %result_5, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %29, %30[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %37 = arith.index_cast %arg7 : i16 to index
              %38 = arith.addi %36, %37 : index
              %39 = pto.addptr %6, %38 : <bf16, ub> -> <bf16, ub>
              %result_10 = pto.vlds %39[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %40 = pto.vcvt %result_10, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %41 = pto.addptr %31, %38 : <f32, ub> -> <f32, ub>
              pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %37 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %38 = arith.index_cast %arg7 : i16 to index
              %39 = arith.index_cast %arg8 : index to i32
              %mask_10, %scalar_out_11 = pto.plt_b32 %39 : i32 -> !pto.mask<b32>, i32
              %40 = arith.index_cast %scalar_out_11 : i32 to index
              %41 = arith.addi %36, %38 : index
              %42 = pto.addptr %31, %41 : <f32, ub> -> <f32, ub>
              %result_12 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vmul %result_12, %result_12, %mask_10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %42[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %40 : index
            }
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %32 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %37:2 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %27, %arg9 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %39 = arith.index_cast %arg7 : i16 to index
              %40 = arith.index_cast %arg9 : index to i32
              %mask_10, %scalar_out_11 = pto.plt_b32 %40 : i32 -> !pto.mask<b32>, i32
              %41 = arith.index_cast %scalar_out_11 : i32 to index
              %42 = arith.addi %36, %39 : index
              %43 = pto.addptr %31, %42 : <f32, ub> -> <f32, ub>
              %result_12 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vcadd %result_12, %mask_10 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vadd %arg8, %44, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %45, %41 : !pto.vreg<64xf32>, index
            }
            %38 = pto.addptr %32, %35 : <f32, ub> -> <f32, ub>
            pto.vsts %37#0, %38[%c0], %mask_3 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_8 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
          %result_9 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result_8, %result_9, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %2[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %16, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %18 = pto.vadds %result_3, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %18, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %19 = pto.vsqrt %result_4, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vmuls %19, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vadds %20, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vdiv %21, %19, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      %12 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %14 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %16 = arith.muli %arg5, %c128 : index
        %17 = arith.addi %16, %c128 : index
        %18 = arith.addi %3, %16 : index
        %19 = pto.addptr %arg0, %18 : <bf16, gm> -> <bf16, gm>
        %20 = pto.addptr %19, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %20, %11, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %21 = pto.addptr %arg2, %16 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %21, %12, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %22 = arith.addi %3, %17 : index
        %23 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %24, %7, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %25 = pto.addptr %arg2, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %25, %13, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %34 = arith.index_cast %arg7 : i16 to index
              %35 = arith.addi %33, %34 : index
              %36 = pto.addptr %10, %35 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %36[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %37 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %38 = pto.addptr %8, %35 : <f32, ub> -> <f32, ub>
              pto.vsts %37, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %31 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = pto.addptr %12, %32 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %33[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %34 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %35 = pto.addptr %31, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c128 : index
            %34 = pto.addptr %9, %32 : <f32, ub> -> <f32, ub>
            %35 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %36 = arith.index_cast %arg7 : i16 to index
              %37 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %37 : i32 -> !pto.mask<b32>, i32
              %38 = arith.index_cast %scalar_out_4 : i32 to index
              %39 = arith.addi %33, %36 : index
              %40 = pto.addptr %8, %39 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %42 = pto.vmul %result, %41, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %42, %40[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %38 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c128 : index
            %34 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %35 = arith.index_cast %arg7 : i16 to index
              %36 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %36 : i32 -> !pto.mask<b32>, i32
              %37 = arith.index_cast %scalar_out_4 : i32 to index
              %38 = arith.addi %33, %35 : index
              %39 = pto.addptr %8, %38 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.addptr %31, %35 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %41, %39[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %37 : index
            }
          } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %34 = arith.index_cast %arg7 : i16 to index
              %35 = arith.addi %33, %34 : index
              %36 = pto.addptr %8, %35 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %38 = pto.addptr %14, %35 : <bf16, ub> -> <bf16, ub>
              pto.vsts %37, %38[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %26 = pto.addptr %arg1, %18 : <bf16, gm> -> <bf16, gm>
        %27 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %15, %27, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %31 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = arith.muli %33, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %35 = arith.index_cast %arg7 : i16 to index
              %36 = arith.addi %34, %35 : index
              %37 = pto.addptr %6, %36 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %37[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %38 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %39 = pto.addptr %31, %36 : <f32, ub> -> <f32, ub>
              pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %32 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = pto.addptr %13, %33 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %34[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %35 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %36 = pto.addptr %32, %33 : <f32, ub> -> <f32, ub>
            pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = arith.muli %33, %c128 : index
            %35 = pto.addptr %9, %33 : <f32, ub> -> <f32, ub>
            %36 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %37 = arith.index_cast %arg7 : i16 to index
              %38 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %38 : i32 -> !pto.mask<b32>, i32
              %39 = arith.index_cast %scalar_out_4 : i32 to index
              %40 = arith.addi %34, %37 : index
              %41 = pto.addptr %31, %40 : <f32, ub> -> <f32, ub>
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
              %40 = pto.addptr %31, %39 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.addptr %32, %36 : <f32, ub> -> <f32, ub>
              %result_5 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.vmul %result, %result_5, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %42, %40[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %38 : index
            }
          } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg6 : i16 to index
            %34 = arith.muli %33, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %35 = arith.index_cast %arg7 : i16 to index
              %36 = arith.addi %34, %35 : index
              %37 = pto.addptr %31, %36 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %39 = pto.addptr %4, %36 : <bf16, ub> -> <bf16, ub>
              pto.vsts %38, %39[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %28 = pto.addptr %arg1, %22 : <bf16, gm> -> <bf16, gm>
        %29 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %5, %29, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

