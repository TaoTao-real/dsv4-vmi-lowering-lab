module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c64_i16 = arith.constant 64 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c24832_i64 = arith.constant 24832 : i64
      %c33024_i64 = arith.constant 33024 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c24704_i64 = arith.constant 24704 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c2 = arith.constant 2 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c8 = arith.constant 8 : index
      %c512 = arith.constant 512 : index
      %c448 = arith.constant 448 : index
      %c16 = arith.constant 16 : index
      %c64_i64 = arith.constant 64 : i64
      %c256_i64 = arith.constant 256 : i64
      %c32_i32 = arith.constant 32 : i32
      %c262144 = arith.constant 262144 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c64 : index
      %5 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %5, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %18, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %6 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %18 = arith.index_cast %arg6 : index to i32
        pto.store %18, %6[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %7 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.addptr %6, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %18[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %19 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %21 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result_2 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.pand %21, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        %24 = pto.vdup %cst_0, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result_3 = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_3, %result_2, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %5[%28], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = pto.vmul %29, %24, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %7[%28], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %29 = pto.addptr %7, %28 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %31 = pto.addptr %6, %28 : <i32, ub> -> <i32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %29 = pto.addptr %6, %28 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.addptr %7, %28 : <f32, ub> -> <f32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %25 = pto.vdup %cst_1, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.vdup %cst, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result_3 = pto.vlds %7[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_3, %25, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vsub %result_4, %29, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result_4, %26, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %5[%28], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = pto.vmul %30, %25, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %7[%28], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %8 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %20 = pto.pand %19, %mask, %18 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c32 : index
          %result = pto.vlds %5[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %7[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vsub %result, %result_2, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %5[%23], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %21 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c32 : index
          %24 = pto.addptr %5, %23 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %26 = pto.addptr %21, %23 : <i32, ub> -> <i32, ub>
          pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %9 = arith.muli %1, %c4 : index
      %10 = arith.muli %3, %c262144 : index
      %11 = arith.muli %3, %c4096 : index
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
      %14 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
      %16 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.addptr %16, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %18 = arith.addi %9, %arg6 : index
        %19 = arith.divsi %18, %c8 : index
        %20 = arith.muli %19, %c8 : index
        %21 = arith.subi %18, %20 : index
        %22 = arith.muli %21, %c512 : index
        %23 = arith.addi %22, %c448 : index
        %24 = arith.muli %19, %c128 : index
        %25 = arith.addi %24, %4 : index
        %26 = arith.muli %18, %c64 : index
        %27 = arith.addi %10, %26 : index
        %28 = arith.muli %25, %c4096 : index
        scf.for %arg7 = %c0 to %c32 step %c16 {
          %29 = arith.muli %arg7, %c2 : index
          %30 = arith.addi %27, %29 : index
          %31 = pto.addptr %arg1, %30 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %31, %7, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %32 = arith.addi %11, %29 : index
          %33 = pto.addptr %arg2, %32 : <f32, gm> -> <f32, gm>
          %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %34, %13, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %35 = pto.addptr %arg3, %32 : <f32, gm> -> <f32, gm>
          %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %36, %15, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %42 = pto.castptr %c24704_i64 : i64 -> !pto.ptr<f32, ub>
            %43 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %45 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %46 = pto.pand %45, %mask, %44 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %48 = arith.index_cast %arg8 : i16 to index
              %49 = arith.index_cast %48 : index to i64
              %50 = arith.muli %49, %c128_i64 : i64
              %51 = arith.addi %50, %c33024_i64 : i64
              %52 = arith.addi %50, %c24832_i64 : i64
              %53 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
              %54 = pto.castptr %52 : i64 -> !pto.ptr<i32, ub>
              %55 = pto.addptr %54, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %55[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %56 = pto.vgather2 %53, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %56, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %57 = arith.addi %50, %c16384_i64 : i64
              %58 = pto.castptr %57 : i64 -> !pto.ptr<f32, ub>
              %result_2 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_2, %58[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %47 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %48 = arith.index_cast %arg8 : i16 to index
              %49 = arith.muli %48, %c32 : index
              %result = pto.vlds %7[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %12[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vmul %result, %result_2, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %47[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %14[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmul %result_3, %result_4, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %12[%49], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %52 = pto.vadd %50, %51, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %52, %7[%49], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          %37 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
          pto.vecscope {
            %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %43 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %44 = pto.pand %43, %43, %42 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %45 = arith.index_cast %arg8 : i16 to index
              %46 = arith.muli %45, %c32 : index
              %result = pto.vlds %7[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vcvt %result, %42 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %47, %16[%46], %44 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %38 = arith.addi %23, %29 : index
          %39 = arith.addi %28, %38 : index
          %40 = pto.addptr %arg0, %39 : <bf16, gm> -> <bf16, gm>
          %41 = pto.addptr %40, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %17, %41, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c8192_i64, %c64_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
