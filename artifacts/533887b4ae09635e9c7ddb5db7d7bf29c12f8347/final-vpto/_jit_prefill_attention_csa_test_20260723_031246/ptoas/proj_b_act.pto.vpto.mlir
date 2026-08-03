module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @proj_b_act(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c34816_i64 = arith.constant 34816 : i64
      %c67584_i64 = arith.constant 67584 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c32768 = arith.constant 32768 : index
      %c8 = arith.constant 8 : index
      %c4 = arith.constant 4 : index
      %c512 = arith.constant 512 : index
      %c32 = arith.constant 32 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c16_i64 = arith.constant 16 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c64 = arith.constant 64 : index
      %c512_i32 = arith.constant 512 : i32
      %c64_i64 = arith.constant 64 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c4 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %1, %c512 : index
      %5 = arith.muli %3, %c32 : index
      %6 = pto.addptr %arg0, %4 : <f32, gm> -> <f32, gm>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %8 = arith.addi %5, %c32 : index
      %9 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<i32, ub>
      %11 = pto.addptr %10, %c0 : <i32, ub> -> <i32, ub>
      %12 = pto.castptr %c67584_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
      %14 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %5 to %8 step %c16 {
        pto.vecscope {
          scf.for %arg7 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.muli %23, %c512 : index
            %25 = scf.for %arg8 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg9 = %c512) -> (index)  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.index_cast %arg9 : index to i32
              %mask, %scalar_out = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
              %28 = arith.index_cast %scalar_out : i32 to index
              %29 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %30 = arith.addi %24, %26 : index
              %31 = pto.addptr %9, %30 : <f32, ub> -> <f32, ub>
              pto.vsts %29, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %28 : index
            }
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %16 = arith.muli %arg6, %c32768 : index
        scf.for %arg7 = %c0 to %c8 step %c1 {
          %23 = arith.muli %arg7, %c4096 : index
          %24 = arith.addi %23, %4 : index
          %25 = arith.addi %16, %24 : index
          %26 = pto.addptr %arg2, %25 : <i32, gm> -> <i32, gm>
          %27 = pto.addptr %26, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %27, %11, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %28 = arith.muli %arg7, %c128 : index
          %29 = arith.addi %28, %arg6 : index
          %30 = pto.addptr %arg3, %29 : <f32, gm> -> <f32, gm>
          %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %31, %13, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            %32 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.muli %35, %c512 : index
              scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %37 = arith.index_cast %arg9 : i16 to index
                %38 = arith.addi %36, %37 : index
                %39 = pto.addptr %10, %38 : <i32, ub> -> <i32, ub>
                %result = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %40 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %41 = pto.addptr %32, %38 : <f32, ub> -> <f32, ub>
                pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.muli %35, %c512 : index
              %37 = pto.addptr %12, %35 : <f32, ub> -> <f32, ub>
              %38 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
                %39 = arith.index_cast %arg9 : i16 to index
                %40 = arith.index_cast %arg10 : index to i32
                %mask_0, %scalar_out_1 = pto.plt_b32 %40 : i32 -> !pto.mask<b32>, i32
                %41 = arith.index_cast %scalar_out_1 : i32 to index
                %42 = arith.addi %36, %39 : index
                %43 = pto.addptr %32, %42 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vdup %result_2, %mask_0 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %45 = pto.vmul %result, %44, %mask_0 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %45, %43[%c0], %mask_0 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %41 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.muli %35, %c512 : index
              %result = pto.vlds %9[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = arith.addi %36, %c64 : index
              %result_0 = pto.vlds %9[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = arith.addi %36, %c128 : index
              %result_1 = pto.vlds %9[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = arith.addi %36, %c192 : index
              %result_2 = pto.vlds %9[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = arith.addi %36, %c256 : index
              %result_3 = pto.vlds %9[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = arith.addi %36, %c320 : index
              %result_4 = pto.vlds %9[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = arith.addi %36, %c384 : index
              %result_5 = pto.vlds %9[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = arith.addi %36, %c448 : index
              %result_6 = pto.vlds %9[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %32[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %32[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %32[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %32[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %32[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %32[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %32[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %32[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vadd %result, %result_7, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vadd %result_0, %result_8, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.vadd %result_1, %result_9, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vadd %result_2, %result_10, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vadd %result_3, %result_11, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vadd %result_4, %result_12, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vadd %result_5, %result_13, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vadd %result_6, %result_14, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %9[%36], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %45, %9[%37], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %46, %9[%38], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %47, %9[%39], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %9[%40], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %9[%41], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %9[%42], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %51, %9[%43], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
        }
        %17 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        pto.vecscope {
          %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %7[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %7[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %7[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %7[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %7[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %7[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %7[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %25 = arith.index_cast %arg7 : i16 to index
            %26 = arith.muli %25, %c512 : index
            %result_7 = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = arith.addi %26, %c64 : index
            %result_8 = pto.vlds %9[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %28 = arith.addi %26, %c128 : index
            %result_9 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.addi %26, %c192 : index
            %result_10 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = arith.addi %26, %c256 : index
            %result_11 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %26, %c320 : index
            %result_12 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = arith.addi %26, %c384 : index
            %result_13 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = arith.addi %26, %c448 : index
            %result_14 = pto.vlds %9[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vmul %result_7, %result, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %35 = pto.vmul %result_8, %result_0, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_9, %result_1, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_10, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result_11, %result_3, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vmul %result_12, %result_4, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result_13, %result_5, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %41 = pto.vmul %result_14, %result_6, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %34, %9[%26], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %35, %9[%27], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %36, %9[%28], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %37, %9[%29], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %38, %9[%30], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %39, %9[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %40, %9[%32], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %41, %9[%33], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %18 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
        pto.vecscope {
          %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %25 = arith.index_cast %arg7 : i16 to index
            %26 = arith.muli %25, %c512 : index
            %result = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = arith.addi %26, %c64 : index
            %result_0 = pto.vlds %9[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %28 = arith.addi %26, %c128 : index
            %result_1 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.addi %26, %c192 : index
            %result_2 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = arith.addi %26, %c256 : index
            %result_3 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %26, %c320 : index
            %result_4 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = arith.addi %26, %c384 : index
            %result_5 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = arith.addi %26, %c448 : index
            %result_6 = pto.vlds %9[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vcvt %result, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %35 = pto.vcvt %result_0, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %36 = pto.vcvt %result_1, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %37 = pto.vcvt %result_2, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %38 = pto.vcvt %result_3, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %39 = pto.vcvt %result_4, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %40 = pto.vcvt %result_5, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %41 = pto.vcvt %result_6, %23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %34, %14[%26], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %35, %14[%27], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %36, %14[%28], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %37, %14[%29], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %38, %14[%30], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %39, %14[%31], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %40, %14[%32], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %41, %14[%33], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %19 = arith.muli %arg6, %c4096 : index
        %20 = arith.addi %19, %4 : index
        %21 = pto.addptr %arg1, %20 : <bf16, gm> -> <bf16, gm>
        %22 = pto.addptr %21, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %15, %22, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

