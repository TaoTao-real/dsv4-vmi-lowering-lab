module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rmsnorm_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c4_i16 = arith.constant 4 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c25152_i64 = arith.constant 25152 : i64
      %c29248_i64 = arith.constant 29248 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c12352_i64 = arith.constant 12352 : i64
      %c0_i64 = arith.constant 0 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c20544_i64 = arith.constant 20544 : i64
      %c24640_i64 = arith.constant 24640 : i64
      %c24896_i64 = arith.constant 24896 : i64
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %cst_0 = arith.constant 7.812500e-03 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c64_i32 = arith.constant 64 : i32
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c1_i32 = arith.constant 1 : i32
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %0 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %27 = arith.muli %26, %c32 : index
          %28 = pto.addptr %0, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %25, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %27 = arith.muli %26, %c32 : index
          %28 = pto.addptr %1, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %25, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg5 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %2, %26 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.addptr %0, %26 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      %5 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %5, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %27 = arith.muli %26, %c32 : index
          %28 = pto.addptr %2, %27 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.addptr %1, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %7[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %25 = pto.addptr %arg2, %arg5 : <f32, gm> -> <f32, gm>
        %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %27 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %34 = pto.addptr %2, %33 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vmul %result_10, %result_10, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.addptr %27, %33 : <f32, ub> -> <f32, ub>
            pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %28 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %mask_5, %scalar_out_6 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          %29 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %34 = pto.addptr %27, %33 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vcadd %result_10, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vadd %29, %35, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.addptr %28, %32 : <f32, ub> -> <f32, ub>
            pto.vsts %36, %37[%c0], %mask_5 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask_8, %scalar_out_9 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.vadd %result, %result_7, %mask_8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %7[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %26 = pto.vadds %result_5, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %26, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %27 = pto.vsqrt %result_6, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %27, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %28 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %29 = pto.vdiv %28, %result_7, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %29, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %9, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %10 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %arg3, %c0 : <bf16, gm> -> <bf16, gm>
      %12 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %11, %12, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %12[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %26 = pto.vcvt %result, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %26, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.addptr %8, %28 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_5, %32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %27 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result_5, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %32 = pto.addptr %27, %29 : <bf16, ub> -> <bf16, ub>
          pto.vsts %31, %32[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %15 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.addptr %15, %c0 : <bf16, ub> -> <bf16, ub>
      %17 = pto.addptr %arg4, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %16, %17, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %18 = pto.addptr %arg2, %c64 : <f32, gm> -> <f32, gm>
      %19 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %19, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %20 = pto.addptr %arg3, %c64 : <bf16, gm> -> <bf16, gm>
      %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %21, %12, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %result = pto.vlds %12[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %26 = pto.vcvt %result, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %26, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.addptr %8, %28 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_5, %32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %27 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %13, %29 : <f32, ub> -> <f32, ub>
          pto.vsts %27, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %22 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c64 step %c1 {
        %25 = arith.index_cast %arg5 : index to i32
        pto.store %25, %22[%arg5] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.vecscope {
        %25 = pto.addptr %22, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %25[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %26, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmuls %result_5, %cst_3, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result_5, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %39 = pto.addptr %22, %36 : <i32, ub> -> <i32, ub>
          pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %22, %36 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vcvt %result_5, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result_5, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %39 = pto.addptr %27, %36 : <i32, ub> -> <i32, ub>
          pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmuls %result_5, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vsub %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vadds %result_5, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %28 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmuls %result_5, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.addptr %28, %36 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %28, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vsub %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %29 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result_5, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %39 = pto.addptr %29, %36 : <i32, ub> -> <i32, ub>
          pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmuls %result_5, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %30 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vsub %result_5, %30, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %31 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %32 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.index_cast %35 : index to i64
          %37 = arith.muli %36, %c128_i64 : i64
          %38 = arith.addi %37, %c25152_i64 : i64
          %39 = arith.muli %36, %c256_i64 : i64
          %40 = arith.addi %39, %c16448_i64 : i64
          %41 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.castptr %40 : i64 -> !pto.ptr<i32, ub>
          %43 = pto.addptr %42, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %43[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %44 = pto.vgather2 %41, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %45 = arith.addi %39, %c20544_i64 : i64
          %result_6 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.addptr %46, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_6, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.index_cast %35 : index to i64
          %37 = arith.muli %36, %c128_i64 : i64
          %38 = arith.addi %37, %c29248_i64 : i64
          %39 = arith.muli %36, %c256_i64 : i64
          %40 = arith.addi %39, %c16448_i64 : i64
          %41 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.castptr %40 : i64 -> !pto.ptr<i32, ub>
          %43 = pto.addptr %42, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %43[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %44 = pto.vgather2 %41, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %45 = arith.addi %39, %c25152_i64 : i64
          %result_6 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.addptr %46, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_6, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %33 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %34 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.index_cast %35 : index to i64
          %37 = arith.muli %36, %c256_i64 : i64
          %38 = arith.addi %37, %c4096_i64 : i64
          %39 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %40 = pto.castptr %37 : i64 -> !pto.ptr<i32, ub>
          %41 = pto.addptr %40, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %42 = pto.vgather2 %39, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %43 = arith.addi %37, %c16448_i64 : i64
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_6, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %2, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %28, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %8, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          pto.vsts %39, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %0, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %2, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.addptr %13, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %2, %36 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result_5, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %39 = pto.addptr %15, %36 : <bf16, ub> -> <bf16, ub>
          pto.vsts %38, %39[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %23 = pto.addptr %arg4, %c64 : <bf16, gm> -> <bf16, gm>
      %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %16, %24, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
