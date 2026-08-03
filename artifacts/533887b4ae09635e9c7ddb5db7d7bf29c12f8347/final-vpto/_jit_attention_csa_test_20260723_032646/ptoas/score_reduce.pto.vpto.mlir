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
            %91 = arith.index_cast %arg11 : i16 to index
            %92 = arith.muli %91, %c64 : index
            %93 = pto.addptr %37, %92 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %93[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %94 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %95 = pto.addptr %45, %92 : <f32, ub> -> <f32, ub>
            pto.vsts %94, %95[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %79 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %91 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %94 = arith.index_cast %arg11 : i16 to index
            %95 = arith.muli %94, %c64 : index
            %result_1 = pto.vlds %45[%95] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %96 = pto.vmul %result_1, %result, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %96, %45[%95], %91 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %93 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %94 = arith.index_cast %arg11 : i16 to index
            %95 = arith.muli %94, %c64 : index
            %96 = pto.addptr %46, %95 : <f32, ub> -> <f32, ub>
            pto.vsts %93, %96[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %80 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %93 = arith.index_cast %arg11 : i16 to index
            %94 = arith.muli %93, %c64 : index
            %result = pto.vlds %45[%94] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %46[%94] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %95 = pto.vmax %result, %result_1, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %95, %45[%94], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
        }
        %81 = pto.alloc_tile addr = %c1024_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = arith.muli %100, %c64 : index
            %result_7 = pto.vlds %45[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = pto.vmul %result_7, %result, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %102, %46[%101], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %93 = pto.castptr %c99328_i64 : i64 -> !pto.ptr<f32, ub>
          %94 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %95 = pto.vdup %cst, %91 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %96 = pto.pand %94, %mask, %91 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = arith.muli %100, %c64 : index
            %result_7 = pto.vlds %46[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = pto.vcadd %result_7, %92 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %103 = pto.vadd %102, %95, %94 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %93[%100], %96 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_1 = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %93[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %39[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %97 = pto.vmul %result_1, %result_3, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %98 = pto.vmul %result_2, %result_4, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %97, %45[%c0], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %98, %45[%c64], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_5, %scalar_out_6 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = pto.addptr %45, %100 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %101[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_7, %101[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %99 = scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg12 = %c128) -> (index)  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = arith.index_cast %arg12 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %101 : i32 -> !pto.mask<b32>, i32
            %102 = arith.index_cast %scalar_out_8 : i32 to index
            %103 = pto.vdup %cst_0, %mask_7 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %104 = pto.addptr %46, %100 : <f32, ub> -> <f32, ub>
            pto.vsts %103, %104[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %102 : index
          }
        }
        %82 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
        pto.vecscope {
          %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %46[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.vmax %result, %result_2, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vmax %result_1, %result_3, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %92, %45[%c0], %94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %45[%c64], %94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %83 = pto.addptr %arg4, %56 : <f32, gm> -> <f32, gm>
        %84 = pto.addptr %83, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %47, %84, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %91 = arith.index_cast %arg11 : i16 to index
            %92 = arith.muli %91, %c64 : index
            %93 = pto.addptr %41, %92 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %93[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %94 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %95 = pto.addptr %48, %92 : <f32, ub> -> <f32, ub>
            pto.vsts %94, %95[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %85 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %94 = arith.index_cast %arg11 : i16 to index
            %95 = arith.muli %94, %c64 : index
            %result_1 = pto.vlds %48[%95] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %96 = pto.vmul %result_1, %result, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %96, %48[%95], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %93 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %94 = arith.index_cast %arg11 : i16 to index
            %95 = arith.muli %94, %c64 : index
            %96 = pto.addptr %49, %95 : <f32, ub> -> <f32, ub>
            pto.vsts %93, %96[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %86 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %93 = arith.index_cast %arg11 : i16 to index
            %94 = arith.muli %93, %c64 : index
            %result = pto.vlds %48[%94] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %49[%94] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %95 = pto.vmax %result, %result_1, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %95, %48[%94], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
        }
        %87 = pto.alloc_tile addr = %c99840_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = arith.muli %100, %c64 : index
            %result_7 = pto.vlds %48[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = pto.vmul %result_7, %result, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %102, %49[%101], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %93 = pto.castptr %c198144_i64 : i64 -> !pto.ptr<f32, ub>
          %94 = pto.vdup %cst, %91 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %96 = pto.pand %95, %mask, %91 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = arith.muli %100, %c64 : index
            %result_7 = pto.vlds %49[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = pto.vcadd %result_7, %92 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %103 = pto.vadd %102, %94, %95 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %93[%100], %96 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_1 = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %93[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %43[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %97 = pto.vmul %result_1, %result_3, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %98 = pto.vmul %result_2, %result_4, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %97, %48[%c0], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %98, %48[%c64], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_5, %scalar_out_6 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = pto.addptr %48, %100 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %101[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_7, %101[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %99 = scf.for %arg11 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg12 = %c128) -> (index)  : i16 {
            %100 = arith.index_cast %arg11 : i16 to index
            %101 = arith.index_cast %arg12 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %101 : i32 -> !pto.mask<b32>, i32
            %102 = arith.index_cast %scalar_out_8 : i32 to index
            %103 = pto.vdup %cst_0, %mask_7 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %104 = pto.addptr %49, %100 : <f32, ub> -> <f32, ub>
            pto.vsts %103, %104[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %102 : index
          }
        }
        %88 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
        pto.vecscope {
          %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %48[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %49[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %92 = pto.vmax %result, %result_2, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vmax %result_1, %result_3, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %92, %48[%c0], %94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %48[%c64], %94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %89 = pto.addptr %arg4, %64 : <f32, gm> -> <f32, gm>
        %90 = pto.addptr %89, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %50, %90, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
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
            %72 = arith.index_cast %arg10 : i16 to index
            %73 = arith.muli %72, %c64 : index
            %74 = pto.addptr %37, %73 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %74[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %75 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.addptr %45, %73 : <f32, ub> -> <f32, ub>
            pto.vsts %75, %76[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %66 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %72 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %75 = arith.index_cast %arg10 : i16 to index
            %76 = arith.muli %75, %c64 : index
            %result_1 = pto.vlds %45[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %77 = pto.vmul %result_1, %result, %73 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %77, %45[%76], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %74 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %75 = arith.index_cast %arg10 : i16 to index
            %76 = arith.muli %75, %c64 : index
            %77 = pto.addptr %48, %76 : <f32, ub> -> <f32, ub>
            pto.vsts %74, %77[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %67 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %72 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %73 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %74 = arith.index_cast %arg10 : i16 to index
            %75 = arith.muli %74, %c64 : index
            %result = pto.vlds %45[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %48[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %76 = pto.vmax %result, %result_1, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %76, %45[%75], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
        }
        %68 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %73 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %80 = arith.index_cast %arg10 : i16 to index
            %81 = arith.muli %80, %c64 : index
            %result_7 = pto.vlds %45[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %82 = pto.vmul %result_7, %result, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %82, %48[%81], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          %74 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %75 = pto.vdup %cst, %72 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %76 = pto.pand %74, %mask, %72 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
            %80 = arith.index_cast %arg10 : i16 to index
            %81 = arith.muli %80, %c64 : index
            %result_7 = pto.vlds %48[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %82 = pto.vcadd %result_7, %73 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vadd %82, %75, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %83, %43[%80], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_1 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %43[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %39[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %77 = pto.vmul %result_1, %result_3, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vmul %result_2, %result_4, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %77, %45[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %78, %45[%c64], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_5, %scalar_out_6 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg10 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %80 = arith.index_cast %arg10 : i16 to index
            %81 = pto.addptr %45, %80 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_7, %81[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %79 = scf.for %arg10 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg11 = %c128) -> (index)  : i16 {
            %80 = arith.index_cast %arg10 : i16 to index
            %81 = arith.index_cast %arg11 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %81 : i32 -> !pto.mask<b32>, i32
            %82 = arith.index_cast %scalar_out_8 : i32 to index
            %83 = pto.vdup %cst_0, %mask_7 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %84 = pto.addptr %48, %80 : <f32, ub> -> <f32, ub>
            pto.vsts %83, %84[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %82 : index
          }
        }
        %69 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
        pto.vecscope {
          %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %45[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %48[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %73 = pto.vmax %result, %result_2, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %result_1, %result_3, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %73, %45[%c0], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %74, %45[%c64], %75 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %70 = pto.addptr %arg4, %56 : <f32, gm> -> <f32, gm>
        %71 = pto.addptr %70, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %47, %71, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

