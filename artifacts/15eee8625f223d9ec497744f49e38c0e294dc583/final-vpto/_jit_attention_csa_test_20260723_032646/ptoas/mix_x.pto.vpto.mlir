module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @mix_x(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c33024_i64 = arith.constant 33024 : i64
      %c41216_i64 = arith.constant 41216 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c32800_i64 = arith.constant 32800 : i64
      %c32832_i64 = arith.constant 32832 : i64
      %c32864_i64 = arith.constant 32864 : i64
      %c49408_i64 = arith.constant 49408 : i64
      %c57600_i64 = arith.constant 57600 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c8 = arith.constant 8 : index
      %c4096 = arith.constant 4096 : index
      %c4 = arith.constant 4 : index
      %c1024 = arith.constant 1024 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c8192 = arith.constant 8192 : index
      %c12288 = arith.constant 12288 : index
      %c8_i64 = arith.constant 8 : i64
      %c32_i64 = arith.constant 32 : i64
      %c0_i32 = arith.constant 0 : i32
      %c65536_i64 = arith.constant 65536 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c512_i64 = arith.constant 512 : i64
      %c7_i32 = arith.constant 7 : i32
      %c8_i32 = arith.constant 8 : i32
      %c64 = arith.constant 64 : index
      %c131072 = arith.constant 131072 : index
      %c32768 = arith.constant 32768 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %0 = arith.index_cast %arg5 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.remsi %0, %c4 : index
      %3 = arith.muli %2, %c1024 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %4 = arith.muli %1, %c64 : index
      %5 = pto.addptr %arg0, %4 : <f32, gm> -> <f32, gm>
      %6 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %24 = pto.vci %c0_i32 {order = "ASC", pto.tilelib.candidate = "template_ttrans_b32_colwise", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "ttrans"} : i32 -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.vadds %24, %c0_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        %26 = pto.vmins %25, %c7_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        %27 = pto.vmuls %26, %c8_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        %28 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg7 : i16 to index
          %30 = arith.index_cast %29 : index to i32
          %31 = pto.vadds %27, %30, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.vgather2 %6, %31, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = arith.muli %29, %c8 : index
          %34 = pto.addptr %28, %33 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_ttrans_b32_colwise", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "ttrans"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %7 = arith.muli %1, %c131072 : index
      %8 = pto.castptr %c41216_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.castptr %c57600_i64 : i64 -> !pto.ptr<f32, ub>
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
      %16 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      %17 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
      %18 = pto.castptr %c32864_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %20 = arith.muli %1, %c32768 : index
      %21 = pto.addptr %19, %c0 : <bf16, ub> -> <bf16, ub>
      %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %23 = pto.addptr %22, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg7 = %c0 to %c4 step %c2 {
        %24 = arith.muli %arg7, %c256 : index
        %25 = arith.addi %3, %24 : index
        %26 = arith.addi %24, %c256 : index
        %27 = arith.addi %3, %26 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %28 = arith.addi %7, %25 : index
        %29 = pto.addptr %arg2, %28 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %29, %6, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %30 = arith.addi %25, %c4096 : index
        %31 = arith.addi %7, %30 : index
        %32 = pto.addptr %arg2, %31 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %32, %8, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %33 = arith.addi %25, %c8192 : index
        %34 = arith.addi %7, %33 : index
        %35 = pto.addptr %arg2, %34 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %35, %9, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        %36 = arith.addi %25, %c12288 : index
        %37 = arith.addi %7, %36 : index
        %38 = pto.addptr %arg2, %37 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %38, %10, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %39 = arith.addi %7, %27 : index
        %40 = pto.addptr %arg2, %39 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %40, %11, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        %41 = arith.addi %27, %c4096 : index
        %42 = arith.addi %7, %41 : index
        %43 = pto.addptr %arg2, %42 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %43, %12, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
        %44 = arith.addi %27, %c8192 : index
        %45 = arith.addi %7, %44 : index
        %46 = pto.addptr %arg2, %45 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %46, %13, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
        %47 = arith.addi %27, %c12288 : index
        %48 = arith.addi %7, %47 : index
        %49 = pto.addptr %arg2, %48 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %49, %14, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %15[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %59 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %6[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %6[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %6[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %6[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %6[%62], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %6[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %6[%64], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %6[%65], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %16[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %8[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %8[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %8[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %8[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %8[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %8[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %8[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %8[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %17[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %9[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %9[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %9[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %9[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %9[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %9[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %9[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %9[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %18[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %10[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %10[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %10[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %10[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %10[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %10[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %10[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %10[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_4 = pto.vlds %6[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %6[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %6[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %6[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %8[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %8[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %8[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %8[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_4, %result_8, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %result_5, %result_9, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %result_6, %result_10, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vadd %result_7, %result_11, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %9[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %9[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %9[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %9[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %74 = pto.vadd %result_12, %66, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vadd %result_13, %67, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %result_14, %68, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %77 = pto.vadd %result_15, %69, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %74, %8[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %8[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %76, %8[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %77, %8[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %78 = pto.vadd %70, %74, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vadd %71, %75, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vadd %72, %76, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vadd %73, %77, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %78, %6[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %79, %6[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %80, %6[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %81, %6[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        %50 = pto.alloc_tile addr = %c33024_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xbf16, valid=?x?>
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %result = pto.vlds %6[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %62 = arith.addi %61, %c64 : index
            %result_0 = pto.vlds %6[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %61, %c128 : index
            %result_1 = pto.vlds %6[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %61, %c192 : index
            %result_2 = pto.vlds %6[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = pto.vcvt %result, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %66 = pto.vcvt %result_0, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %67 = pto.vcvt %result_1, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %68 = pto.vcvt %result_2, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %65, %19[%61], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %66, %19[%62], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %67, %19[%63], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %68, %19[%64], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.barrier <PIPE_MTE3>
        %51 = arith.addi %20, %25 : index
        %52 = pto.addptr %arg1, %51 : <bf16, gm> -> <bf16, gm>
        %53 = pto.addptr %52, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %21, %53, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %15[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %11[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %11[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %11[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %11[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %11[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %11[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %11[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %11[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %16[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %12[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %12[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %12[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %12[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %12[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %12[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %17[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %13[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %13[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %13[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %13[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %13[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %13[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %13[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %13[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %result = pto.vlds %18[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = arith.muli %60, %c256 : index
            %result_0 = pto.vlds %14[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %62, %c64 : index
            %result_1 = pto.vlds %14[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %62, %c128 : index
            %result_2 = pto.vlds %14[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %62, %c192 : index
            %result_3 = pto.vlds %14[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_0, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_1, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_2, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_3, %61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %14[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %14[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %14[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %14[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_4 = pto.vlds %11[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %11[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %11[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %11[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %12[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %12[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_4, %result_8, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %result_5, %result_9, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %result_6, %result_10, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vadd %result_7, %result_11, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %13[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %13[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %13[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %13[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %74 = pto.vadd %result_12, %66, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vadd %result_13, %67, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %result_14, %68, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %77 = pto.vadd %result_15, %69, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %74, %12[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %12[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %76, %12[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %77, %12[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %78 = pto.vadd %70, %74, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vadd %71, %75, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vadd %72, %76, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vadd %73, %77, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %78, %11[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %79, %11[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %80, %11[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %81, %11[%65], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        %54 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xbf16, valid=?x?>
        pto.vecscope {
          %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %result = pto.vlds %11[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %62 = arith.addi %61, %c64 : index
            %result_0 = pto.vlds %11[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %61, %c128 : index
            %result_1 = pto.vlds %11[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %61, %c192 : index
            %result_2 = pto.vlds %11[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = pto.vcvt %result, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %66 = pto.vcvt %result_0, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %67 = pto.vcvt %result_1, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %68 = pto.vcvt %result_2, %58 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %65, %22[%61], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %66, %22[%62], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %67, %22[%63], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %68, %22[%64], %59 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.barrier <PIPE_MTE3>
        %55 = arith.addi %20, %27 : index
        %56 = pto.addptr %arg1, %55 : <bf16, gm> -> <bf16, gm>
        %57 = pto.addptr %56, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %23, %57, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
