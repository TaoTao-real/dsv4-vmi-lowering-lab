module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c7_i16 = arith.constant 7 : i16
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c21504_i64 = arith.constant 21504 : i64
      %c7168_i64 = arith.constant 7168 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c-7 = arith.constant -7 : index
      %c14336_i64 = arith.constant 14336 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c9216_i64 = arith.constant 9216 : i64
      %c10240_i64 = arith.constant 10240 : i64
      %c11264_i64 = arith.constant 11264 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c13312_i64 = arith.constant 13312 : i64
      %c1 = arith.constant 1 : index
      %c2048 = arith.constant 2048 : index
      %c4 = arith.constant 4 : index
      %c1024 = arith.constant 1024 : index
      %c128 = arith.constant 128 : index
      %c512 = arith.constant 512 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c-3 = arith.constant -3 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c7 = arith.constant 7 : index
      %c1536 = arith.constant 1536 : index
      %c1_i64 = arith.constant 1 : i64
      %0 = arith.index_cast %arg10 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c256 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      %5 = pto.load_scalar %arg0[%1] : !pto.ptr<i32, gm> -> i32
      %6 = arith.index_cast %5 : i32 to index
      %7 = arith.cmpi sge, %6, %c0 : index
      scf.if %7 {
        %8 = pto.load_scalar %arg1[%1] : !pto.ptr<i32, gm> -> i32
        %9 = arith.index_cast %8 : i32 to index
        %10 = arith.addi %9, %c-3 : index
        %11 = arith.addi %9, %c-7 : index
        %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
        %13 = arith.cmpi sge, %9, %c7 : index
        scf.for %arg12 = %c0 to %c4 step %c1 {
          %23 = arith.addi %11, %arg12 : index
          %24 = arith.index_cast %arg12 : index to i64
          %25 = arith.muli %24, %c1024_i64 : i64
          %26 = arith.addi %25, %c14336_i64 : i64
          %27 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %25 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %44 = pto.vdup %cst, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              pto.vsts %44, %12[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              %result = pto.vlds %12[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result, %27[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            %45 = pto.vdup %cst_0, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              pto.vsts %45, %12[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              %result = pto.vlds %12[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result, %28[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          scf.if %13 {
            %42 = arith.divsi %23, %c4 : index
            %43 = arith.muli %42, %c4 : index
            %44 = arith.subi %23, %43 : index
            %45 = pto.load_scalar %arg2[%42] : !pto.ptr<i32, gm> -> i32
            %46 = arith.index_cast %45 : i32 to index
            %47 = arith.cmpi sge, %46, %c0 : index
            scf.if %47 {
              %48 = arith.muli %46, %c4 : index
              %49 = arith.addi %48, %44 : index
              %50 = arith.muli %49, %c2048 : index
              %51 = arith.addi %50, %4 : index
              %52 = pto.addptr %arg3, %51 : <f32, gm> -> <f32, gm>
              %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
              %54 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %53, %54, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.vecscope {
                %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                  %60 = arith.index_cast %arg13 : i16 to index
                  %result = pto.vlds %12[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result, %27[%60], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %55 = arith.addi %4, %c1024 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %56 = arith.addi %50, %55 : index
              %57 = pto.addptr %arg3, %56 : <f32, gm> -> <f32, gm>
              %58 = pto.addptr %57, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %58, %54, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.vecscope {
                %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                  %60 = arith.index_cast %arg13 : i16 to index
                  %result = pto.vlds %12[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result, %28[%60], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
              }
            }
          }
          %29 = arith.addi %10, %arg12 : index
          %30 = arith.addi %arg12, %c4 : index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c1024_i64 : i64
          %33 = arith.addi %32, %c14336_i64 : i64
          %34 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %44 = pto.vdup %cst, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              pto.vsts %44, %12[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              %result = pto.vlds %12[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result, %34[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            %45 = pto.vdup %cst_0, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              pto.vsts %45, %12[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %46 = arith.index_cast %arg13 : i16 to index
              %result = pto.vlds %12[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result, %35[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          %36 = arith.divsi %29, %c4 : index
          %37 = arith.muli %36, %c4 : index
          %38 = arith.subi %29, %37 : index
          %39 = pto.load_scalar %arg2[%36] : !pto.ptr<i32, gm> -> i32
          %40 = arith.index_cast %39 : i32 to index
          %41 = arith.cmpi sge, %40, %c0 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          scf.if %41 {
            %42 = arith.muli %40, %c4 : index
            %43 = arith.addi %42, %38 : index
            %44 = arith.addi %4, %c512 : index
            %45 = arith.muli %43, %c2048 : index
            %46 = arith.addi %45, %44 : index
            %47 = pto.addptr %arg3, %46 : <f32, gm> -> <f32, gm>
            %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
            %49 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %48, %49, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %55 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %12[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %34[%55], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %50 = arith.addi %4, %c1536 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %51 = arith.addi %45, %50 : index
            %52 = pto.addptr %arg3, %51 : <f32, gm> -> <f32, gm>
            %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %53, %49, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.vecscope {
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %55 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %12[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %35[%55], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %23 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %24 = arith.cmpi sle, %23, %8 : i32
          scf.if %24 {
            %25 = arith.index_cast %23 : i32 to index
            %26 = arith.cmpi sle, %11, %25 : index
            scf.if %26 {
              %27 = arith.cmpi slt, %25, %10 : index
              %28:2 = scf.if %27 -> (index, index) {
                %47 = arith.subi %25, %11 : index
                scf.yield %4, %47 : index, index
              } else {
                %47 = arith.subi %25, %10 : index
                %48 = arith.addi %47, %c4 : index
                %49 = arith.addi %4, %c512 : index
                scf.yield %49, %48 : index, index
              }
              %29 = arith.remsi %25, %c4 : index
              %30 = arith.muli %29, %c1024 : index
              %31 = arith.addi %30, %28#0 : index
              %32 = pto.addptr %arg5, %31 : <f32, gm> -> <f32, gm>
              %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
              %34 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %33, %34, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              %35 = arith.muli %arg12, %c1024 : index
              %36 = arith.addi %35, %28#0 : index
              %37 = pto.addptr %arg6, %36 : <f32, gm> -> <f32, gm>
              %38 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
              %39 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
              %40 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %39, %40, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              %41 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              pto.vecscope {
                %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                  %49 = arith.index_cast %arg13 : i16 to index
                  %result = pto.vlds %38[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %12[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %50 = pto.vadd %result, %result_1, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %50, %12[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
              %42 = pto.addptr %arg7, %36 : <f32, gm> -> <f32, gm>
              %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %43, %40, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              %44 = arith.index_cast %28#1 : index to i64
              %45 = arith.muli %44, %c1024_i64 : i64
              %46 = arith.addi %45, %c14336_i64 : i64
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              pto.vecscope {
                %47 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
                %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                  %49 = arith.index_cast %arg13 : i16 to index
                  %result = pto.vlds %38[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result, %47[%49], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              pto.vecscope {
                %47 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
                %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                  %49 = arith.index_cast %arg13 : i16 to index
                  %result = pto.vlds %12[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result, %47[%49], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
              }
            }
          }
        }
        %14 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
        %15 = pto.castptr %c10240_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %23 = pto.castptr %c7168_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %25 = pto.castptr %c11264_i64 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.castptr %c21504_i64 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %28 = arith.index_cast %arg12 : i16 to index
            %result = pto.vlds %23[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %12[%28], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %29 = pto.vsub %result, %result, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.vexp %29, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %30, %25[%28], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %30, %14[%28], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %26[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_1, %15[%28], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          scf.for %arg12 = %c0_i16 to %c7_i16 step %c1_i16  : i16 {
            %28 = arith.index_cast %arg12 : i16 to index
            %29 = arith.cmpi sge, %28, %c4 : index
            %30 = arith.ori %29, %13 : i1
            scf.if %30 {
              %31 = arith.index_cast %28 : index to i64
              %32 = arith.muli %31, %c1024_i64 : i64
              %33 = arith.addi %32, %c14336_i64 : i64
              %34 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
              %35 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %43 = arith.index_cast %arg13 : i16 to index
                %44 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %44 : i32 -> !pto.mask<b32>, i32
                %45 = arith.index_cast %scalar_out : i32 to index
                %46 = pto.addptr %12, %43 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.addptr %34, %43 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = pto.vmax %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %49 = pto.addptr %25, %43 : <f32, ub> -> <f32, ub>
                pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %45 : index
              }
              %36 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %43 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %12[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %25[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vsub %result, %result_1, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %45 = pto.vexp %44, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %45, %36[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
              %38 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %43 = arith.index_cast %arg13 : i16 to index
                %44 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %44 : i32 -> !pto.mask<b32>, i32
                %45 = arith.index_cast %scalar_out : i32 to index
                %46 = pto.addptr %34, %43 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.addptr %25, %43 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = pto.vsub %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %49 = pto.addptr %37, %43 : <f32, ub> -> <f32, ub>
                pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %45 : index
              }
              %39 = pto.castptr %c13312_i64 : i64 -> !pto.ptr<f32, ub>
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %43 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %37[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vexp %result, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %44, %37[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_1 = pto.vlds %36[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %14[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %45 = pto.vmul %result_1, %result_2, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %46 = pto.vadd %45, %44, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %39[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %15[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.vmul %result_3, %result_1, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %47, %36[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              %40 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
              %41 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
              %42 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %43 = arith.index_cast %arg13 : i16 to index
                %44 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %44 : i32 -> !pto.mask<b32>, i32
                %45 = arith.index_cast %scalar_out : i32 to index
                %46 = pto.addptr %40, %43 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.addptr %37, %43 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = pto.vmul %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %49 = pto.addptr %41, %43 : <f32, ub> -> <f32, ub>
                pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %45 : index
              }
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %43 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %36[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %41[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vadd %result, %result_1, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %44, %41[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_2 = pto.vlds %25[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result_2, %12[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %39[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result_3, %14[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %44, %15[%43], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            }
          }
        }
        %16 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %17 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %25 = arith.index_cast %arg12 : i16 to index
            %result = pto.vlds %15[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %14[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vdiv %result, %result_1, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %26, %17[%25], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        }
        %18 = arith.muli %1, %c512 : index
        %19 = arith.addi %18, %4 : index
        %20 = pto.addptr %arg8, %19 : <f32, gm> -> <f32, gm>
        %21 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
        %22 = pto.addptr %20, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %21, %22, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      } else {
        %8 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %9 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %16 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.vdup %cst, %16 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %18 = arith.index_cast %arg12 : i16 to index
            pto.vsts %17, %9[%18], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %10 = arith.muli %1, %c512 : index
        %11 = arith.addi %10, %4 : index
        %12 = pto.addptr %arg8, %11 : <f32, gm> -> <f32, gm>
        %13 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        %14 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %13, %14, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
