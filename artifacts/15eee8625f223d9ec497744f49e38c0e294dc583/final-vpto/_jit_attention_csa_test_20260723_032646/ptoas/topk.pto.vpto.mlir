module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @topk(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c512_i16 = arith.constant 512 : i16
      %c2048_i16 = arith.constant 2048 : i16
      %c64_i16 = arith.constant 64 : i16
      %c4096_i16 = arith.constant 4096 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c49152_i64 = arith.constant 49152 : i64
      %c512 = arith.constant 512 : index
      %c2048 = arith.constant 2048 : index
      %c0_i64 = arith.constant 0 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c-1_i32 = arith.constant -1 : i32
      %c0 = arith.constant 0 : index
      %cst = arith.constant -3.40282347E+38 : f32
      %c0_i32 = arith.constant 0 : i32
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %c9007336695791648_i64 = arith.constant 9007336695791648 : i64
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c3872_i64 = arith.constant 3872 : i64
      %c1024 = arith.constant 1024 : index
      %c36029346783166592_i64 = arith.constant 36029346783166592 : i64
      %c768 = arith.constant 768 : index
      %c3848_i64 = arith.constant 3848 : i64
      %c4096_i32 = arith.constant 4096 : i32
      %c33554944_i64 = arith.constant 33554944 : i64
      %c144117387132666368_i64 = arith.constant 144117387132666368 : i64
      %c3072 = arith.constant 3072 : index
      %c3842_i64 = arith.constant 3842 : i64
      %c769_i64 = arith.constant 769 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c1_i32 = arith.constant 1 : i32
      %c16384_i64 = arith.constant 16384 : i64
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      %c1088 = arith.constant 1088 : index
      %c1152 = arith.constant 1152 : index
      %c1216 = arith.constant 1216 : index
      %c1280 = arith.constant 1280 : index
      %c1344 = arith.constant 1344 : index
      %c1408 = arith.constant 1408 : index
      %c1472 = arith.constant 1472 : index
      %c1536 = arith.constant 1536 : index
      %c1600 = arith.constant 1600 : index
      %c1664 = arith.constant 1664 : index
      %c1728 = arith.constant 1728 : index
      %c1792 = arith.constant 1792 : index
      %c1856 = arith.constant 1856 : index
      %c1920 = arith.constant 1920 : index
      %c1984 = arith.constant 1984 : index
      %c2112 = arith.constant 2112 : index
      %c2176 = arith.constant 2176 : index
      %c2240 = arith.constant 2240 : index
      %c2304 = arith.constant 2304 : index
      %c2368 = arith.constant 2368 : index
      %c2432 = arith.constant 2432 : index
      %c2496 = arith.constant 2496 : index
      %c2560 = arith.constant 2560 : index
      %c2624 = arith.constant 2624 : index
      %c2688 = arith.constant 2688 : index
      %c2752 = arith.constant 2752 : index
      %c2816 = arith.constant 2816 : index
      %c2880 = arith.constant 2880 : index
      %c2944 = arith.constant 2944 : index
      %c3008 = arith.constant 3008 : index
      %c3136 = arith.constant 3136 : index
      %c3200 = arith.constant 3200 : index
      %c3264 = arith.constant 3264 : index
      %c3328 = arith.constant 3328 : index
      %c3392 = arith.constant 3392 : index
      %c3456 = arith.constant 3456 : index
      %c3520 = arith.constant 3520 : index
      %c3584 = arith.constant 3584 : index
      %c3648 = arith.constant 3648 : index
      %c3712 = arith.constant 3712 : index
      %c3776 = arith.constant 3776 : index
      %c3840 = arith.constant 3840 : index
      %c3904 = arith.constant 3904 : index
      %c3968 = arith.constant 3968 : index
      %c4032 = arith.constant 4032 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xi32, valid=?x?>
      %2 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %18 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %c-1_i32, %19 : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        pto.vsts %20, %2[%c0], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c64], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c128], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c192], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c256], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c320], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c384], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c448], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c512], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c576], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c640], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c704], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c768], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c832], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c896], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c960], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1024], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1088], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1152], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1216], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1280], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1344], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1408], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1472], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1536], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1600], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1664], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1728], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1792], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1856], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1920], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c1984], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2048], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2112], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2176], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2240], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2304], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2368], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2432], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2496], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2560], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2624], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2688], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2752], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2816], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2880], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c2944], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3008], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3072], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3136], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3200], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3264], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3328], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3392], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3456], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3520], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3584], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3648], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3712], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3776], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3840], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3904], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c3968], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        pto.vsts %20, %2[%c4032], %18 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %3 = arith.muli %0, %c4096 : index
      %4 = pto.addptr %arg0, %3 : <i32, gm> -> <i32, gm>
      %5 = pto.addptr %2, %c0 : <i32, ub> -> <i32, ub>
      %6 = pto.addptr %4, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %5, %6, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      %7 = arith.divsi %0, %c2 : index
      %8 = pto.load_scalar %arg1[%7] : !pto.ptr<i32, gm> -> i32
      %9 = arith.index_cast %8 : i32 to index
      %10 = arith.divsi %9, %c4 : index
      %11 = pto.load_scalar %arg2[%0] : !pto.ptr<i32, gm> -> i32
      %12 = arith.index_cast %11 : i32 to index
      %13 = arith.addi %12, %c1 : index
      %14 = arith.divsi %13, %c4 : index
      %15 = arith.minsi %10, %14 : index
      %16 = arith.minsi %15, %c4096 : index
      %17 = arith.cmpi sgt, %16, %c0 : index
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      scf.if %17 {
        %18 = pto.addptr %arg3, %3 : <f32, gm> -> <f32, gm>
        %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %20 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
        %21 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
        pto.copy_gm_to_ubuf %20, %21, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %22 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c4096_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg6 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %44 = arith.index_cast %arg6 : i16 to index
            %45 = pto.addptr %19, %44 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.vdup %cst, %41 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %44 = arith.index_cast %arg6 : i16 to index
            pto.vsts %42, %22[%44], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        %23 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>
        pto.vecscope {
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %43 = arith.index_cast %arg6 : i16 to index
            %result = pto.vlds %19[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %22[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.vmax %result, %result_0, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %44, %22[%43], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
        }
        %24 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<ui32, ub>
        scf.for %arg6 = %c0 to %c4096 step %c1 {
          %41 = arith.index_cast %arg6 : index to i32
          %42 = builtin.unrealized_conversion_cast %41 : i32 to ui32
          pto.store %42, %24[%arg6] : !pto.ptr<ui32, ub>, ui32
        } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
        pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
        %25 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
        %26 = pto.addptr %24, %c0 : <ui32, ub> -> <ui32, ub>
        pto.vbitsort %21, %25, %26, %c128 : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<ui32, ub>, index
        %27 = pto.addptr %19, %c64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %28 = pto.addptr %19, %c128 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %29 = pto.addptr %19, %c192 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        pto.vmrgsort4 %22, %19, %27, %28, %29, %c9007336695791648_i64, %c3872_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %30 = pto.addptr %22, %c256 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %31 = pto.addptr %22, %c512 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %32 = pto.addptr %22, %c768 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        pto.vmrgsort4 %19, %22, %30, %31, %32, %c36029346783166592_i64, %c3848_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %33 = pto.addptr %19, %c1024 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %34 = pto.addptr %19, %c2048 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %35 = pto.addptr %19, %c3072 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        pto.vmrgsort4 %22, %19, %33, %34, %35, %c144117387132666368_i64, %c3842_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %36 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
        %37 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vmrgsort4 %36, %22, %37, %22, %22, %c33554944_i64, %c769_i64 {pto.tilelib.candidate = "template_tmrgsort_multi_list2", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %38 = arith.minsi %16, %c512 : index
        pto.vecscope {
          %41 = scf.for %arg6 = %c0_i16 to %c2048_i16 step %c64_i16 iter_args(%arg7 = %c2048) -> (index)  : i16 {
            %45 = arith.index_cast %arg6 : i16 to index
            %46 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
            %47 = arith.index_cast %scalar_out : i32 to index
            %48 = pto.addptr %36, %45 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = pto.addptr %19, %45 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %47 : index
          } {pto.tilelib.candidate = "template_tmrgsort_multi_list2", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"}
          %42 = pto.vci %c0_i32 {order = "ASC", pto.tilelib.candidate = "template_tgather_mask", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tgather"} : i32 -> !pto.vreg<64xi32>
          %43 = scf.for %arg6 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg7 = %c512) -> (index)  : i16 {
            %45 = arith.index_cast %arg6 : i16 to index
            %46 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
            %47 = arith.index_cast %scalar_out : i32 to index
            %48 = arith.index_cast %45 : index to i32
            %49 = pto.vadds %42, %48, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            %50 = pto.vadd %49, %49, %mask : !pto.vreg<64xi32>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %51 = pto.vadds %50, %c1_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            %52 = pto.vgather2 %36, %51, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vbitcast %52 : !pto.vreg<64xf32> -> !pto.vreg<64xi32>
            %54 = pto.addptr %2, %45 : <i32, ub> -> <i32, ub>
            pto.vsts %53, %54[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            scf.yield %47 : index
          }
          %44 = scf.for %arg6 = %c0 to %38 step %c64 iter_args(%arg7 = %38) -> (index) {
            %45 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %45 : i32 -> !pto.mask<b32>, i32
            %46 = arith.index_cast %scalar_out : i32 to index
            %47 = pto.addptr %2, %arg6 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %47[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %48 = pto.vadds %result, %c0_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            pto.vsts %48, %47[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            scf.yield %46 : index
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.barrier <PIPE_MTE3>
        %39 = arith.muli %38, %c4 {pto.tilelib.candidate = "template_tstore_nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tstore"} : index
        %40 = arith.index_cast %39 : index to i64
        pto.copy_ubuf_to_gm %5, %6, %c0_i64, %c1_i64, %40, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
