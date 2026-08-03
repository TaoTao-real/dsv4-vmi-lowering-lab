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
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c16 : index
      %2 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
      %3 = pto.addptr %2, %c0 : <i32, ub> -> <i32, ub>
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %4 = arith.addi %1, %arg6 : index
        pto.vecscope {
          %9 = scf.for %arg7 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg8 = %c512) -> (index)  : i16 {
            %10 = arith.index_cast %arg7 : i16 to index
            %11 = arith.index_cast %arg8 : index to i32
            %mask, %scalar_out = pto.plt_b32 %11 : i32 -> !pto.mask<b32>, i32
            %12 = arith.index_cast %scalar_out : i32 to index
            %13 = pto.vdup %c-1_i32, %mask : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            %14 = pto.addptr %2, %10 : <i32, ub> -> <i32, ub>
            pto.vsts %13, %14[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            scf.yield %12 : index
          }
        }
        %5 = arith.muli %4, %c512 : index
        %6 = pto.addptr %arg0, %5 : <i32, gm> -> <i32, gm>
        %7 = pto.addptr %6, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_ubuf_to_gm %3, %7, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
        %8 = arith.cmpi slt, %4, %c128 : index
        scf.if %8 {
          %9 = pto.load_scalar %arg1[%4] : !pto.ptr<i32, gm> -> i32
          %10 = arith.index_cast %9 : i32 to index
          %11 = arith.addi %10, %c1 : index
          %12 = arith.divsi %11, %c4 : index
          %13 = arith.minsi %12, %c256 : index
          %14 = arith.cmpi sgt, %13, %c0 : index
          scf.if %14 {
            %15 = arith.muli %4, %c2048 : index
            %16 = pto.addptr %arg2, %15 : <f32, gm> -> <f32, gm>
            %17 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
            %18 = pto.addptr %16, %c0 : <f32, gm> -> <f32, gm>
            %19 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
            pto.copy_gm_to_ubuf %18, %19, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<ui32, ub>
            scf.for %arg7 = %c0 to %c2048 step %c1 {
              %33 = arith.index_cast %arg7 : index to i32
              %34 = builtin.unrealized_conversion_cast %33 : i32 to ui32
              pto.store %34, %20[%arg7] : !pto.ptr<ui32, ub>, ui32
            } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
            %21 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
            %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
            %23 = pto.addptr %20, %c0 : <ui32, ub> -> <ui32, ub>
            pto.vbitsort %22, %19, %23, %c64 : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<ui32, ub>, index
            %24 = pto.addptr %21, %c64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %25 = pto.addptr %21, %c128 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %26 = pto.addptr %21, %c192 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            pto.vmrgsort4 %17, %21, %24, %25, %26, %c9007336695791648_i64, %c3856_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
            %27 = pto.addptr %17, %c256 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %28 = pto.addptr %17, %c512 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %29 = pto.addptr %17, %c768 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            pto.vmrgsort4 %21, %17, %27, %28, %29, %c36029346783166592_i64, %c3844_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
            %30 = pto.addptr %21, %c1024 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %31 = pto.addptr %21, %c2048 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            %32 = pto.addptr %21, %c3072 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
            pto.vmrgsort4 %17, %21, %30, %31, %32, %c144117387132666368_i64, %c3841_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
            pto.vecscope {
              %33 = pto.vci %c0_i32 {order = "ASC", pto.tilelib.candidate = "template_tgather_mask", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tgather"} : i32 -> !pto.vreg<64xi32>
              %34 = scf.for %arg7 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg8 = %c512) -> (index)  : i16 {
                %35 = arith.index_cast %arg7 : i16 to index
                %36 = arith.index_cast %arg8 : index to i32
                %mask, %scalar_out = pto.plt_b32 %36 : i32 -> !pto.mask<b32>, i32
                %37 = arith.index_cast %scalar_out : i32 to index
                %38 = arith.index_cast %35 : index to i32
                %39 = pto.vadds %33, %38, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
                %40 = pto.vadd %39, %39, %mask : !pto.vreg<64xi32>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xi32>
                %41 = pto.vadds %40, %c1_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
                %42 = pto.vgather2 %17, %41, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %43 = pto.vbitcast %42 : !pto.vreg<64xf32> -> !pto.vreg<64xi32>
                %44 = pto.addptr %2, %35 : <i32, ub> -> <i32, ub>
                pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
                scf.yield %37 : index
              }
            }
            pto.copy_ubuf_to_gm %3, %7, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
}

