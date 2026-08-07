// -----// IR Dump Before PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @gather_kv(%arg0: memref<?xbf16, #pto.address_space<gm>>, %arg1: memref<?xi32, #pto.address_space<gm>>, %arg2: memref<?xbf16, #pto.address_space<gm>>, %arg3: memref<?xi32, #pto.address_space<gm>>, %arg4: memref<?xi32, #pto.address_space<gm>>, %arg5: memref<?xbf16, #pto.address_space<gm>>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c1_i64 = arith.constant 1 : i64
    %c128_i64 = arith.constant 128 : i64
    %cst = arith.constant 0.000000e+00 : bf16
    %c384 = arith.constant 384 : index
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c512 = arith.constant 512 : index
    %c131072_i64 = arith.constant 131072 : i64
    %c0_i64 = arith.constant 0 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %0 = arith.index_cast %arg6 : i32 to index
    %1 = arith.divsi %0, %c3 : index
    %2 = arith.muli %1, %c3 : index
    %3 = arith.subi %0, %2 : index
    %4 = arith.muli %1, %c4 : index
    %5 = arith.muli %3, %c128 : index
    scf.for %arg8 = %c0 to %c4 step %c1 {
      %6 = arith.addi %4, %arg8 : index
      %7 = arith.cmpi slt, %6, %c128 : index
      scf.if %7 {
        %8 = arith.muli %6, %c384 : index
        %9 = arith.addi %8, %5 : index
        %10 = pto.pointer_cast(%c0_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<vec>>
        %11 = pto.castptr %10 : memref<128x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        scf.for %arg9 = %c0 to %c128 step %c1 {
          %19 = scf.for %arg10 = %c0 to %c512 step %c128 iter_args(%arg11 = %c512) -> (index) {
            %20 = arith.index_cast %arg11 : index to i32
            %mask, %scalar_out = pto.plt_b16 %20 : i32 -> !pto.mask<b16>, i32
            %21 = arith.index_cast %scalar_out : i32 to index
            %22 = pto.vdup %cst, %mask : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
            %23 = arith.muli %arg9, %c512 : index
            %24 = arith.addi %23, %arg10 : index
            %25 = pto.addptr %11, %24 : <bf16, ub> -> <bf16, ub>
            pto.vsts %22, %25[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
            scf.yield %21 : index
          }
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg9 = %c0 to %c128 step %c1 {
          %19 = arith.addi %5, %arg9 : index
          %20 = arith.cmpi slt, %19, %c128 : index
          scf.if %20 {
            %21 = arith.muli %6, %c128 : index
            %22 = arith.addi %21, %19 : index
            %23 = pto.load_scalar %arg1[%22] : memref<?xi32, #pto.address_space<gm>> -> i32
            %24 = arith.index_cast %23 : i32 to index
            %25 = arith.cmpi sge, %24, %c0 : index
            scf.if %25 {
              %26 = arith.muli %24, %c512 : index
              %27 = pto.castptr %arg2 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
              %28 = pto.addptr %27, %26 : <bf16, gm> -> <bf16, gm>
              %29 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
              %30 = pto.castptr %29 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
              %31 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
              %32 = pto.addptr %30, %c0 : <bf16, ub> -> <bf16, ub>
              pto.mte_gm_ub %31, %32, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
              %33 = arith.index_cast %arg9 : index to i64
              %34 = arith.muli %33, %c1024_i64 : i64
              pto.fusion_region {
                %35 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                %36 = pto.castptr %35 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                %37 = pto.pointer_cast(%34) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                %38 = pto.castptr %37 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                %39 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<512xpred>
                %40 = pto.vmi.vload %36[%c0] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<512xbf16>
                pto.vmi.vstore %40, %38[%c0], %39 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
                pto.yield() : () -> ()
              } {pto.fusion.group_id = 0 : i64} :
            }
          } else {
            %21 = arith.subi %19, %c128 : index
            %22 = arith.cmpi slt, %21, %c512 : index
            scf.if %22 {
              %23 = arith.muli %6, %c512 : index
              %24 = arith.addi %23, %21 : index
              %25 = pto.load_scalar %arg3[%24] : memref<?xi32, #pto.address_space<gm>> -> i32
              %26 = arith.index_cast %25 : i32 to index
              %27 = arith.cmpi sge, %26, %c0 : index
              scf.if %27 {
                %28 = arith.divsi %26, %c128 : index
                %29 = pto.load_scalar %arg4[%28] : memref<?xi32, #pto.address_space<gm>> -> i32
                %30 = arith.index_cast %29 : i32 to index
                %31 = arith.muli %30, %c128 : index
                %32 = arith.muli %28, %c128 : index
                %33 = arith.subi %26, %32 : index
                %34 = arith.addi %31, %33 : index
                %35 = arith.muli %34, %c512 : index
                %36 = pto.castptr %arg5 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
                %37 = pto.addptr %36, %35 : <bf16, gm> -> <bf16, gm>
                %38 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                %39 = pto.castptr %38 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                %40 = pto.addptr %37, %c0 : <bf16, gm> -> <bf16, gm>
                %41 = pto.addptr %39, %c0 : <bf16, ub> -> <bf16, ub>
                pto.mte_gm_ub %40, %41, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
                %42 = arith.index_cast %arg9 : index to i64
                %43 = arith.muli %42, %c1024_i64 : i64
                pto.fusion_region {
                  %44 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                  %45 = pto.castptr %44 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                  %46 = pto.pointer_cast(%43) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                  %47 = pto.castptr %46 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                  %48 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<512xpred>
                  %49 = pto.vmi.vload %45[%c0] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<512xbf16>
                  pto.vmi.vstore %49, %47[%c0], %48 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
                  pto.yield() : () -> ()
                } {pto.fusion.group_id = 1 : i64} :
              }
            }
          }
        }
        %12 = pto.pointer_cast(%c0_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<vec>>
        %13 = pto.castptr %12 : memref<128x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %14 = arith.muli %9, %c512 : index
        %15 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
        %16 = pto.addptr %15, %14 : <bf16, gm> -> <bf16, gm>
        %17 = pto.addptr %13, %c0 : <bf16, ub> -> <bf16, ub>
        %18 = pto.addptr %16, %c0 : <bf16, gm> -> <bf16, gm>
        pto.mte_ub_gm %17, %18, %c1024_i64 nburst(%c128_i64, %c1024_i64, %c1024_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
      }
    }
    return
  }
}
