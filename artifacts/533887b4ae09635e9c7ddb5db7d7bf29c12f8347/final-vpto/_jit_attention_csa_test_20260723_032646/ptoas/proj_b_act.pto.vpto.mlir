module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @proj_b_act(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c64 = arith.constant 64 : index
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c18432_i64 = arith.constant 18432 : i64
      %c34816_i64 = arith.constant 34816 : i64
      %c34848_i64 = arith.constant 34848 : i64
      %c51232_i64 = arith.constant 51232 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c512 = arith.constant 512 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c512_i32 = arith.constant 512 : i32
      %c32_i64 = arith.constant 32 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c512 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c512 : index
          %21 = scf.for %arg7 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg8 = %c512) -> (index)  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.index_cast %arg8 : index to i32
            %mask, %scalar_out = pto.plt_b32 %23 : i32 -> !pto.mask<b32>, i32
            %24 = arith.index_cast %scalar_out : i32 to index
            %25 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = arith.addi %20, %22 : index
            %27 = pto.addptr %4, %26 : <f32, ub> -> <f32, ub>
            pto.vsts %25, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %24 : index
          }
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %5 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<i32, ub>
      %6 = pto.addptr %5, %c0 : <i32, ub> -> <i32, ub>
      %7 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %9 = pto.castptr %c34848_i64 : i64 -> !pto.ptr<i32, ub>
      %10 = pto.addptr %9, %c0 : <i32, ub> -> <i32, ub>
      %11 = pto.castptr %c51232_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg6 = %c0 to %c8 step %c2 {
        %19 = arith.muli %arg6, %c4096 : index
        %20 = arith.addi %19, %1 : index
        %21 = arith.addi %20, %c4096 : index
        %22 = pto.addptr %arg1, %20 : <i32, gm> -> <i32, gm>
        %23 = pto.addptr %22, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %23, %6, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %24 = arith.muli %arg6, %c8 : index
        %25 = pto.addptr %arg2, %24 : <f32, gm> -> <f32, gm>
        %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %8, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %27 = pto.addptr %arg1, %21 : <i32, gm> -> <i32, gm>
        %28 = pto.addptr %27, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %28, %10, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %29 = arith.addi %arg6, %c1 : index
        %30 = arith.muli %29, %c8 : index
        %31 = pto.addptr %arg2, %30 : <f32, gm> -> <f32, gm>
        %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %32, %12, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
          %34 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg7 : i16 to index
            %36 = arith.muli %35, %c512 : index
            scf.for %arg8 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
              %37 = arith.index_cast %arg8 : i16 to index
              %38 = arith.addi %36, %37 : index
              %39 = pto.addptr %5, %38 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %40 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.addptr %34, %38 : <f32, ub> -> <f32, ub>
              pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg7 : i16 to index
            %36 = arith.muli %35, %c512 : index
            %37 = pto.addptr %7, %35 : <f32, ub> -> <f32, ub>
            %38 = scf.for %arg8 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg9 = %c512) -> (index)  : i16 {
              %39 = arith.index_cast %arg8 : i16 to index
              %40 = arith.index_cast %arg9 : index to i32
              %mask_0, %scalar_out_1 = pto.plt_b32 %40 : i32 -> !pto.mask<b32>, i32
              %41 = arith.index_cast %scalar_out_1 : i32 to index
              %42 = arith.addi %36, %39 : index
              %43 = pto.addptr %34, %42 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vdup %result_2, %mask_0 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vmul %result, %44, %mask_0 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %45, %43[%c0], %mask_0 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %41 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %33 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.vecscope {
          %34 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_0 = pto.vlds %4[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_1 = pto.vlds %4[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_2 = pto.vlds %4[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_3 = pto.vlds %4[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_4 = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_5 = pto.vlds %4[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_6 = pto.vlds %4[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %34[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %34[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %34[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %34[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %34[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %34[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %34[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %34[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result, %result_7, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %result_0, %result_8, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %result_1, %result_9, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %result_2, %result_10, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %result_3, %result_11, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %result_4, %result_12, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %result_5, %result_13, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vadd %result_6, %result_14, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %34[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %34[%40], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %34[%41], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %34[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %34[%43], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %34[%44], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %34[%45], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %34[%46], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.castptr %c34848_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            scf.for %arg8 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
              %40 = arith.index_cast %arg8 : i16 to index
              %41 = arith.addi %39, %40 : index
              %42 = pto.addptr %9, %41 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %42[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %43 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.addptr %37, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %40 = pto.addptr %11, %38 : <f32, ub> -> <f32, ub>
            %41 = scf.for %arg8 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg9 = %c512) -> (index)  : i16 {
              %42 = arith.index_cast %arg8 : i16 to index
              %43 = arith.index_cast %arg9 : index to i32
              %mask_0, %scalar_out_1 = pto.plt_b32 %43 : i32 -> !pto.mask<b32>, i32
              %44 = arith.index_cast %scalar_out_1 : i32 to index
              %45 = arith.addi %39, %42 : index
              %46 = pto.addptr %37, %45 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vdup %result_2, %mask_0 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vmul %result, %47, %mask_0 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %48, %46[%c0], %mask_0 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %44 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %34[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_0 = pto.vlds %34[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_1 = pto.vlds %34[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_2 = pto.vlds %34[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_3 = pto.vlds %34[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_4 = pto.vlds %34[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_5 = pto.vlds %34[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_6 = pto.vlds %34[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %37[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %37[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %37[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %37[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %37[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %37[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %37[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %37[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result, %result_7, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %result_0, %result_8, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %result_1, %result_9, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %result_2, %result_10, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %result_3, %result_11, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %result_4, %result_12, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %result_5, %result_13, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vadd %result_6, %result_14, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %4[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %4[%40], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %4[%41], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %4[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %4[%43], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %4[%44], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %4[%45], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %4[%46], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
      }
      %13 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_0 = pto.vlds %3[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_1 = pto.vlds %3[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_2 = pto.vlds %3[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %3[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %3[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_5 = pto.vlds %3[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %3[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c512 : index
          %result_7 = pto.vlds %4[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %22, %c64 : index
          %result_8 = pto.vlds %4[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %22, %c128 : index
          %result_9 = pto.vlds %4[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %22, %c192 : index
          %result_10 = pto.vlds %4[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %22, %c256 : index
          %result_11 = pto.vlds %4[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %22, %c320 : index
          %result_12 = pto.vlds %4[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %22, %c384 : index
          %result_13 = pto.vlds %4[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %22, %c448 : index
          %result_14 = pto.vlds %4[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_7, %result, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_8, %result_0, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result_9, %result_1, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_10, %result_2, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_11, %result_3, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_12, %result_4, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_13, %result_5, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_14, %result_6, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %4[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %31, %4[%23], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %4[%24], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %4[%25], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %4[%26], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %4[%27], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %4[%28], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %4[%29], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %14 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xbf16, valid=?x?>
      %15 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c512 : index
          %result = pto.vlds %4[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %22, %c64 : index
          %result_0 = pto.vlds %4[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %22, %c128 : index
          %result_1 = pto.vlds %4[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %22, %c192 : index
          %result_2 = pto.vlds %4[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %22, %c256 : index
          %result_3 = pto.vlds %4[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %22, %c320 : index
          %result_4 = pto.vlds %4[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %22, %c384 : index
          %result_5 = pto.vlds %4[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %22, %c448 : index
          %result_6 = pto.vlds %4[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %31 = pto.vcvt %result_0, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %32 = pto.vcvt %result_1, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %33 = pto.vcvt %result_2, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %34 = pto.vcvt %result_3, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %35 = pto.vcvt %result_4, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %36 = pto.vcvt %result_5, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %37 = pto.vcvt %result_6, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %30, %15[%22], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %31, %15[%23], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %32, %15[%24], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %33, %15[%25], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %34, %15[%26], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %35, %15[%27], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %36, %15[%28], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %37, %15[%29], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %16 = pto.addptr %arg3, %1 : <bf16, gm> -> <bf16, gm>
      %17 = pto.addptr %15, %c0 : <bf16, ub> -> <bf16, ub>
      %18 = pto.addptr %16, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %17, %18, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

