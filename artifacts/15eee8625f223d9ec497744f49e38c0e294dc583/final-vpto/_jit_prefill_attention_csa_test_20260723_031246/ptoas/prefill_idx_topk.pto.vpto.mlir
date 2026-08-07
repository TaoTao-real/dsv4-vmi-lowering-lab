module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_topk(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c8192_i64 = arith.constant 8192 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c2048 = arith.constant 2048 : index
      %c16 = arith.constant 16 : index
      %c0 = arith.constant 0 : index
      %c-1_i32 = arith.constant -1 : i32
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c0_i32 = arith.constant 0 : i32
      %c9007336695791648_i64 = arith.constant 9007336695791648 : i64
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
      %c3856_i64 = arith.constant 3856 : i64
      %c1024 = arith.constant 1024 : index
      %c36029346783166592_i64 = arith.constant 36029346783166592 : i64
      %c768 = arith.constant 768 : index
      %c3844_i64 = arith.constant 3844 : i64
      %c144117387132666368_i64 = arith.constant 144117387132666368 : i64
      %c3072 = arith.constant 3072 : index
      %c3841_i64 = arith.constant 3841 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c1_i32 = arith.constant 1 : i32
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c16 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %2 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
      %3 = pto.addptr %2, %c0 : <i32, ub> -> <i32, ub>
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %4 = arith.addi %1, %arg6 : index
        %5 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %10 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %11 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %12 = pto.vdup %c-1_i32, %11 : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %12, %2[%c0], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c64], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c128], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c192], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c256], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c320], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c384], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %12, %2[%c448], %10 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        }
        pto.barrier <PIPE_MTE3>
        %6 = arith.muli %4, %c512 : index
        %7 = pto.addptr %arg0, %6 : <i32, gm> -> <i32, gm>
        %8 = pto.addptr %7, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_ubuf_to_gm %3, %8, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
        %9 = arith.cmpi slt, %4, %c128 : index
        scf.if %9 {
          %10 = pto.load_scalar %arg1[%4] : !pto.ptr<i32, gm> -> i32
          %11 = arith.index_cast %10 : i32 to index
          %12 = arith.addi %11, %c1 : index
          %13 = arith.divsi %12, %c4 : index
          %14 = arith.minsi %13, %c256 : index
          %15 = arith.cmpi sgt, %14, %c0 : index
          scf.if %15 {
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
            %16 = arith.muli %4, %c2048 : index
            %17 = pto.addptr %arg2, %16 : <f32, gm> -> <f32, gm>
            %18 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
            %19 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
            %20 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %19, %20, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            %21 = pto.castptr %c0_i64 : i64 -> !pto.ptr<ui32, ub>
            scf.for %arg7 = %c0 to %c2048 step %c1 {
              %34 = arith.index_cast %arg7 : index to i32
              %35 = builtin.unrealized_conversion_cast %34 : i32 to ui32
              pto.store %35, %21[%arg7] : !pto.ptr<ui32, ub>, ui32
            } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
            pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
            %22 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %23 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
            %24 = pto.addptr %21, %c0 : <ui32, ub> -> <ui32, ub>
            pto.vbitsort %23, %20, %24, %c64 : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<ui32, ub>, index
            pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            %25 = pto.addptr %22, %c64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %26 = pto.addptr %22, %c128 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %27 = pto.addptr %22, %c192 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            pto.vmrgsort4 %18, %22, %25, %26, %27, %c9007336695791648_i64, %c3856_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
            %28 = pto.addptr %18, %c256 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %29 = pto.addptr %18, %c512 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %30 = pto.addptr %18, %c768 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            pto.vmrgsort4 %22, %18, %28, %29, %30, %c36029346783166592_i64, %c3844_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
            %31 = pto.addptr %22, %c1024 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %32 = pto.addptr %22, %c2048 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %33 = pto.addptr %22, %c3072 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            pto.vmrgsort4 %18, %22, %31, %32, %33, %c144117387132666368_i64, %c3841_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
            pto.vecscope {
              %34 = pto.vci %c0_i32 {order = "ASC", pto.tilelib.candidate = "template_tgather_mask", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tgather"} : i32 -> !pto.vreg<64xi32>
              %35 = scf.for %arg7 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg8 = %c512) -> (index)  : i16 {
                %36 = arith.index_cast %arg7 : i16 to index
                %37 = arith.index_cast %arg8 : index to i32
                %mask, %scalar_out = pto.plt_b32 %37 : i32 -> !pto.mask<b32>, i32
                %38 = arith.index_cast %scalar_out : i32 to index
                %39 = arith.index_cast %36 : index to i32
                %40 = pto.vadds %34, %39, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
                %41 = pto.vadd %40, %40, %mask : !pto.vreg<64xi32>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xi32>
                %42 = pto.vadds %41, %c1_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
                %43 = pto.vgather2 %18, %42, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %44 = pto.vbitcast %43 : !pto.vreg<64xf32> -> !pto.vreg<64xi32>
                %45 = pto.addptr %2, %36 : <i32, ub> -> <i32, ub>
                pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
                scf.yield %38 : index
              }
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
            pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
            pto.barrier <PIPE_MTE3>
            pto.copy_ubuf_to_gm %3, %8, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
