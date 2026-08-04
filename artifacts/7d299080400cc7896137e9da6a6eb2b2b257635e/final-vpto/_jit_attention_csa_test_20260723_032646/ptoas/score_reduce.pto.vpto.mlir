module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @score_reduce(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c1_i16 = arith.constant 1 : i16
      %c128_i16 = arith.constant 128 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c198656_i64 = arith.constant 198656 : i64
      %c198912_i64 = arith.constant 198912 : i64
      %c33792_i64 = arith.constant 33792 : i64
      %c0_i64 = arith.constant 0 : i64
      %c132608_i64 = arith.constant 132608 : i64
      %c512_i64 = arith.constant 512 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c99328_i64 = arith.constant 99328 : i64
      %c99840_i64 = arith.constant 99840 : i64
      %c198144_i64 = arith.constant 198144 : i64
      %c4 = arith.constant 4 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c64 = arith.constant 64 : index
      %c8 = arith.constant 8 : index
      %c4096 = arith.constant 4096 : index
      %c127 = arith.constant 127 : index
      %c128 = arith.constant 128 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c1_i64 = arith.constant 1 : i64
      %c128_i32 = arith.constant 128 : i32
      %c64_i32 = arith.constant 64 : i32
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c4 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.divsi %1, %c2 : index
      %5 = arith.muli %4, %c2 : index
      %6 = arith.subi %1, %5 : index
      %7 = pto.load_scalar %arg0[%4] : !pto.ptr<i32, gm> -> i32
      %8 = arith.index_cast %7 : i32 to index
      %9 = arith.divsi %8, %c4 : index
      %10 = pto.load_scalar %arg1[%1] : !pto.ptr<i32, gm> -> i32
      %11 = arith.index_cast %10 : i32 to index
      %12 = arith.addi %11, %c1 : index
      %13 = arith.divsi %12, %c4 : index
      %14 = arith.minsi %9, %13 : index
      %15 = arith.minsi %14, %c4096 : index
      %16 = arith.addi %15, %c127 : index
      %17 = arith.divsi %16, %c128 : index
      %18 = arith.muli %4, %c128 : index
      %19 = arith.muli %6, %c64 : index
      %20 = arith.addi %18, %19 : index
      %21 = pto.addptr %arg2, %20 : <f32, gm> -> <f32, gm>
      %22 = pto.castptr %c198656_i64 : i64 -> !pto.ptr<f32, ub>
      %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      %24 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %23, %24, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %25 = arith.muli %1, %c64 : index
      %26 = pto.addptr %arg3, %25 : <f32, gm> -> <f32, gm>
      %27 = pto.castptr %c198912_i64 : i64 -> !pto.ptr<f32, ub>
      %28 = pto.addptr %26, %c0 : <f32, gm> -> <f32, gm>
      %29 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %28, %29, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %30 = arith.subi %17, %3 : index
      %31 = arith.addi %30, %c3 : index
      %32 = arith.divsi %31, %c4 : index
      %33 = arith.divsi %32, %c2 : index
      %34 = arith.muli %33, %c2 : index
      %35 = arith.muli %1, %c4096 : index
      %36 = arith.muli %4, %c64 : index
      %37 = pto.castptr %c33792_i64 : i64 -> !pto.ptr<i32, ub>
      %38 = pto.addptr %37, %c0 : <i32, ub> -> <i32, ub>
      %39 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %40 = pto.addptr %39, %c0 : <f32, ub> -> <f32, ub>
      %41 = pto.castptr %c132608_i64 : i64 -> !pto.ptr<i32, ub>
      %42 = pto.addptr %41, %c0 : <i32, ub> -> <i32, ub>
      %43 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
      %44 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
      %45 = pto.castptr %c33792_i64 : i64 -> !pto.ptr<f32, ub>
      %46 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
      %47 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
      %48 = pto.castptr %c132608_i64 : i64 -> !pto.ptr<f32, ub>
      %49 = pto.castptr %c99840_i64 : i64 -> !pto.ptr<f32, ub>
      %50 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg10 = %c0 to %34 step %c2 {
        %53 = arith.muli %arg10, %c4 : index
        %54 = arith.addi %3, %53 : index
        %55 = arith.muli %54, %c128 : index
        %56 = arith.addi %35, %55 : index
        %57 = arith.addi %36, %54 : index
        %58 = pto.load_scalar %arg5[%57] : !pto.ptr<i32, gm> -> i32
        %59 = arith.index_cast %58 : i32 to index
        %60 = arith.muli %59, %c128 : index
        %61 = arith.addi %53, %c4 : index
        %62 = arith.addi %3, %61 : index
        %63 = arith.muli %62, %c128 : index
        %64 = arith.addi %35, %63 : index
        %65 = arith.addi %36, %62 : index
        %66 = pto.load_scalar %arg5[%65] : !pto.ptr<i32, gm> -> i32
        %67 = arith.index_cast %66 : i32 to index
        %68 = arith.muli %67, %c128 : index
        %69 = arith.muli %56, %c64 : index
        %70 = pto.addptr %arg6, %69 : <i32, gm> -> <i32, gm>
        %71 = pto.addptr %70, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %71, %38, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %72 = pto.addptr %arg7, %60 : <f32, gm> -> <f32, gm>
        %73 = pto.addptr %72, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %73, %40, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %74 = arith.muli %64, %c64 : index
        %75 = pto.addptr %arg6, %74 : <i32, gm> -> <i32, gm>
        %76 = pto.addptr %75, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %76, %42, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %77 = pto.addptr %arg7, %68 : <f32, gm> -> <f32, gm>
        %78 = pto.addptr %77, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %78, %44, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %97 = pto.addptr %37, %96 : <i32, ub> -> <i32, ub>
            %result_10 = pto.vlds %97[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %98 = pto.vcvt %result_10, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %99 = pto.addptr %45, %96 : <f32, ub> -> <f32, ub>
            pto.vsts %98, %99[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %85 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %result_10 = pto.vlds %45[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %97 = pto.vmul %result_10, %result, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %97, %45[%96], %85 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %87 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %97 = pto.addptr %46, %96 : <f32, ub> -> <f32, ub>
            pto.vsts %87, %97[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          %result_1 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %88 = pto.castptr %c99328_i64 : i64 -> !pto.ptr<f32, ub>
          %89 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %90 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %91 = pto.pand %89, %mask_2, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %result_10 = pto.vlds %45[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %46[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %97 = pto.vmax %result_10, %result_11, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %97, %45[%96], %85 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %98 = pto.vmul %97, %result_1, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %98, %46[%96], %85 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %99 = pto.vcadd %98, %85 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %100 = pto.vadd %99, %90, %89 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %100, %88[%95], %91 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_4 = pto.vlds %88[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %88[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %39[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vmul %result_4, %result_6, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vmul %result_5, %result_7, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %45[%c0], %85 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %45[%c64], %85 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_8, %scalar_out_9 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = pto.addptr %45, %95 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %96[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_10, %96[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %94 = scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg12 = %c128) -> (index)  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.index_cast %arg12 : index to i32
            %mask_10, %scalar_out_11 = pto.plt_b32 %96 : i32 -> !pto.mask<b32>, i32
            %97 = arith.index_cast %scalar_out_11 : i32 to index
            %98 = pto.vdup %cst_0, %mask_10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %99 = pto.addptr %46, %95 : <f32, ub> -> <f32, ub>
            pto.vsts %98, %99[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %97 : index
          }
        }
        %79 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
        pto.vecscope {
          %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %46[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %85 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %86 = pto.vmax %result, %result_2, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vmax %result_1, %result_3, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %86, %45[%c0], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %87, %45[%c64], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %80 = pto.addptr %arg4, %56 : <f32, gm> -> <f32, gm>
        %81 = pto.addptr %80, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %47, %81, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %97 = pto.addptr %41, %96 : <i32, ub> -> <i32, ub>
            %result_10 = pto.vlds %97[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %98 = pto.vcvt %result_10, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %99 = pto.addptr %48, %96 : <f32, ub> -> <f32, ub>
            pto.vsts %98, %99[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %85 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %86 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %result_10 = pto.vlds %48[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %97 = pto.vmul %result_10, %result, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %97, %48[%96], %86 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %87 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %97 = pto.addptr %49, %96 : <f32, ub> -> <f32, ub>
            pto.vsts %87, %97[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          %result_1 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %88 = pto.castptr %c198144_i64 : i64 -> !pto.ptr<f32, ub>
          %89 = pto.vdup %cst, %85 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %90 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %91 = pto.pand %90, %mask_2, %85 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.muli %95, %c64 : index
            %result_10 = pto.vlds %48[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %49[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %97 = pto.vmax %result_10, %result_11, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %97, %48[%96], %86 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %98 = pto.vmul %97, %result_1, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %98, %49[%96], %86 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %99 = pto.vcadd %98, %86 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %100 = pto.vadd %99, %89, %90 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %100, %88[%95], %91 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_4 = pto.vlds %88[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %88[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %43[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vmul %result_4, %result_6, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vmul %result_5, %result_7, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %48[%c0], %86 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %48[%c64], %86 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_8, %scalar_out_9 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = pto.addptr %48, %95 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %96[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_10, %96[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %94 = scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg12 = %c128) -> (index)  : i16 {
            %95 = arith.index_cast %arg11 : i16 to index
            %96 = arith.index_cast %arg12 : index to i32
            %mask_10, %scalar_out_11 = pto.plt_b32 %96 : i32 -> !pto.mask<b32>, i32
            %97 = arith.index_cast %scalar_out_11 : i32 to index
            %98 = pto.vdup %cst_0, %mask_10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %99 = pto.addptr %49, %95 : <f32, ub> -> <f32, ub>
            pto.vsts %98, %99[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %97 : index
          }
        }
        %82 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
        pto.vecscope {
          %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %48[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %49[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %85 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %86 = pto.vmax %result, %result_2, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vmax %result_1, %result_3, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %86, %48[%c0], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %87, %48[%c64], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %83 = pto.addptr %arg4, %64 : <f32, gm> -> <f32, gm>
        %84 = pto.addptr %83, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %50, %84, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      %51 = arith.subi %32, %34 : index
      %52 = arith.cmpi eq, %51, %c1 : index
      scf.if %52 {
        %53 = arith.muli %33, %c8 : index
        %54 = arith.addi %3, %53 : index
        %55 = arith.muli %54, %c128 : index
        %56 = arith.addi %35, %55 : index
        %57 = arith.addi %36, %54 : index
        %58 = pto.load_scalar %arg5[%57] : !pto.ptr<i32, gm> -> i32
        %59 = arith.index_cast %58 : i32 to index
        %60 = arith.muli %59, %c128 : index
        %61 = arith.muli %56, %c64 : index
        %62 = pto.addptr %arg6, %61 : <i32, gm> -> <i32, gm>
        %63 = pto.addptr %62, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %63, %38, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %64 = pto.addptr %arg7, %60 : <f32, gm> -> <f32, gm>
        %65 = pto.addptr %64, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %65, %40, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %78 = arith.index_cast %arg10 : i16 to index
            %79 = arith.muli %78, %c64 : index
            %80 = pto.addptr %37, %79 : <i32, ub> -> <i32, ub>
            %result_10 = pto.vlds %80[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %81 = pto.vcvt %result_10, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %82 = pto.addptr %45, %79 : <f32, ub> -> <f32, ub>
            pto.vsts %81, %82[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %69 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %70 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %78 = arith.index_cast %arg10 : i16 to index
            %79 = arith.muli %78, %c64 : index
            %result_10 = pto.vlds %45[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %80 = pto.vmul %result_10, %result, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %80, %45[%79], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %71 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %78 = arith.index_cast %arg10 : i16 to index
            %79 = arith.muli %78, %c64 : index
            %80 = pto.addptr %48, %79 : <f32, ub> -> <f32, ub>
            pto.vsts %71, %80[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          %result_1 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %73 = pto.vdup %cst, %70 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %74 = pto.pand %72, %mask_2, %70 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %78 = arith.index_cast %arg10 : i16 to index
            %79 = arith.muli %78, %c64 : index
            %result_10 = pto.vlds %45[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %48[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %80 = pto.vmax %result_10, %result_11, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %80, %45[%79], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %81 = pto.vmul %80, %result_1, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %81, %48[%79], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %82 = pto.vcadd %81, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vadd %82, %73, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %83, %43[%78], %74 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_4 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %43[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %39[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %75 = pto.vmul %result_4, %result_6, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vmul %result_5, %result_7, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %75, %45[%c0], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %76, %45[%c64], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_8, %scalar_out_9 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %78 = arith.index_cast %arg10 : i16 to index
            %79 = pto.addptr %45, %78 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %79[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_10, %79[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %77 = scf.for %arg10 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg11 = %c128) -> (index)  : i16 {
            %78 = arith.index_cast %arg10 : i16 to index
            %79 = arith.index_cast %arg11 : index to i32
            %mask_10, %scalar_out_11 = pto.plt_b32 %79 : i32 -> !pto.mask<b32>, i32
            %80 = arith.index_cast %scalar_out_11 : i32 to index
            %81 = pto.vdup %cst_0, %mask_10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %82 = pto.addptr %48, %78 : <f32, ub> -> <f32, ub>
            pto.vsts %81, %82[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %80 : index
          }
        }
        %66 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
        pto.vecscope {
          %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %48[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %70 = pto.vmax %result, %result_2, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vmax %result_1, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %70, %45[%c0], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %71, %45[%c64], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %67 = pto.addptr %arg4, %56 : <f32, gm> -> <f32, gm>
        %68 = pto.addptr %67, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %47, %68, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
