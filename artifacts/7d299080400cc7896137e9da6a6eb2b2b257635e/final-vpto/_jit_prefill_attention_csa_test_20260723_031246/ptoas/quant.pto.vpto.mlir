module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c32_i64 = arith.constant 32 : i64
      %c16416_i64 = arith.constant 16416 : i64
      %c32800_i64 = arith.constant 32800 : i64
      %c8 = arith.constant 8 : index
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c8192 = arith.constant 8192 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %c0 = arith.constant 0 : index
      %c1024 = arith.constant 1024 : index
      %c512 = arith.constant 512 : index
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c8_i64 = arith.constant 8 : i64
      %c512_i64 = arith.constant 512 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c128_i32 = arith.constant 128 : i32
      %c512_i32 = arith.constant 512 : i32
      %c255_i16 = arith.constant 255 : i16
      %c64 = arith.constant 64 : index
      %c32768_i64 = arith.constant 32768 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c1_i64 = arith.constant 1 : i64
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c8_i32 = arith.constant 8 : i32
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %cst_2 = arith.constant 0xFF800000 : f32
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.addi %arg3, %c32 : index
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      %4 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = arith.muli %arg5, %c128 : index
      %6 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i8, ub>
      %7 = pto.addptr %6, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg6 = %arg3 to %0 step %c8 {
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %13 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %14 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %13, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %8 = arith.muli %arg6, %c8192 : index
        scf.for %arg7 = %c0 to %c1024 step %c512 {
          %13 = arith.addi %arg4, %arg7 : index
          %14 = arith.addi %8, %13 : index
          %15 = pto.addptr %arg2, %14 : <f32, gm> -> <f32, gm>
          %16 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %16, %3, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.muli %26, %c512 : index
              %28 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
                %29 = arith.index_cast %arg9 : i16 to index
                %30 = arith.index_cast %arg10 : index to i32
                %mask_6, %scalar_out_7 = pto.plt_b32 %30 : i32 -> !pto.mask<b32>, i32
                %31 = arith.index_cast %scalar_out_7 : i32 to index
                %32 = arith.addi %27, %29 : index
                %33 = pto.addptr %2, %32 : <f32, ub> -> <f32, ub>
                %result_8 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %34 = pto.vneg %result_8, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %35 = pto.addptr %4, %32 : <f32, ub> -> <f32, ub>
                pto.vsts %34, %35[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %31 : index
              }
            } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
            %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %18 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
            %19 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %21 = pto.vdup %cst_2, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
            %22 = pto.pand %19, %mask, %20 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %26 = arith.index_cast %arg8 : i16 to index
              %27 = arith.muli %26, %c512 : index
              %result_6 = pto.vlds %2[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %28 = arith.addi %27, %c64 : index
              %result_7 = pto.vlds %2[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %29 = arith.addi %27, %c128 : index
              %result_8 = pto.vlds %2[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %30 = arith.addi %27, %c192 : index
              %result_9 = pto.vlds %2[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = arith.addi %27, %c256 : index
              %result_10 = pto.vlds %2[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %32 = arith.addi %27, %c320 : index
              %result_11 = pto.vlds %2[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %33 = arith.addi %27, %c384 : index
              %result_12 = pto.vlds %2[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %34 = arith.addi %27, %c448 : index
              %result_13 = pto.vlds %2[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %4[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %4[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %4[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %4[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %4[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %4[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %4[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %4[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %35 = pto.vmax %result_6, %result_14, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %36 = pto.vmax %result_7, %result_15, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %37 = pto.vmax %result_8, %result_16, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %38 = pto.vmax %result_9, %result_17, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.vmax %result_10, %result_18, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %40 = pto.vmax %result_11, %result_19, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.vmax %result_12, %result_20, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %42 = pto.vmax %result_13, %result_21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %35, %2[%27], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %36, %2[%28], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %37, %2[%29], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %38, %2[%30], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %39, %2[%31], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %40, %2[%32], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %41, %2[%33], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %42, %2[%34], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %43 = pto.vmax %35, %36, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.vmax %43, %37, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vmax %44, %38, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.vmax %45, %39, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vmax %46, %40, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vmax %47, %41, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmax %48, %42, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vcmax %49, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vmax %50, %21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %18[%26], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            %23 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %24 = pto.vmax %result, %result_3, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %25 = pto.pand %23, %mask_4, %20 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %24, %1[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %13 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %13, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %9 = pto.alloc_tile addr = %c16416_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %13 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %15 = pto.vdiv %result, %result_3, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %16 = pto.pand %13, %mask, %14 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %15, %4[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %17 = pto.vdup %cst_1, %14 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %18 = pto.vdiv %17, %result_4, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %18, %2[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %10 = arith.addi %5, %arg6 : index
        %11 = pto.addptr %arg0, %10 : <f32, gm> -> <f32, gm>
        %12 = pto.addptr %11, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %3, %12, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        scf.for %arg7 = %c0 to %c1024 step %c512 {
          %13 = arith.addi %arg4, %arg7 : index
          %14 = arith.addi %8, %13 : index
          %15 = pto.addptr %arg2, %14 : <f32, gm> -> <f32, gm>
          %16 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %16, %3, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %24 = arith.index_cast %arg8 : i16 to index
              %25 = arith.muli %24, %c512 : index
              %26 = pto.addptr %4, %24 : <f32, ub> -> <f32, ub>
              %27 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
                %28 = arith.index_cast %arg9 : i16 to index
                %29 = arith.index_cast %arg10 : index to i32
                %mask_7, %scalar_out_8 = pto.plt_b32 %29 : i32 -> !pto.mask<b32>, i32
                %30 = arith.index_cast %scalar_out_8 : i32 to index
                %31 = arith.addi %25, %28 : index
                %32 = pto.addptr %2, %31 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_9 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %33 = pto.vdup %result_9, %mask_7 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %34 = pto.vmul %result, %33, %mask_7 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %34, %32[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %30 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            %19 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %24 = arith.index_cast %arg8 : i16 to index
              %25 = arith.muli %24, %c512 : index
              scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %26 = arith.index_cast %arg9 : i16 to index
                %27 = arith.addi %25, %26 : index
                %28 = pto.addptr %2, %27 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %29 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
                %30 = pto.addptr %19, %27 : <i32, ub> -> <i32, ub>
                pto.vsts %29, %30[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %20 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
            %21 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f16, ub>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %24 = arith.index_cast %arg8 : i16 to index
              %25 = arith.muli %24, %c512 : index
              scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %26 = arith.index_cast %arg9 : i16 to index
                %27 = arith.addi %25, %26 : index
                %28 = pto.addptr %19, %27 : <i32, ub> -> <i32, ub>
                %result = pto.vlds %28[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %29 = pto.vcvt %result, %20 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %30 = pto.vcvt %29, %20 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
                %31 = pto.addptr %21, %27 : <f16, ub> -> <f16, ub>
                pto.vsts %30, %31[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %22 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
            %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
            %mask_5, %scalar_out_6 = pto.plt_b16 %c512_i32 : i32 -> !pto.mask<b16>, i32
            %23 = pto.vdup %c255_i16, %22 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %24 = arith.index_cast %arg8 : i16 to index
              %25 = arith.muli %24, %c512 : index
              scf.for %arg9 = %c0_i16 to %c512_i16 step %c128_i16  : i16 {
                %26 = arith.index_cast %arg9 : i16 to index
                %27 = arith.addi %25, %26 : index
                %28 = pto.addptr %21, %27 : <f16, ub> -> <f16, ub>
                %result = pto.vlds %28[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
                %29 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
                %30 = pto.vand %29, %23, %mask_5 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
                %31 = pto.vcvt %30, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
                %32 = pto.vcvt %31, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
                %33 = pto.addptr %6, %27 : <i8, ub> -> <i8, ub>
                pto.vsts %32, %33[%c0], %mask_5 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
              }
            } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %17 = pto.addptr %arg1, %14 : <i8, gm> -> <i8, gm>
          %18 = pto.addptr %17, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %7, %18, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
