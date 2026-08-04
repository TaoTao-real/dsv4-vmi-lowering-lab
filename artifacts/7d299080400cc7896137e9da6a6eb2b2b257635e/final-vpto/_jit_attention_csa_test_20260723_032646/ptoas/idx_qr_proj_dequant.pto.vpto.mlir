module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @idx_qr_proj_dequant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c1024_i16 = arith.constant 1024 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c36864_i64 = arith.constant 36864 : i64
      %c8 = arith.constant 8 : index
      %c1024 = arith.constant 1024 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c0 = arith.constant 0 : index
      %c8_i64 = arith.constant 8 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c64 = arith.constant 64 : index
      %c32_i64 = arith.constant 32 : i64
      %c1024_i32 = arith.constant 1024 : i32
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c512 = arith.constant 512 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c1024 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = pto.addptr %arg1, %1 : <i32, gm> -> <i32, gm>
      %5 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i32, ub>
      %6 = pto.addptr %4, %c0 : <i32, gm> -> <i32, gm>
      %7 = pto.addptr %5, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c1024_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c1024 : index
          scf.for %arg7 = %c0_i16 to %c1024_i16 step %c64_i16  : i16 {
            %19 = arith.index_cast %arg7 : i16 to index
            %20 = arith.addi %18, %19 : index
            %21 = pto.addptr %5, %20 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %21[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %22 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %23 = pto.addptr %16, %20 : <f32, ub> -> <f32, ub>
            pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %8 = pto.castptr %c36864_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %16 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c1024 : index
          %19 = pto.addptr %8, %17 : <f32, ub> -> <f32, ub>
          %20 = scf.for %arg7 = %c0_i16 to %c1024_i16 step %c64_i16 iter_args(%arg8 = %c1024) -> (index)  : i16 {
            %21 = arith.index_cast %arg7 : i16 to index
            %22 = arith.index_cast %arg8 : index to i32
            %mask, %scalar_out = pto.plt_b32 %22 : i32 -> !pto.mask<b32>, i32
            %23 = arith.index_cast %scalar_out : i32 to index
            %24 = arith.addi %18, %21 : index
            %25 = pto.addptr %16, %24 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmul %result, %26, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %27, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %23 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %11 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
      %12 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_0 = pto.vlds %3[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_1 = pto.vlds %3[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_2 = pto.vlds %3[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %3[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %3[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_5 = pto.vlds %3[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %3[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_7 = pto.vlds %3[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_8 = pto.vlds %3[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_9 = pto.vlds %3[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_10 = pto.vlds %3[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_11 = pto.vlds %3[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_12 = pto.vlds %3[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_13 = pto.vlds %3[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_14 = pto.vlds %3[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg6 : i16 to index
          %19 = arith.muli %18, %c1024 : index
          %result_15 = pto.vlds %12[%19] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = arith.addi %19, %c64 : index
          %result_16 = pto.vlds %12[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = arith.addi %19, %c128 : index
          %result_17 = pto.vlds %12[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = arith.addi %19, %c192 : index
          %result_18 = pto.vlds %12[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %19, %c256 : index
          %result_19 = pto.vlds %12[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %19, %c320 : index
          %result_20 = pto.vlds %12[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %19, %c384 : index
          %result_21 = pto.vlds %12[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %19, %c448 : index
          %result_22 = pto.vlds %12[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %19, %c512 : index
          %result_23 = pto.vlds %12[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %19, %c576 : index
          %result_24 = pto.vlds %12[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %19, %c640 : index
          %result_25 = pto.vlds %12[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %19, %c704 : index
          %result_26 = pto.vlds %12[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %19, %c768 : index
          %result_27 = pto.vlds %12[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %19, %c832 : index
          %result_28 = pto.vlds %12[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %19, %c896 : index
          %result_29 = pto.vlds %12[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.addi %19, %c960 : index
          %result_30 = pto.vlds %12[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_15, %result, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_16, %result_0, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_17, %result_1, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_18, %result_2, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_19, %result_3, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_20, %result_4, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_21, %result_5, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_22, %result_6, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_23, %result_7, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result_24, %result_8, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_25, %result_9, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result_26, %result_10, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_27, %result_11, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmul %result_28, %result_12, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_29, %result_13, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result_30, %result_14, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %12[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %12[%20], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %12[%21], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %12[%22], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %12[%23], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %12[%24], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %12[%25], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %12[%26], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %12[%27], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %12[%28], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %12[%29], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %12[%30], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %12[%31], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %12[%32], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %12[%33], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %12[%34], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %13 = pto.addptr %arg3, %1 : <f32, gm> -> <f32, gm>
      %14 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
      %15 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %14, %15, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
