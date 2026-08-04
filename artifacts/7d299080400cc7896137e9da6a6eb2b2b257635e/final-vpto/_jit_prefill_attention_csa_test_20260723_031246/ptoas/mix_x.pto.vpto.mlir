module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @mix_x(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
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
      %c64 = arith.constant 64 : index
      %c7_i32 = arith.constant 7 : i32
      %c8_i32 = arith.constant 8 : i32
      %c131072 = arith.constant 131072 : index
      %c32768 = arith.constant 32768 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %0 = arith.index_cast %arg5 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.remsi %0, %c4 : index
      %3 = arith.muli %2, %c1024 : index
      %4 = arith.muli %1, %c64 : index
      %5 = pto.addptr %arg0, %4 : <f32, gm> -> <f32, gm>
      %6 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %20 = pto.vci %c0_i32 {order = "ASC", pto.tilelib.candidate = "template_ttrans_b32_colwise", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "ttrans"} : i32 -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.vadds %20, %c0_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        %22 = pto.vmins %21, %c7_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        %23 = pto.vmuls %22, %c8_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        %24 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg7 : i16 to index
          %26 = arith.index_cast %25 : index to i32
          %27 = pto.vadds %23, %26, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
          %28 = pto.vgather2 %6, %27, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = arith.muli %25, %c8 : index
          %30 = pto.addptr %24, %29 : <f32, ub> -> <f32, ub>
          pto.vsts %28, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_ttrans_b32_colwise", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "ttrans"}
      }
      %7 = arith.muli %1, %c131072 : index
      %8 = pto.castptr %c41216_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.castptr %c57600_i64 : i64 -> !pto.ptr<f32, ub>
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = arith.muli %1, %c32768 : index
      %17 = pto.addptr %15, %c0 : <bf16, ub> -> <bf16, ub>
      %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %19 = pto.addptr %18, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg7 = %c0 to %c4 step %c2 {
        %20 = arith.muli %arg7, %c256 : index
        %21 = arith.addi %3, %20 : index
        %22 = arith.addi %20, %c256 : index
        %23 = arith.addi %3, %22 : index
        %24 = arith.addi %7, %21 : index
        %25 = pto.addptr %arg2, %24 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %6, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %26 = arith.addi %21, %c4096 : index
        %27 = arith.addi %7, %26 : index
        %28 = pto.addptr %arg2, %27 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %28, %8, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %29 = arith.addi %21, %c8192 : index
        %30 = arith.addi %7, %29 : index
        %31 = pto.addptr %arg2, %30 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %31, %9, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %32 = arith.addi %21, %c12288 : index
        %33 = arith.addi %7, %32 : index
        %34 = pto.addptr %arg2, %33 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %10, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %35 = arith.addi %7, %23 : index
        %36 = pto.addptr %arg2, %35 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %36, %11, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %37 = arith.addi %23, %c4096 : index
        %38 = arith.addi %7, %37 : index
        %39 = pto.addptr %arg2, %38 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %39, %12, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %40 = arith.addi %23, %c8192 : index
        %41 = arith.addi %7, %40 : index
        %42 = pto.addptr %arg2, %41 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %42, %13, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %43 = arith.addi %23, %c12288 : index
        %44 = arith.addi %7, %43 : index
        %45 = pto.addptr %arg2, %44 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %45, %14, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %54 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %54, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %6, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %55 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %55, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %8, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %56 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %56, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %9, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %57 = pto.castptr %c32864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %57, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %10, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %59 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
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
            %result_3 = pto.vlds %8[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %8[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %8[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %8[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = pto.vadd %result, %result_3, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vadd %result_0, %result_4, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result_1, %result_5, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_2, %result_6, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %9[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %9[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %9[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %9[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %10[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %10[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %10[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %10[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_7, %result_11, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_8, %result_12, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %result_9, %result_13, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %result_10, %result_14, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %69, %8[%61], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %8[%62], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %71, %8[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %72, %8[%64], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %73 = pto.vadd %65, %69, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %74 = pto.vadd %66, %70, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vadd %67, %71, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %68, %72, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %73, %6[%61], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %74, %6[%62], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %6[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %76, %6[%64], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        %46 = pto.alloc_tile addr = %c33024_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xbf16, valid=?x?>
        pto.vecscope {
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg8 : i16 to index
            %57 = arith.muli %56, %c256 : index
            %result = pto.vlds %6[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %57, %c64 : index
            %result_0 = pto.vlds %6[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = arith.addi %57, %c128 : index
            %result_1 = pto.vlds %6[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = arith.addi %57, %c192 : index
            %result_2 = pto.vlds %6[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %62 = pto.vcvt %result_0, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %63 = pto.vcvt %result_1, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %64 = pto.vcvt %result_2, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %61, %15[%57], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %62, %15[%58], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %63, %15[%59], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %64, %15[%60], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %47 = arith.addi %16, %21 : index
        %48 = pto.addptr %arg1, %47 : <bf16, gm> -> <bf16, gm>
        %49 = pto.addptr %48, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %17, %49, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %54 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %54, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %11, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %55 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %55, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %12, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %56 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %56, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %13, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %57 = pto.castptr %c32864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %60 = arith.index_cast %arg8 : i16 to index
            %61 = arith.muli %60, %c256 : index
            %62 = pto.addptr %57, %60 : <f32, ub> -> <f32, ub>
            %63 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %64 = arith.index_cast %arg9 : i16 to index
              %65 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %65 : i32 -> !pto.mask<b32>, i32
              %66 = arith.index_cast %scalar_out : i32 to index
              %67 = arith.addi %61, %64 : index
              %68 = pto.addptr %14, %67 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %70, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %66 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
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
            %result_3 = pto.vlds %12[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %12[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = pto.vadd %result, %result_3, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vadd %result_0, %result_4, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result_1, %result_5, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_2, %result_6, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %13[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %13[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %13[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %13[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %14[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %14[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %14[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %14[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_7, %result_11, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_8, %result_12, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %result_9, %result_13, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %result_10, %result_14, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %69, %12[%61], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %12[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %71, %12[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %72, %12[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %73 = pto.vadd %65, %69, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %74 = pto.vadd %66, %70, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vadd %67, %71, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %68, %72, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %73, %11[%61], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %74, %11[%62], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %11[%63], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %76, %11[%64], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        %50 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xbf16, valid=?x?>
        pto.vecscope {
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg8 : i16 to index
            %57 = arith.muli %56, %c256 : index
            %result = pto.vlds %11[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %57, %c64 : index
            %result_0 = pto.vlds %11[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = arith.addi %57, %c128 : index
            %result_1 = pto.vlds %11[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = arith.addi %57, %c192 : index
            %result_2 = pto.vlds %11[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %62 = pto.vcvt %result_0, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %63 = pto.vcvt %result_1, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %64 = pto.vcvt %result_2, %54 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %61, %18[%57], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %62, %18[%58], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %63, %18[%59], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %64, %18[%60], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %51 = arith.addi %16, %23 : index
        %52 = pto.addptr %arg1, %51 : <bf16, gm> -> <bf16, gm>
        %53 = pto.addptr %52, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %19, %53, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
