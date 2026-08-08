module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
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
        %12 = arith.cmpi sge, %9, %c7 : index
        scf.for %arg12 = %c0 to %c4 step %c1 {
          %20 = arith.addi %11, %arg12 : index
          pto.vecscope {
            %35 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %38 = pto.vdup %cst, %37 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %44 = arith.index_cast %arg13 : i16 to index
              pto.vsts %38, %35[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %39 = arith.index_cast %arg12 : index to i64
            %40 = arith.muli %39, %c1024_i64 : i64
            %41 = arith.addi %40, %c14336_i64 : i64
            pto.mem_bar "VST_VLD"
            %42 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
            %43 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %44 = arith.index_cast %arg13 : i16 to index
              %45 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %45 : i32 -> !pto.mask<b32>, i32
              %46 = arith.index_cast %scalar_out : i32 to index
              %47 = pto.addptr %35, %44 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.addptr %42, %44 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %46 : index
            }
          }
          %21 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %22 = arith.index_cast %arg12 : index to i64
          %23 = arith.muli %22, %c1024_i64 : i64
          pto.vecscope {
            %35 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %37 = pto.vdup %cst_0, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              pto.vsts %37, %35[%41], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            pto.mem_bar "VST_VLD"
            %39 = pto.castptr %23 : i64 -> !pto.ptr<f32, ub>
            %40 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.addptr %35, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %39, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          scf.if %12 {
            %35 = arith.divsi %20, %c4 : index
            %36 = arith.muli %35, %c4 : index
            %37 = arith.subi %20, %36 : index
            %38 = pto.load_scalar %arg2[%35] : !pto.ptr<i32, gm> -> i32
            %39 = arith.index_cast %38 : i32 to index
            %40 = arith.cmpi sge, %39, %c0 : index
            scf.if %40 {
              %41 = arith.muli %39, %c4 : index
              %42 = arith.addi %41, %37 : index
              %43 = arith.muli %42, %c2048 : index
              %44 = arith.addi %43, %4 : index
              %45 = pto.addptr %arg3, %44 : <f32, gm> -> <f32, gm>
              %46 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
              %47 = pto.addptr %45, %c0 : <f32, gm> -> <f32, gm>
              %48 = pto.addptr %46, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %47, %48, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              %49 = arith.addi %23, %c14336_i64 : i64
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              pto.vecscope {
                %54 = pto.castptr %49 : i64 -> !pto.ptr<f32, ub>
                %55 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %56 = arith.index_cast %arg13 : i16 to index
                  %57 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
                  %58 = arith.index_cast %scalar_out : i32 to index
                  %59 = pto.addptr %46, %56 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %60 = pto.addptr %54, %56 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %58 : index
                }
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %50 = arith.addi %4, %c1024 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
              %51 = arith.addi %43, %50 : index
              %52 = pto.addptr %arg3, %51 : <f32, gm> -> <f32, gm>
              %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %53, %48, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
              pto.vecscope {
                %54 = pto.castptr %23 : i64 -> !pto.ptr<f32, ub>
                %55 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %56 = arith.index_cast %arg13 : i16 to index
                  %57 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
                  %58 = arith.index_cast %scalar_out : i32 to index
                  %59 = pto.addptr %46, %56 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %60 = pto.addptr %54, %56 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %58 : index
                }
              }
            }
          }
          %24 = arith.addi %10, %arg12 : index
          %25 = arith.addi %arg12, %c4 : index
          pto.vecscope {
            %35 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %38 = pto.vdup %cst, %37 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %44 = arith.index_cast %arg13 : i16 to index
              pto.vsts %38, %35[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %39 = arith.index_cast %25 : index to i64
            %40 = arith.muli %39, %c1024_i64 : i64
            %41 = arith.addi %40, %c14336_i64 : i64
            pto.mem_bar "VST_VLD"
            %42 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
            %43 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %44 = arith.index_cast %arg13 : i16 to index
              %45 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %45 : i32 -> !pto.mask<b32>, i32
              %46 = arith.index_cast %scalar_out : i32 to index
              %47 = pto.addptr %35, %44 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.addptr %42, %44 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %46 : index
            }
          }
          %26 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %27 = arith.index_cast %25 : index to i64
          %28 = arith.muli %27, %c1024_i64 : i64
          pto.vecscope {
            %35 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %37 = pto.vdup %cst_0, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              pto.vsts %37, %35[%41], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            pto.mem_bar "VST_VLD"
            %39 = pto.castptr %28 : i64 -> !pto.ptr<f32, ub>
            %40 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
              %41 = arith.index_cast %arg13 : i16 to index
              %42 = arith.index_cast %arg14 : index to i32
              %mask, %scalar_out = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out : i32 to index
              %44 = pto.addptr %35, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %39, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          %29 = arith.divsi %24, %c4 : index
          %30 = arith.muli %29, %c4 : index
          %31 = arith.subi %24, %30 : index
          %32 = pto.load_scalar %arg2[%29] : !pto.ptr<i32, gm> -> i32
          %33 = arith.index_cast %32 : i32 to index
          %34 = arith.cmpi sge, %33, %c0 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          scf.if %34 {
            %35 = arith.muli %33, %c4 : index
            %36 = arith.addi %35, %31 : index
            %37 = arith.addi %4, %c512 : index
            %38 = arith.muli %36, %c2048 : index
            %39 = arith.addi %38, %37 : index
            %40 = pto.addptr %arg3, %39 : <f32, gm> -> <f32, gm>
            %41 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %42 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
            %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %42, %43, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            %44 = arith.addi %28, %c14336_i64 : i64
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %49 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
              %50 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %51 = arith.index_cast %arg13 : i16 to index
                %52 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %52 : i32 -> !pto.mask<b32>, i32
                %53 = arith.index_cast %scalar_out : i32 to index
                %54 = pto.addptr %41, %51 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %55 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %53 : index
              }
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %45 = arith.addi %4, %c1536 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
            %46 = arith.addi %38, %45 : index
            %47 = pto.addptr %arg3, %46 : <f32, gm> -> <f32, gm>
            %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %48, %43, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
            pto.vecscope {
              %49 = pto.castptr %28 : i64 -> !pto.ptr<f32, ub>
              %50 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %51 = arith.index_cast %arg13 : i16 to index
                %52 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %52 : i32 -> !pto.mask<b32>, i32
                %53 = arith.index_cast %scalar_out : i32 to index
                %54 = pto.addptr %41, %51 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %55 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
                pto.vsts %result, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %53 : index
              }
            }
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        scf.for %arg12 = %c0 to %c128 step %c1 {
          %20 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
          %21 = arith.cmpi sle, %20, %8 : i32
          scf.if %21 {
            %22 = arith.index_cast %20 : i32 to index
            %23 = arith.cmpi sle, %11, %22 : index
            scf.if %23 {
              %24 = arith.cmpi slt, %22, %10 : index
              %25:2 = scf.if %24 -> (index, index) {
                %45 = arith.subi %22, %11 : index
                scf.yield %4, %45 : index, index
              } else {
                %45 = arith.subi %22, %10 : index
                %46 = arith.addi %45, %c4 : index
                %47 = arith.addi %4, %c512 : index
                scf.yield %47, %46 : index, index
              }
              %26 = arith.remsi %22, %c4 : index
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
              %27 = arith.muli %26, %c1024 : index
              %28 = arith.addi %27, %25#0 : index
              %29 = pto.addptr %arg5, %28 : <f32, gm> -> <f32, gm>
              %30 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
              %31 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
              %32 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %31, %32, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              %33 = arith.muli %arg12, %c1024 : index
              %34 = arith.addi %33, %25#0 : index
              %35 = pto.addptr %arg6, %34 : <f32, gm> -> <f32, gm>
              %36 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
              %37 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
              %38 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
              pto.copy_gm_to_ubuf %37, %38, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              %39 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
              pto.vecscope {
                %45 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
                %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
                scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                  %47 = arith.index_cast %arg13 : i16 to index
                  %result = pto.vlds %36[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_1 = pto.vlds %30[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %48 = pto.vadd %result, %result_1, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %48, %30[%47], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
              pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
              %40 = pto.addptr %arg7, %34 : <f32, gm> -> <f32, gm>
              %41 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
              pto.copy_gm_to_ubuf %41, %38, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              %42 = arith.index_cast %25#1 : index to i64
              %43 = arith.muli %42, %c1024_i64 : i64
              %44 = arith.addi %43, %c14336_i64 : i64
              pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
              pto.vecscope {
                %45 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
                %46 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %49 = arith.index_cast %arg13 : i16 to index
                  %50 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %50 : i32 -> !pto.mask<b32>, i32
                  %51 = arith.index_cast %scalar_out : i32 to index
                  %52 = pto.addptr %36, %49 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %53 = pto.addptr %45, %49 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %51 : index
                }
                %47 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
                %48 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                  %49 = arith.index_cast %arg13 : i16 to index
                  %50 = arith.index_cast %arg14 : index to i32
                  %mask, %scalar_out = pto.plt_b32 %50 : i32 -> !pto.mask<b32>, i32
                  %51 = arith.index_cast %scalar_out : i32 to index
                  %52 = pto.addptr %30, %49 : <f32, ub> -> <f32, ub>
                  %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %53 = pto.addptr %47, %49 : <f32, ub> -> <f32, ub>
                  pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %51 : index
                }
              }
              pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
            }
          }
        }
        pto.vecscope {
          %20 = pto.castptr %c7168_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %30 = arith.index_cast %arg12 : i16 to index
            %31 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %31 : i32 -> !pto.mask<b32>, i32
            %32 = arith.index_cast %scalar_out : i32 to index
            %33 = pto.addptr %20, %30 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.addptr %21, %30 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %32 : index
          }
          %23 = pto.castptr %c11264_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.mem_bar "VST_VLD"
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %30 = arith.index_cast %arg12 : i16 to index
            %result = pto.vlds %21[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vsub %result, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %31, %23[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
          pto.mem_bar "VST_VLD"
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %30 = arith.index_cast %arg12 : i16 to index
            %result = pto.vlds %23[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vexp %result, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %31, %23[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
          %26 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %30 = arith.index_cast %arg12 : i16 to index
            %result = pto.vlds %23[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %26[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          %27 = pto.castptr %c21504_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %c10240_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg13 = %c256) -> (index)  : i16 {
            %30 = arith.index_cast %arg12 : i16 to index
            %31 = arith.index_cast %arg13 : index to i32
            %mask, %scalar_out = pto.plt_b32 %31 : i32 -> !pto.mask<b32>, i32
            %32 = arith.index_cast %scalar_out : i32 to index
            %33 = pto.addptr %27, %30 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.addptr %28, %30 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %32 : index
          }
          pto.mem_bar "VV_ALL"
          scf.for %arg12 = %c0_i16 to %c7_i16 step %c1_i16  : i16 {
            %30 = arith.index_cast %arg12 : i16 to index
            %31 = arith.cmpi sge, %30, %c4 : index
            %32 = arith.ori %31, %12 : i1
            scf.if %32 {
              %33 = arith.index_cast %30 : index to i64
              %34 = arith.muli %33, %c1024_i64 : i64
              %35 = arith.addi %34, %c14336_i64 : i64
              %36 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
              %37 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %46 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
                %47 = arith.index_cast %scalar_out : i32 to index
                %48 = pto.addptr %21, %45 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %49 = pto.addptr %36, %45 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %50 = pto.vmax %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %51 = pto.addptr %23, %45 : <f32, ub> -> <f32, ub>
                pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %47 : index
              }
              %38 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %21[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %23[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vsub %result, %result_1, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %38[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %38[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vexp %result, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %38[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
              pto.mem_bar "VST_VLD"
              %39 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
              %40 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %46 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
                %47 = arith.index_cast %scalar_out : i32 to index
                %48 = pto.addptr %36, %45 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %49 = pto.addptr %23, %45 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %50 = pto.vsub %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %51 = pto.addptr %39, %45 : <f32, ub> -> <f32, ub>
                pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %47 : index
              }
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %39[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vexp %result, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %39[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
              %41 = pto.castptr %c13312_i64 : i64 -> !pto.ptr<f32, ub>
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %38[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %26[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vmul %result, %result_1, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %41[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %41[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %39[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vadd %result, %result_1, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %41[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %28[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %38[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vmul %result, %result_1, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %38[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
              pto.mem_bar "VST_VLD"
              %42 = pto.castptr %35 : i64 -> !pto.ptr<f32, ub>
              %43 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
              %44 = scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg14 = %c256) -> (index)  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %46 = arith.index_cast %arg14 : index to i32
                %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
                %47 = arith.index_cast %scalar_out : i32 to index
                %48 = pto.addptr %42, %45 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %49 = pto.addptr %39, %45 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %50 = pto.vmul %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %51 = pto.addptr %43, %45 : <f32, ub> -> <f32, ub>
                pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %47 : index
              }
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %38[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %43[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vadd %result, %result_1, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %46, %43[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %23[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %21[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %41[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %26[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
              pto.mem_bar "VST_VLD"
              scf.for %arg13 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
                %45 = arith.index_cast %arg13 : i16 to index
                %result = pto.vlds %43[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                pto.vsts %result, %28[%45], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
            pto.mem_bar "VV_ALL"
          }
        }
        %13 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        pto.vecscope {
          %20 = pto.castptr %c10240_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c9216_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %25 = arith.index_cast %arg12 : i16 to index
            %result = pto.vlds %20[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %21[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vdiv %result, %result_1, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %26, %22[%25], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %14 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
        %15 = arith.muli %1, %c512 : index
        %16 = arith.addi %15, %4 : index
        %17 = pto.addptr %arg8, %16 : <f32, gm> -> <f32, gm>
        %18 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
        %19 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %18, %19, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      } else {
        %8 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        pto.vecscope {
          %15 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %18 = pto.vdup %cst, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg12 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %19 = arith.index_cast %arg12 : i16 to index
            pto.vsts %18, %15[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        %9 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
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

