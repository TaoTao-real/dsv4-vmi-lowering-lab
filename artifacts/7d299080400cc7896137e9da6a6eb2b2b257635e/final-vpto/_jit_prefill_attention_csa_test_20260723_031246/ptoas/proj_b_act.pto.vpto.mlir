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
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.muli %22, %c512 : index
            %24 = scf.for %arg8 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg9 = %c512) -> (index)  : i16 {
              %25 = arith.index_cast %arg8 : i16 to index
              %26 = arith.index_cast %arg9 : index to i32
              %mask, %scalar_out = pto.plt_b32 %26 : i32 -> !pto.mask<b32>, i32
              %27 = arith.index_cast %scalar_out : i32 to index
              %28 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %29 = arith.addi %23, %25 : index
              %30 = pto.addptr %9, %29 : <f32, ub> -> <f32, ub>
              pto.vsts %28, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %27 : index
            }
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %16 = arith.muli %arg6, %c32768 : index
        scf.for %arg7 = %c0 to %c8 step %c1 {
          %22 = arith.muli %arg7, %c4096 : index
          %23 = arith.addi %22, %4 : index
          %24 = arith.addi %16, %23 : index
          %25 = pto.addptr %arg2, %24 : <i32, gm> -> <i32, gm>
          %26 = pto.addptr %25, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %26, %11, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %27 = arith.muli %arg7, %c128 : index
          %28 = arith.addi %27, %arg6 : index
          %29 = pto.addptr %arg3, %28 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %30, %13, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            %31 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %34 = arith.index_cast %arg8 : i16 to index
              %35 = arith.muli %34, %c512 : index
              scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %36 = arith.index_cast %arg9 : i16 to index
                %37 = arith.addi %35, %36 : index
                %38 = pto.addptr %10, %37 : <i32, ub> -> <i32, ub>
                %result = pto.vlds %38[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %39 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %40 = pto.addptr %31, %37 : <f32, ub> -> <f32, ub>
                pto.vsts %39, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %34 = arith.index_cast %arg8 : i16 to index
              %35 = arith.muli %34, %c512 : index
              %36 = pto.addptr %12, %34 : <f32, ub> -> <f32, ub>
              %37 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
                %38 = arith.index_cast %arg9 : i16 to index
                %39 = arith.index_cast %arg10 : index to i32
                %mask_0, %scalar_out_1 = pto.plt_b32 %39 : i32 -> !pto.mask<b32>, i32
                %40 = arith.index_cast %scalar_out_1 : i32 to index
                %41 = arith.addi %35, %38 : index
                %42 = pto.addptr %31, %41 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %43 = pto.vdup %result_2, %mask_0 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %44 = pto.vmul %result, %43, %mask_0 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %44, %42[%c0], %mask_0 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %40 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %34 = arith.index_cast %arg8 : i16 to index
              %35 = arith.muli %34, %c512 : index
              %result = pto.vlds %9[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %36 = arith.addi %35, %c64 : index
              %result_0 = pto.vlds %9[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = arith.addi %35, %c128 : index
              %result_1 = pto.vlds %9[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = arith.addi %35, %c192 : index
              %result_2 = pto.vlds %9[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = arith.addi %35, %c256 : index
              %result_3 = pto.vlds %9[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = arith.addi %35, %c320 : index
              %result_4 = pto.vlds %9[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = arith.addi %35, %c384 : index
              %result_5 = pto.vlds %9[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = arith.addi %35, %c448 : index
              %result_6 = pto.vlds %9[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %31[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %31[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %31[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %31[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %31[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %31[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %31[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %31[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vadd %result, %result_7, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.vadd %result_0, %result_8, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vadd %result_1, %result_9, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.vadd %result_2, %result_10, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vadd %result_3, %result_11, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vadd %result_4, %result_12, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vadd %result_5, %result_13, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vadd %result_6, %result_14, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %9[%35], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %44, %9[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %45, %9[%37], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %46, %9[%38], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %47, %9[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %9[%40], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %9[%41], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %9[%42], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
        }
        pto.vecscope {
          %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %7[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %7[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %7[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %7[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %7[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %7[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %7[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %24 = arith.index_cast %arg7 : i16 to index
            %25 = arith.muli %24, %c512 : index
            %result_7 = pto.vlds %9[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = arith.addi %25, %c64 : index
            %result_8 = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = arith.addi %25, %c128 : index
            %result_9 = pto.vlds %9[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %28 = arith.addi %25, %c192 : index
            %result_10 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.addi %25, %c256 : index
            %result_11 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = arith.addi %25, %c320 : index
            %result_12 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %25, %c384 : index
            %result_13 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = arith.addi %25, %c448 : index
            %result_14 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_7, %result, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %34 = pto.vmul %result_8, %result_0, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %35 = pto.vmul %result_9, %result_1, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_10, %result_2, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_11, %result_3, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result_12, %result_4, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vmul %result_13, %result_5, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result_14, %result_6, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %33, %9[%25], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %34, %9[%26], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %35, %9[%27], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %36, %9[%28], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %37, %9[%29], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %38, %9[%30], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %39, %9[%31], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %40, %9[%32], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %17 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
        pto.vecscope {
          %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %24 = arith.index_cast %arg7 : i16 to index
            %25 = arith.muli %24, %c512 : index
            %result = pto.vlds %9[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = arith.addi %25, %c64 : index
            %result_0 = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = arith.addi %25, %c128 : index
            %result_1 = pto.vlds %9[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %28 = arith.addi %25, %c192 : index
            %result_2 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.addi %25, %c256 : index
            %result_3 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = arith.addi %25, %c320 : index
            %result_4 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %25, %c384 : index
            %result_5 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = arith.addi %25, %c448 : index
            %result_6 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = pto.vcvt %result, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %34 = pto.vcvt %result_0, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %35 = pto.vcvt %result_1, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %36 = pto.vcvt %result_2, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %37 = pto.vcvt %result_3, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %38 = pto.vcvt %result_4, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %39 = pto.vcvt %result_5, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %40 = pto.vcvt %result_6, %22 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %33, %14[%25], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %34, %14[%26], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %35, %14[%27], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %36, %14[%28], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %37, %14[%29], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %38, %14[%30], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %39, %14[%31], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %40, %14[%32], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %18 = arith.muli %arg6, %c4096 : index
        %19 = arith.addi %18, %4 : index
        %20 = pto.addptr %arg1, %19 : <bf16, gm> -> <bf16, gm>
        %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %15, %21, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
