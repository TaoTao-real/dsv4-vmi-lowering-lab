module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @scatter_softmax_pool(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i64, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c512_i16 = arith.constant 512 : i16
      %c64_i16 = arith.constant 64 : i16
      %c1024_i16 = arith.constant 1024 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c-1 = arith.constant -1 : index
      %c-8 = arith.constant -8 : index
      %c-4 = arith.constant -4 : index
      %c20480_i64 = arith.constant 20480 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c18432_i64 = arith.constant 18432 : i64
      %c2048 = arith.constant 2048 : index
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c1024 = arith.constant 1024 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %cst = arith.constant -3.40282347E+38 : f32
      %cst_0 = arith.constant 0.000000e+00 : f32
      %c1536 = arith.constant 1536 : index
      %c1_i64 = arith.constant 1 : i64
      %c2048_i64 = arith.constant 2048 : i64
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      scf.for %arg8 = %c0 to %c4 step %c1 {
        %0 = arith.muli %arg8, %c2 : index
        %1 = pto.load_scalar %arg2[%0] : !pto.ptr<i32, gm> -> i32
        %2 = pto.load_scalar %arg3[%0] : !pto.ptr<i64, gm> -> i64
        %3 = arith.index_cast %1 : i32 to index
        %4 = arith.remsi %3, %c4 : index
        %5 = arith.addi %0, %c1 : index
        %6 = pto.load_scalar %arg2[%5] : !pto.ptr<i32, gm> -> i32
        %7 = pto.load_scalar %arg3[%5] : !pto.ptr<i64, gm> -> i64
        %8 = arith.index_cast %6 : i32 to index
        %9 = arith.remsi %8, %c4 : index
        %10 = arith.index_cast %2 : i64 to index
        %11 = arith.cmpi sge, %10, %c0 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        scf.if %11 {
          %22 = arith.muli %arg8, %c2048 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c20480_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %4, %c1024 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %36 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c1024_i16 step %c64_i16  : i16 {
              %45 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %28[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %33[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vadd %result, %result_1, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %28[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          pto.barrier <PIPE_MTE3>
          %37 = arith.muli %10, %c2048 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          pto.barrier <PIPE_MTE3>
          %40 = arith.addi %37, %c1024 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        %12 = arith.index_cast %7 : i64 to index
        %13 = arith.cmpi sge, %12, %c0 : index
        scf.if %13 {
          %22 = arith.muli %5, %c1024 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID1>]
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %9, %c1024 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c1024_i16 step %c64_i16  : i16 {
              %45 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %28[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %33[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vadd %result, %result_1, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %28[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID1>]
          pto.barrier <PIPE_MTE3>
          %37 = arith.muli %12, %c2048 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          pto.barrier <PIPE_MTE3>
          %40 = arith.addi %37, %c1024 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        %14 = pto.load_scalar %arg2[%0] : !pto.ptr<i32, gm> -> i32
        %15 = arith.index_cast %14 : i32 to index
        %16 = arith.remsi %15, %c4 : index
        %17 = arith.subi %c4, %16 : index
        %18 = arith.addi %15, %17 : index
        %19 = arith.addi %18, %c-4 : index
        %20 = arith.addi %18, %c-8 : index
        %21 = arith.cmpi sge, %16, %c2 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        scf.if %21 {
          %22 = arith.addi %18, %c-1 : index
          %23 = arith.divsi %22, %c4 : index
          %24 = arith.remsi %22, %c4 : index
          %25 = arith.muli %arg8, %c4096 : index
          %26 = arith.addi %25, %23 : index
          %27 = pto.load_scalar %arg7[%26] : !pto.ptr<i32, gm> -> i32
          %28 = arith.index_cast %27 : i32 to index
          %29 = arith.muli %28, %c4 : index
          %30 = arith.addi %29, %24 : index
          %31 = arith.muli %30, %c2048 : index
          %32 = arith.addi %31, %c1536 : index
          %33 = pto.addptr %arg0, %32 : <f32, gm> -> <f32, gm>
          %34 = pto.castptr %c20480_i64 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
          %36 = pto.addptr %34, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %35, %36, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          %37 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
              %57 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %34[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.vsub %result, %result, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %37[%57], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
          }
          %38 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.vecscope {
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
              %57 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %37[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.vexp %result, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %37[%57], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
          }
          %39 = arith.addi %31, %c512 : index
          %40 = pto.addptr %arg0, %39 : <f32, gm> -> <f32, gm>
          %41 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
          %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %42, %43, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          %44 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %46 = arith.cmpi sge, %15, %c4 : index
          scf.for %arg9 = %c0 to %c4 step %c1 {
            %55 = arith.addi %20, %arg9 : index
            %56 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
            pto.vecscope {
              %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %59 = pto.vdup %cst, %58 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %61 = arith.index_cast %arg10 : i16 to index
                pto.vsts %59, %44[%61], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            }
            %57 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
            pto.vecscope {
              %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %59 = pto.vdup %cst_0, %58 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %61 = arith.index_cast %arg10 : i16 to index
                pto.vsts %59, %45[%61], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            }
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
            scf.if %46 {
              %58 = arith.divsi %55, %c4 : index
              %59 = arith.remsi %55, %c4 : index
              %60 = arith.addi %25, %58 : index
              %61 = pto.load_scalar %arg7[%60] : !pto.ptr<i32, gm> -> i32
              %62 = arith.index_cast %61 : i32 to index
              %63 = arith.muli %62, %c4 : index
              %64 = arith.addi %63, %59 : index
              %65 = arith.muli %64, %c2048 : index
              %66 = arith.addi %65, %c1024 : index
              %67 = pto.addptr %arg0, %66 : <f32, gm> -> <f32, gm>
              %68 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %69 = pto.addptr %67, %c0 : <f32, gm> -> <f32, gm>
              %70 = pto.addptr %68, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %69, %70, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %71 = pto.addptr %arg0, %65 : <f32, gm> -> <f32, gm>
              %72 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
              %73 = pto.addptr %71, %c0 : <f32, gm> -> <f32, gm>
              %74 = pto.addptr %72, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %73, %74, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            } else {
              pto.vecscope {
                %58 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
                %59 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
                %60 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                  %61 = arith.index_cast %arg10 : i16 to index
                  %result = pto.vlds %45[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result, %58[%61], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %result_1 = pto.vlds %44[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %59[%61], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              }
            }
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
            pto.vecscope {
              %58 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              %59 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
              %60 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
              %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %63 = arith.index_cast %arg10 : i16 to index
                %result = pto.vlds %34[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %58[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %64 = pto.vmax %result, %result_1, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %64, %44[%63], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %65 = pto.vsub %result, %64, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %66 = pto.vexp %65, %61 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %67 = pto.vsub %result_1, %64, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %68 = pto.vexp %67, %61 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %result_2 = pto.vlds %37[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %69 = pto.vmul %66, %result_2, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %69, %59[%63], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %70 = pto.vadd %69, %68, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %70, %37[%63], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %41[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %71 = pto.vmul %result_3, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %71, %45[%63], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_4 = pto.vlds %60[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %72 = pto.vmul %result_4, %68, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %72, %58[%63], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %73 = pto.vadd %71, %72, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %73, %41[%63], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
            pto.vecscope {
              %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %59 = arith.index_cast %arg10 : i16 to index
                %result = pto.vlds %44[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %34[%59], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
          %47 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          %48 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
          %49 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %50 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg9 = %c0 to %c3 step %c1 {
            %55 = arith.addi %19, %arg9 : index
            %56 = arith.divsi %55, %c4 : index
            %57 = arith.remsi %55, %c4 : index
            %58 = arith.addi %25, %56 : index
            %59 = pto.load_scalar %arg7[%58] : !pto.ptr<i32, gm> -> i32
            %60 = arith.index_cast %59 : i32 to index
            %61 = arith.muli %60, %c4 : index
            %62 = arith.addi %61, %57 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
            %63 = arith.muli %62, %c2048 : index
            %64 = arith.addi %63, %c1536 : index
            %65 = pto.addptr %arg0, %64 : <f32, gm> -> <f32, gm>
            %66 = pto.addptr %65, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %66, %47, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
            %67 = arith.addi %63, %c512 : index
            %68 = pto.addptr %arg0, %67 : <f32, gm> -> <f32, gm>
            %69 = pto.addptr %68, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %69, %48, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
            pto.vecscope {
              %70 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
              %71 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %72 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %73 = arith.index_cast %arg10 : i16 to index
                %result = pto.vlds %34[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %44[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.vmax %result, %result_1, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %74, %49[%73], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %75 = pto.vsub %result, %74, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %76 = pto.vexp %75, %71 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %77 = pto.vsub %result_1, %74, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %78 = pto.vexp %77, %71 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %78, %44[%73], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_2 = pto.vlds %37[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %79 = pto.vmul %76, %result_2, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %79, %70[%73], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %80 = pto.vadd %79, %78, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %80, %37[%73], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %41[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %81 = pto.vmul %result_3, %76, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %81, %50[%73], %72 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            }
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
            pto.vecscope {
              %70 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %71 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %72 = arith.index_cast %arg10 : i16 to index
                %result = pto.vlds %45[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %44[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %73 = pto.vmul %result, %result_1, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %73, %44[%72], %71 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_2 = pto.vlds %50[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.vadd %result_2, %73, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %74, %41[%72], %71 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
            pto.vecscope {
              %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %71 = arith.index_cast %arg10 : i16 to index
                %result = pto.vlds %49[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %34[%71], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
          }
          %51 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.vecscope {
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
              %57 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %41[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %37[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.vdiv %result, %result_1, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %34[%57], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          }
          pto.barrier <PIPE_MTE3>
          %52 = arith.muli %arg8, %c512 : index
          %53 = pto.addptr %arg1, %52 : <f32, gm> -> <f32, gm>
          %54 = pto.addptr %53, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %36, %54, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
