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
          %60 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %60, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %6, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %61 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %61, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %8, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %62 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %62, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %9, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %63 = pto.castptr %c32864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %63, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %10, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %46 = pto.alloc_tile addr = %c33024_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %60 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %6[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %6[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %6[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %6[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %8[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %8[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %8[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %8[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result, %result_3, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_0, %result_4, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_1, %result_5, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_2, %result_6, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %6[%63], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %6[%64], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %6[%65], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %6[%66], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %47 = pto.alloc_tile addr = %c41216_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %9[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %9[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %9[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %9[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %10[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %10[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %10[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %10[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result, %result_3, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_0, %result_4, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_1, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_2, %result_6, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %8[%63], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %8[%64], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %8[%65], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %8[%66], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %48 = pto.alloc_tile addr = %c33024_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %6[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %6[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %6[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %6[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %8[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %8[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %8[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %8[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result, %result_3, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_0, %result_4, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_1, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_2, %result_6, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %6[%63], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %6[%64], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %6[%65], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %6[%66], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %49 = pto.alloc_tile addr = %c33024_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xbf16, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %6[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %6[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %6[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %6[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vcvt %result, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %68 = pto.vcvt %result_0, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %69 = pto.vcvt %result_1, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %70 = pto.vcvt %result_2, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %67, %15[%63], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %68, %15[%64], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %69, %15[%65], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %70, %15[%66], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %50 = arith.addi %16, %21 : index
        %51 = pto.addptr %arg1, %50 : <bf16, gm> -> <bf16, gm>
        %52 = pto.addptr %51, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %17, %52, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %60 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %60, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %11, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %61 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %61, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %12, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %62 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %62, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %13, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %63 = pto.castptr %c32864_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %64 = arith.index_cast %arg8 : i16 to index
            %65 = arith.muli %64, %c256 : index
            %66 = pto.addptr %63, %64 : <f32, ub> -> <f32, ub>
            %67 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %68 = arith.index_cast %arg9 : i16 to index
              %69 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
              %70 = arith.index_cast %scalar_out : i32 to index
              %71 = arith.addi %65, %68 : index
              %72 = pto.addptr %14, %71 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %70 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %53 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %11[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %11[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %11[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %11[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result, %result_3, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_0, %result_4, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_1, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_2, %result_6, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %11[%63], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %11[%64], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %11[%65], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %11[%66], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %54 = pto.alloc_tile addr = %c8192_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %13[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %13[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %13[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %13[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %14[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %14[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %14[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %14[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result, %result_3, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_0, %result_4, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_1, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_2, %result_6, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %12[%63], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %12[%64], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %12[%65], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %12[%66], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %55 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %11[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %11[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %11[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %11[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vadd %result, %result_3, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_0, %result_4, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %result_1, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %result_2, %result_6, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %11[%63], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %11[%64], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %11[%65], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %11[%66], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %56 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xbf16, valid=?x?>
        pto.vecscope {
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %62 = arith.index_cast %arg8 : i16 to index
            %63 = arith.muli %62, %c256 : index
            %result = pto.vlds %11[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %63, %c64 : index
            %result_0 = pto.vlds %11[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %63, %c128 : index
            %result_1 = pto.vlds %11[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %63, %c192 : index
            %result_2 = pto.vlds %11[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vcvt %result, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %68 = pto.vcvt %result_0, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %69 = pto.vcvt %result_1, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %70 = pto.vcvt %result_2, %60 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %67, %18[%63], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %68, %18[%64], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %69, %18[%65], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %70, %18[%66], %61 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %57 = arith.addi %16, %23 : index
        %58 = pto.addptr %arg1, %57 : <bf16, gm> -> <bf16, gm>
        %59 = pto.addptr %58, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %19, %59, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

