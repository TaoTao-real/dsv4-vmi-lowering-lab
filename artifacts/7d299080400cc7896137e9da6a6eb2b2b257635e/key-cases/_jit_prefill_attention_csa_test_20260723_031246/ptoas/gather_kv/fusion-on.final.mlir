module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @gather_kv(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c128_i16 = arith.constant 128 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1024_i64 = arith.constant 1024 : i64
      %c0_i64 = arith.constant 0 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c0 = arith.constant 0 : index
      %c384 = arith.constant 384 : index
      %cst = arith.constant 0.000000e+00 : bf16
      %c128_i64 = arith.constant 128 : i64
      %c1_i64 = arith.constant 1 : i64
      %c256 = arith.constant 256 : index
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
          %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          pto.vecscope {
            scf.for %arg9 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
              %15 = arith.index_cast %arg9 : i16 to index
              %16 = arith.muli %15, %c512 : index
              %17 = scf.for %arg10 = %c0_i16 to %c512_i16 step %c128_i16 iter_args(%arg11 = %c512) -> (index)  : i16 {
                %18 = arith.index_cast %arg10 : i16 to index
                %19 = arith.index_cast %arg11 : index to i32
                %mask, %scalar_out = pto.plt_b16 %19 : i32 -> !pto.mask<b16>, i32
                %20 = arith.index_cast %scalar_out : i32 to index
                %21 = pto.vdup %cst, %mask : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
                %22 = arith.addi %16, %18 : index
                %23 = pto.addptr %10, %22 : <bf16, ub> -> <bf16, ub>
                pto.vsts %21, %23[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                scf.yield %20 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          }
          scf.for %arg9 = %c0 to %c128 step %c1 {
            %15 = arith.addi %5, %arg9 : index
            %16 = arith.cmpi slt, %15, %c128 : index
            scf.if %16 {
              %17 = arith.muli %6, %c128 : index
              %18 = arith.addi %17, %15 : index
              %19 = pto.load_scalar %arg1[%18] : !pto.ptr<i32, gm> -> i32
              %20 = arith.index_cast %19 : i32 to index
              %21 = arith.cmpi sge, %20, %c0 : index
              scf.if %21 {
                %22 = arith.muli %20, %c512 : index
                %23 = pto.addptr %arg2, %22 : <bf16, gm> -> <bf16, gm>
                %24 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, ub>
                %25 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
                %26 = pto.addptr %24, %c0 : <bf16, ub> -> <bf16, ub>
                pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                pto.vecscope {
                  %27 = arith.index_cast %arg9 : index to i64
                  %28 = arith.muli %27, %c1024_i64 : i64
                  %29 = pto.castptr %28 : i64 -> !pto.ptr<bf16, ub>
                  %result = pto.vlds %24[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                  %result_0 = pto.vlds %24[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                  %result_1 = pto.vlds %24[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                  %result_2 = pto.vlds %24[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                  %30 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
                  pto.vsts %result, %29[%c0], %30 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                  pto.vsts %result_0, %29[%c128], %30 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                  pto.vsts %result_1, %29[%c256], %30 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                  pto.vsts %result_2, %29[%c384], %30 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                }
              }
            } else {
              %17 = arith.subi %15, %c128 : index
              %18 = arith.cmpi slt, %17, %c512 : index
              scf.if %18 {
                %19 = arith.muli %6, %c512 : index
                %20 = arith.addi %19, %17 : index
                %21 = pto.load_scalar %arg3[%20] : !pto.ptr<i32, gm> -> i32
                %22 = arith.index_cast %21 : i32 to index
                %23 = arith.cmpi sge, %22, %c0 : index
                scf.if %23 {
                  %24 = arith.divsi %22, %c128 : index
                  %25 = pto.load_scalar %arg4[%24] : !pto.ptr<i32, gm> -> i32
                  %26 = arith.index_cast %25 : i32 to index
                  %27 = arith.muli %26, %c128 : index
                  %28 = arith.muli %24, %c128 : index
                  %29 = arith.subi %22, %28 : index
                  %30 = arith.addi %27, %29 : index
                  %31 = arith.muli %30, %c512 : index
                  %32 = pto.addptr %arg5, %31 : <bf16, gm> -> <bf16, gm>
                  %33 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, ub>
                  %34 = pto.addptr %32, %c0 : <bf16, gm> -> <bf16, gm>
                  %35 = pto.addptr %33, %c0 : <bf16, ub> -> <bf16, ub>
                  pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
                  pto.vecscope {
                    %36 = arith.index_cast %arg9 : index to i64
                    %37 = arith.muli %36, %c1024_i64 : i64
                    %38 = pto.castptr %37 : i64 -> !pto.ptr<bf16, ub>
                    %result = pto.vlds %33[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                    %result_0 = pto.vlds %33[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                    %result_1 = pto.vlds %33[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                    %result_2 = pto.vlds %33[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                    %39 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
                    pto.vsts %result, %38[%c0], %39 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                    pto.vsts %result_0, %38[%c128], %39 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                    pto.vsts %result_1, %38[%c256], %39 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                    pto.vsts %result_2, %38[%c384], %39 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                  }
                }
              }
            }
          }
          %11 = arith.muli %9, %c512 : index
          %12 = pto.addptr %arg0, %11 : <bf16, gm> -> <bf16, gm>
          %13 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
          %14 = pto.addptr %12, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %13, %14, %c0_i64, %c128_i64, %c1024_i64, %c0_i64, %c1024_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
