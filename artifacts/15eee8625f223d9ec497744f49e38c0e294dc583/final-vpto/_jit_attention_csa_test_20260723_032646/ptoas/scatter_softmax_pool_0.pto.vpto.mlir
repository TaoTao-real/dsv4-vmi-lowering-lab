module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @scatter_softmax_pool_0(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i64, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c-1 = arith.constant -1 : index
      %c-8 = arith.constant -8 : index
      %c-4 = arith.constant -4 : index
      %c4608_i64 = arith.constant 4608 : i64
      %c5632_i64 = arith.constant 5632 : i64
      %c0_i64 = arith.constant 0 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c3072_i64 = arith.constant 3072 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c4352_i64 = arith.constant 4352 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %c3 = arith.constant 3 : index
      %c384 = arith.constant 384 : index
      %cst = arith.constant -3.40282347E+38 : f32
      %cst_0 = arith.constant 0.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c256_i64 = arith.constant 256 : i64
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
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
          %22 = arith.muli %arg8, %c512 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c4608_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c5632_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %4, %c256 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %36 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %45 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %28[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %33[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vadd %result, %result_1, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %28[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          pto.barrier <PIPE_MTE3>
          %37 = arith.muli %10, %c512 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          pto.barrier <PIPE_MTE3>
          %40 = arith.addi %37, %c256 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        %12 = arith.index_cast %7 : i64 to index
        %13 = arith.cmpi sge, %12, %c0 : index
        scf.if %13 {
          %22 = arith.muli %5, %c256 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID1>]
          %27 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
          %28 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.muli %9, %c256 : index
          %32 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          %36 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %45 = arith.index_cast %arg9 : i16 to index
              %result = pto.vlds %28[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %33[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vadd %result, %result_1, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %28[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID1>]
          pto.barrier <PIPE_MTE3>
          %37 = arith.muli %12, %c512 : index
          %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %39, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          pto.barrier <PIPE_MTE3>
          %40 = arith.addi %37, %c256 : index
          %41 = pto.addptr %arg0, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %30, %42, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
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
          %27 = pto.castptr %c4608_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
          %29 = pto.castptr %c5632_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %32 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
          %33 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = arith.cmpi sge, %15, %c4 : index
          %35 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
          %36 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          %37 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %39 = arith.muli %arg8, %c128 : index
          scf.for %arg9 = %c0 to %c2 step %c1 {
            %40 = arith.muli %arg9, %c64 : index
            %41 = pto.load_scalar %arg7[%26] : !pto.ptr<i32, gm> -> i32
            %42 = arith.index_cast %41 : i32 to index
            %43 = arith.muli %42, %c4 : index
            %44 = arith.addi %43, %24 : index
            %45 = arith.addi %40, %c384 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
            %46 = arith.muli %44, %c512 : index
            %47 = arith.addi %46, %45 : index
            %48 = pto.addptr %arg0, %47 : <f32, gm> -> <f32, gm>
            %49 = pto.addptr %48, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %49, %28, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %61 = pto.vsub %result, %result, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %61, %29[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %50 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %60 = pto.vexp %result, %59 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %60, %29[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %51 = arith.addi %40, %c128 : index
            %52 = arith.addi %46, %51 : index
            %53 = pto.addptr %arg0, %52 : <f32, gm> -> <f32, gm>
            %54 = pto.addptr %53, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %54, %31, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            scf.for %arg10 = %c0 to %c4 step %c1 {
              %59 = arith.addi %20, %arg10 : index
              %60 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
              pto.vecscope {
                %62 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %63 = pto.vdup %cst, %62 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %63, %32[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              %61 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
              pto.vecscope {
                %62 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %63 = pto.vdup %cst_0, %62 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %63, %33[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
              scf.if %34 {
                %62 = arith.divsi %59, %c4 : index
                %63 = arith.remsi %59, %c4 : index
                %64 = arith.addi %25, %62 : index
                %65 = pto.load_scalar %arg7[%64] : !pto.ptr<i32, gm> -> i32
                %66 = arith.index_cast %65 : i32 to index
                %67 = arith.muli %66, %c4 : index
                %68 = arith.addi %67, %63 : index
                %69 = arith.addi %40, %c256 : index
                %70 = arith.muli %68, %c512 : index
                %71 = arith.addi %70, %69 : index
                %72 = pto.addptr %arg0, %71 : <f32, gm> -> <f32, gm>
                %73 = pto.addptr %72, %c0 : <f32, gm> -> <f32, gm>
                %74 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %73, %74, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                %75 = arith.addi %70, %40 : index
                %76 = pto.addptr %arg0, %75 : <f32, gm> -> <f32, gm>
                %77 = pto.addptr %76, %c0 : <f32, gm> -> <f32, gm>
                %78 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
                pto.copy_gm_to_ubuf %77, %78, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              } else {
                pto.vecscope {
                  %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                  pto.vsts %result, %38[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  %result_1 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  pto.vsts %result_1, %37[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                }
              }
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              pto.vecscope {
                %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %63 = pto.vmax %result, %result_1, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %63, %32[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %65 = pto.vsub %result, %63, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %66 = pto.vexp %65, %62 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %67 = pto.vsub %result_1, %63, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %68 = pto.vexp %67, %62 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %69 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
                %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %70 = pto.vmul %66, %result_2, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %70, %69[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %71 = pto.vadd %70, %68, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %71, %29[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %72 = pto.vmul %result_3, %66, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %72, %33[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_4 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %73 = pto.vmul %result_4, %68, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %73, %37[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %74 = pto.vadd %72, %73, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %74, %30[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
              pto.vecscope {
                %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %27[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
            scf.for %arg10 = %c0 to %c3 step %c1 {
              %59 = arith.addi %19, %arg10 : index
              %60 = arith.divsi %59, %c4 : index
              %61 = arith.remsi %59, %c4 : index
              %62 = arith.addi %25, %60 : index
              %63 = pto.load_scalar %arg7[%62] : !pto.ptr<i32, gm> -> i32
              %64 = arith.index_cast %63 : i32 to index
              %65 = arith.muli %64, %c4 : index
              %66 = arith.addi %65, %61 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              %67 = arith.muli %66, %c512 : index
              %68 = arith.addi %67, %45 : index
              %69 = pto.addptr %arg0, %68 : <f32, gm> -> <f32, gm>
              %70 = pto.addptr %69, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %70, %35, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              %71 = arith.addi %67, %51 : index
              %72 = pto.addptr %arg0, %71 : <f32, gm> -> <f32, gm>
              %73 = pto.addptr %72, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %73, %36, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              pto.vecscope {
                %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %75 = pto.vmax %result, %result_1, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %76 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %75, %37[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %77 = pto.vsub %result, %75, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %78 = pto.vexp %77, %74 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %79 = pto.vsub %result_1, %75, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %80 = pto.vexp %79, %74 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %80, %32[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %81 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
                %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %82 = pto.vmul %78, %result_2, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %82, %81[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %83 = pto.vadd %82, %80, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %83, %29[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %84 = pto.vmul %result_3, %78, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %84, %38[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
              pto.vecscope {
                %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                %75 = pto.vmul %result, %result_1, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %76 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %75, %32[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %result_2 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %77 = pto.vadd %result_2, %75, %74 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %77, %30[%c0], %76 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              pto.vecscope {
                %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                pto.vsts %result, %27[%c0], %74 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            }
            %55 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %60 = pto.vdiv %result, %result_1, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %60, %27[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
            pto.barrier <PIPE_MTE3>
            %56 = arith.addi %39, %40 : index
            %57 = pto.addptr %arg1, %56 : <f32, gm> -> <f32, gm>
            %58 = pto.addptr %57, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %28, %58, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
