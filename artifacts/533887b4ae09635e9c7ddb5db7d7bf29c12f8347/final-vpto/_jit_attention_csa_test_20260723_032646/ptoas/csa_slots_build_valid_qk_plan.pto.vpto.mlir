module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @csa_slots_build_valid_qk_plan(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c4_i64 = arith.constant 4 : i64
      %c39_i32 = arith.constant 39 : i32
      %c38_i32 = arith.constant 38 : i32
      %c37_i32 = arith.constant 37 : i32
      %c36_i32 = arith.constant 36 : i32
      %c35_i32 = arith.constant 35 : i32
      %c34_i32 = arith.constant 34 : i32
      %c33_i32 = arith.constant 33 : i32
      %c32_i32 = arith.constant 32 : i32
      %c31_i32 = arith.constant 31 : i32
      %c30_i32 = arith.constant 30 : i32
      %c29_i32 = arith.constant 29 : i32
      %c28_i32 = arith.constant 28 : i32
      %c27_i32 = arith.constant 27 : i32
      %c26_i32 = arith.constant 26 : i32
      %c25_i32 = arith.constant 25 : i32
      %c24_i32 = arith.constant 24 : i32
      %c23_i32 = arith.constant 23 : i32
      %c22_i32 = arith.constant 22 : i32
      %c21_i32 = arith.constant 21 : i32
      %c20_i32 = arith.constant 20 : i32
      %c19_i32 = arith.constant 19 : i32
      %c18_i32 = arith.constant 18 : i32
      %c17_i32 = arith.constant 17 : i32
      %c16_i32 = arith.constant 16 : i32
      %c15_i32 = arith.constant 15 : i32
      %c14_i32 = arith.constant 14 : i32
      %c13_i32 = arith.constant 13 : i32
      %c12_i32 = arith.constant 12 : i32
      %c11_i32 = arith.constant 11 : i32
      %c10_i32 = arith.constant 10 : i32
      %c9_i32 = arith.constant 9 : i32
      %c8_i32 = arith.constant 8 : i32
      %c7_i32 = arith.constant 7 : i32
      %c6_i32 = arith.constant 6 : i32
      %c5_i32 = arith.constant 5 : i32
      %c4_i32 = arith.constant 4 : i32
      %c3_i32 = arith.constant 3 : i32
      %c2_i32 = arith.constant 2 : i32
      %c0_i32 = arith.constant 0 : i32
      %c1_i32 = arith.constant 1 : i32
      %c32800_i64 = arith.constant 32800 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32_i64 = arith.constant 32 : i64
      %c16416_i64 = arith.constant 16416 : i64
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c5 = arith.constant 5 : index
      %c128 = arith.constant 128 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 2.500000e-01 : f32
      %cst_1 = arith.constant 0.000000e+00 : f32
      %cst_2 = arith.constant 1.000000e+20 : f32
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %c9 = arith.constant 9 : index
      %c10 = arith.constant 10 : index
      %c11 = arith.constant 11 : index
      %c12 = arith.constant 12 : index
      %c13 = arith.constant 13 : index
      %c14 = arith.constant 14 : index
      %c15 = arith.constant 15 : index
      %c16 = arith.constant 16 : index
      %c17 = arith.constant 17 : index
      %c18 = arith.constant 18 : index
      %c19 = arith.constant 19 : index
      %c20 = arith.constant 20 : index
      %c21 = arith.constant 21 : index
      %c22 = arith.constant 22 : index
      %c23 = arith.constant 23 : index
      %c24 = arith.constant 24 : index
      %c25 = arith.constant 25 : index
      %c26 = arith.constant 26 : index
      %c27 = arith.constant 27 : index
      %c28 = arith.constant 28 : index
      %c29 = arith.constant 29 : index
      %c30 = arith.constant 30 : index
      %c31 = arith.constant 31 : index
      %c32 = arith.constant 32 : index
      %c33 = arith.constant 33 : index
      %c34 = arith.constant 34 : index
      %c35 = arith.constant 35 : index
      %c36 = arith.constant 36 : index
      %c37 = arith.constant 37 : index
      %c38 = arith.constant 38 : index
      %c39 = arith.constant 39 : index
      %c8_i64 = arith.constant 8 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c2560_i64 = arith.constant 2560 : i64
      %c512_i64 = arith.constant 512 : i64
      %c64 = arith.constant 64 : index
      %c128_i32 = arith.constant 128 : i32
      %c512_i32 = arith.constant 512 : i32
      %c1_i64 = arith.constant 1 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %cst_3 = arith.constant 0xFF800000 : f32
      %0 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<i32, ub>
      %1 = pto.addptr %arg0, %c0 : <i32, gm> -> <i32, gm>
      %2 = pto.addptr %0, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
        %274 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %275 = arith.index_cast %arg8 : i16 to index
          %276 = arith.muli %275, %c512 : index
          scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
            %277 = arith.index_cast %arg9 : i16 to index
            %278 = arith.addi %276, %277 : index
            %279 = pto.addptr %0, %278 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %279[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %280 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %281 = pto.addptr %274, %278 : <f32, ub> -> <f32, ub>
            pto.vsts %280, %281[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %4 = pto.addptr %arg1, %c0 : <i32, gm> -> <i32, gm>
      %5 = pto.addptr %3, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %4, %5, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %8 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
      %9 = pto.addptr %8, %c0 : <i32, ub> -> <i32, ub>
      %10 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %result = pto.vlds %5[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %274 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %274, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %275 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result_4 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %276 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %277 = pto.vdup %cst, %276 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %278 = pto.vadd %result_4, %277, %276 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %279 = pto.pand %275, %mask, %276 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %278, %6[%c0], %279 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %280 = pto.vdup %cst_0, %276 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %281 = pto.vmul %result_5, %280, %276 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %281, %6[%c0], %279 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %282 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        pto.vsts %282, %9[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %9[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %283 = pto.vcvt %result_7, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %284 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %283, %284[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %285 = arith.index_cast %arg8 : i16 to index
          %286 = arith.muli %285, %c512 : index
          %287 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
            %288 = arith.index_cast %arg9 : i16 to index
            %289 = arith.index_cast %arg10 : index to i32
            %mask_8, %scalar_out_9 = pto.plt_b32 %289 : i32 -> !pto.mask<b32>, i32
            %290 = arith.index_cast %scalar_out_9 : i32 to index
            %291 = pto.vdup %cst, %mask_8 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %292 = arith.addi %286, %288 : index
            %293 = pto.addptr %6, %292 : <f32, ub> -> <f32, ub>
            pto.vsts %291, %293[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %290 : index
          }
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %285 = arith.index_cast %arg8 : i16 to index
          %286 = arith.muli %285, %c512 : index
          %287 = pto.addptr %10, %285 : <f32, ub> -> <f32, ub>
          %288 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
            %289 = arith.index_cast %arg9 : i16 to index
            %290 = arith.index_cast %arg10 : index to i32
            %mask_8, %scalar_out_9 = pto.plt_b32 %290 : i32 -> !pto.mask<b32>, i32
            %291 = arith.index_cast %scalar_out_9 : i32 to index
            %292 = arith.addi %286, %289 : index
            %293 = pto.addptr %6, %292 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %293[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %287[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %294 = pto.vdup %result_11, %mask_8 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %295 = pto.vmul %result_10, %294, %mask_8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %295, %293[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %291 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %11 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %12 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %274 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %276 = pto.vdup %cst, %275 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %12[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %12[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %12[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %12[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %12[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %12[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %12[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %12[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vadd %result, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %result_4, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vadd %result_5, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vadd %result_6, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vadd %result_7, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vadd %result_8, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vadd %result_9, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vadd %result_10, %276, %275 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %10[%278], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %10[%279], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %10[%280], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %10[%281], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %10[%282], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %10[%283], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %10[%284], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %10[%285], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %13 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_1, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %10[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %10[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %10[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %10[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %10[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %10[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %10[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %10[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmax %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmax %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmax %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmax %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmax %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmax %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmax %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmax %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %10[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %10[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %10[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %10[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %10[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %10[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %10[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %10[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmaxs", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmaxs"}
      }
      %14 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %10[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %10[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %10[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %10[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %10[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %10[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %10[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %10[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmin %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmin %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmin %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmin %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmin %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmin %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmin %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmin %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %10[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %10[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %10[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %10[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %10[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %10[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %10[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %10[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
      }
      %15 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %276 = arith.index_cast %arg8 : i16 to index
          %277 = arith.muli %276, %c512 : index
          %result = pto.vlds %6[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %278 = arith.addi %277, %c64 : index
          %result_4 = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %277, %c128 : index
          %result_5 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %277, %c192 : index
          %result_6 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %277, %c256 : index
          %result_7 = pto.vlds %6[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %277, %c320 : index
          %result_8 = pto.vlds %6[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %277, %c384 : index
          %result_9 = pto.vlds %6[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %277, %c448 : index
          %result_10 = pto.vlds %6[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %12[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %12[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %12[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %12[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %12[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %12[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %12[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %12[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = pto.vsub %result, %result_11, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vsub %result_4, %result_12, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vsub %result_5, %result_13, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vsub %result_6, %result_14, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vsub %result_7, %result_15, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vsub %result_8, %result_16, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vsub %result_9, %result_17, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vsub %result_10, %result_18, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %285, %6[%277], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %286, %6[%278], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %6[%279], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %6[%280], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %6[%281], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %6[%282], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %6[%283], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %6[%284], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %16 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_1, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %6[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %6[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %6[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %6[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %6[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmax %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmax %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmax %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmax %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmax %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmax %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmax %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmax %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %6[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %6[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %6[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %6[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %6[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %6[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %6[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmaxs", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmaxs"}
      }
      %17 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %6[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %6[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %6[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %6[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %6[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmin %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmin %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmin %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmin %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmin %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmin %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmin %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmin %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %6[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %6[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %6[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %6[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %6[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %6[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %6[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %10[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %10[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %10[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %10[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %10[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %10[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %10[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %10[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %6[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %6[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %6[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %6[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %6[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmul %result, %result_11, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmul %result_4, %result_12, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmul %result_5, %result_13, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmul %result_6, %result_14, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmul %result_7, %result_15, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmul %result_8, %result_16, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmul %result_9, %result_17, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmul %result_10, %result_18, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %6[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %6[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %6[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %6[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %6[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %6[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %6[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %18 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %12[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %12[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %12[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %12[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %12[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %12[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %12[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %12[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vadd %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vadd %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vadd %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vadd %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vadd %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vadd %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vadd %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %12[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %12[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %12[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %12[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %12[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %12[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %12[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %12[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %19 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %278 = arith.index_cast %arg8 : i16 to index
          %279 = arith.muli %278, %c512 : index
          %result = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %279, %c64 : index
          %result_4 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %279, %c128 : index
          %result_5 = pto.vlds %6[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %279, %c192 : index
          %result_6 = pto.vlds %6[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %279, %c256 : index
          %result_7 = pto.vlds %6[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %279, %c320 : index
          %result_8 = pto.vlds %6[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %279, %c384 : index
          %result_9 = pto.vlds %6[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = arith.addi %279, %c448 : index
          %result_10 = pto.vlds %6[%286] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %12[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %12[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %12[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %12[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %12[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %12[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %12[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %12[%286] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %287 = pto.vmul %result, %result_11, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmul %result_4, %result_12, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmul %result_5, %result_13, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmul %result_6, %result_14, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmul %result_7, %result_15, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmul %result_8, %result_16, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmul %result_9, %result_17, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %294 = pto.vmul %result_10, %result_18, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %287, %12[%279], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %12[%280], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %12[%281], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %12[%282], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %12[%283], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %12[%284], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %12[%285], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %294, %12[%286], %275 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        %276 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %278 = arith.index_cast %arg8 : i16 to index
          %279 = arith.muli %278, %c512 : index
          %280 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
            %281 = arith.index_cast %arg9 : i16 to index
            %282 = arith.index_cast %arg10 : index to i32
            %mask_4, %scalar_out_5 = pto.plt_b32 %282 : i32 -> !pto.mask<b32>, i32
            %283 = arith.index_cast %scalar_out_5 : i32 to index
            %284 = arith.addi %279, %281 : index
            %285 = pto.addptr %12, %284 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %286 = pto.vsub %result, %276, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %286, %285[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %283 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
        %277 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %278 = arith.index_cast %arg8 : i16 to index
          %279 = arith.muli %278, %c512 : index
          scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
            %280 = arith.index_cast %arg9 : i16 to index
            %281 = arith.addi %279, %280 : index
            %282 = pto.addptr %12, %281 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %282[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %283 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %284 = pto.addptr %277, %281 : <i32, ub> -> <i32, ub>
            pto.vsts %283, %284[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %20 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<i32, ub>
      %21 = pto.addptr %20, %c0 : <i32, ub> -> <i32, ub>
      %22 = pto.addptr %arg2, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %21, %22, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %274 = arith.muli %arg8, %c5 : index
        pto.store_scalar %c1_i32, %arg3[%274] : !pto.ptr<i32, gm>, i32
      }
      scf.for %arg8 = %c1 to %c5 step %c1 {
        %274 = arith.subi %arg8, %c1 : index
        %275 = arith.muli %274, %c128 : index
        %276 = arith.index_cast %275 : index to i64
        %277 = arith.muli %276, %c4_i64 : i64
        %278 = arith.addi %277, %c32_i64 : i64
        %279 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
        pto.vecscope {
          %280 = pto.castptr %278 : i64 -> !pto.ptr<f32, ub>
          %281 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %282 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %283 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %284 = pto.vdup %cst_3, %283 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %285 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %286 = pto.pand %282, %mask, %283 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %287 = arith.index_cast %arg9 : i16 to index
            %288 = arith.muli %287, %c512 : index
            %result = pto.vlds %280[%288] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %289 = arith.addi %288, %c64 : index
            %result_4 = pto.vlds %280[%289] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %290 = pto.vmax %result, %result_4, %285 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %291 = pto.vcmax %290, %285 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %292 = pto.vmax %291, %284, %282 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %292, %281[%287], %286 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        }
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %280 = pto.tgetval ins(%279, %arg9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
          %281 = arith.fptosi %280 : f32 to i32
          %282 = arith.muli %arg9, %c5 : index
          %283 = arith.addi %282, %arg8 : index
          pto.store_scalar %281, %arg3[%283] : !pto.ptr<i32, gm>, i32
        }
      }
      %23 = pto.addptr %arg4, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_gm_to_ubuf %23, %9, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %274 = arith.index_cast %arg8 : i16 to index
          %275 = arith.muli %274, %c128 : index
          scf.for %arg9 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %276 = arith.index_cast %arg9 : i16 to index
            %277 = arith.addi %275, %276 : index
            %278 = pto.addptr %8, %277 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %278[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %279 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %280 = pto.addptr %6, %277 : <f32, ub> -> <f32, ub>
            pto.vsts %279, %280[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %24 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c128 : index
          %result = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = pto.vadd %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vadd %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %280, %6[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %25 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_1, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c128 : index
          %result = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = pto.vmax %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmax %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %280, %6[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmaxs", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmaxs"}
      }
      %26 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %278 = arith.index_cast %arg8 : i16 to index
          %279 = arith.muli %278, %c128 : index
          %result = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %279, %c64 : index
          %result_4 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = pto.vmin %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %282 = pto.vmin %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %281, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %282, %6[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
        %277 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %278 = arith.index_cast %arg8 : i16 to index
          %279 = arith.muli %278, %c128 : index
          %280 = scf.for %arg9 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg10 = %c128) -> (index)  : i16 {
            %281 = arith.index_cast %arg9 : i16 to index
            %282 = arith.index_cast %arg10 : index to i32
            %mask, %scalar_out = pto.plt_b32 %282 : i32 -> !pto.mask<b32>, i32
            %283 = arith.index_cast %scalar_out : i32 to index
            %284 = arith.addi %279, %281 : index
            %285 = pto.addptr %6, %284 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %286 = pto.vsub %result, %277, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %286, %285[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %283 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %27 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_2, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c128 : index
          %result = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = pto.vmul %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmul %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %280, %6[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %6[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %28 = pto.addptr %arg5, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %28, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c2560_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %29 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_1, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %12[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %12[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %12[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %12[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %12[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %12[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %12[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %12[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmin %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmin %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmin %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmin %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmin %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmin %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmin %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmin %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %12[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %12[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %12[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %12[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %12[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %12[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %12[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %12[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
      }
      %30 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %274 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_2, %274 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %276 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %277 = arith.index_cast %arg8 : i16 to index
          %278 = arith.muli %277, %c512 : index
          %result = pto.vlds %12[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %278, %c64 : index
          %result_4 = pto.vlds %12[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %278, %c128 : index
          %result_5 = pto.vlds %12[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %278, %c192 : index
          %result_6 = pto.vlds %12[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %278, %c256 : index
          %result_7 = pto.vlds %12[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %278, %c320 : index
          %result_8 = pto.vlds %12[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %278, %c384 : index
          %result_9 = pto.vlds %12[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = arith.addi %278, %c448 : index
          %result_10 = pto.vlds %12[%285] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vmul %result, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vmul %result_4, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vmul %result_5, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vmul %result_6, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vmul %result_7, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmul %result_8, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmul %result_9, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmul %result_10, %275, %274 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %286, %12[%278], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %12[%279], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %12[%280], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %12[%281], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %12[%282], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %12[%283], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %12[%284], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %293, %12[%285], %276 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %31 = pto.addptr %arg5, %c128 : <f32, gm> -> <f32, gm>
      %32 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
      %33 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %32, %33, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c2560_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.store_scalar %c0_i32, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      %34 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
      %35 = arith.index_cast %34 : i32 to index
      %36 = arith.cmpi sgt, %35, %c0 : index
      scf.if %36 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c0_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %37 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
      %38 = arith.index_cast %37 : i32 to index
      %39 = arith.cmpi sgt, %38, %c0 : index
      scf.if %39 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c1_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %40 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
      %41 = arith.index_cast %40 : i32 to index
      %42 = arith.cmpi sgt, %41, %c0 : index
      scf.if %42 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c2_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %43 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
      %44 = arith.index_cast %43 : i32 to index
      %45 = arith.cmpi sgt, %44, %c0 : index
      scf.if %45 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c3_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %46 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
      %47 = arith.index_cast %46 : i32 to index
      %48 = arith.cmpi sgt, %47, %c0 : index
      scf.if %48 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c4_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %49 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
      %50 = arith.index_cast %49 : i32 to index
      %51 = arith.cmpi sgt, %50, %c0 : index
      scf.if %51 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c5_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %52 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = arith.cmpi sgt, %53, %c0 : index
      scf.if %54 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c6_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %55 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
      %56 = arith.index_cast %55 : i32 to index
      %57 = arith.cmpi sgt, %56, %c0 : index
      scf.if %57 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c7_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %58 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
      %59 = arith.index_cast %58 : i32 to index
      %60 = arith.cmpi sgt, %59, %c0 : index
      scf.if %60 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c8_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %61 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
      %62 = arith.index_cast %61 : i32 to index
      %63 = arith.cmpi sgt, %62, %c0 : index
      scf.if %63 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c9_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %64 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
      %65 = arith.index_cast %64 : i32 to index
      %66 = arith.cmpi sgt, %65, %c0 : index
      scf.if %66 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c10_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %67 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
      %68 = arith.index_cast %67 : i32 to index
      %69 = arith.cmpi sgt, %68, %c0 : index
      scf.if %69 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c11_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %70 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
      %71 = arith.index_cast %70 : i32 to index
      %72 = arith.cmpi sgt, %71, %c0 : index
      scf.if %72 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c12_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %73 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
      %74 = arith.index_cast %73 : i32 to index
      %75 = arith.cmpi sgt, %74, %c0 : index
      scf.if %75 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c13_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %76 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
      %77 = arith.index_cast %76 : i32 to index
      %78 = arith.cmpi sgt, %77, %c0 : index
      scf.if %78 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c14_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %79 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
      %80 = arith.index_cast %79 : i32 to index
      %81 = arith.cmpi sgt, %80, %c0 : index
      scf.if %81 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c15_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %82 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
      %83 = arith.index_cast %82 : i32 to index
      %84 = arith.cmpi sgt, %83, %c0 : index
      scf.if %84 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c16_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %85 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
      %86 = arith.index_cast %85 : i32 to index
      %87 = arith.cmpi sgt, %86, %c0 : index
      scf.if %87 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c17_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %88 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
      %89 = arith.index_cast %88 : i32 to index
      %90 = arith.cmpi sgt, %89, %c0 : index
      scf.if %90 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c18_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %91 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
      %92 = arith.index_cast %91 : i32 to index
      %93 = arith.cmpi sgt, %92, %c0 : index
      scf.if %93 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c19_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %94 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
      %95 = arith.index_cast %94 : i32 to index
      %96 = arith.cmpi sgt, %95, %c0 : index
      scf.if %96 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c20_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %97 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
      %98 = arith.index_cast %97 : i32 to index
      %99 = arith.cmpi sgt, %98, %c0 : index
      scf.if %99 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c21_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %100 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
      %101 = arith.index_cast %100 : i32 to index
      %102 = arith.cmpi sgt, %101, %c0 : index
      scf.if %102 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c22_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %103 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
      %104 = arith.index_cast %103 : i32 to index
      %105 = arith.cmpi sgt, %104, %c0 : index
      scf.if %105 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c23_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %106 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
      %107 = arith.index_cast %106 : i32 to index
      %108 = arith.cmpi sgt, %107, %c0 : index
      scf.if %108 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c24_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %109 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
      %110 = arith.index_cast %109 : i32 to index
      %111 = arith.cmpi sgt, %110, %c0 : index
      scf.if %111 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c25_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %112 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
      %113 = arith.index_cast %112 : i32 to index
      %114 = arith.cmpi sgt, %113, %c0 : index
      scf.if %114 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c26_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %115 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
      %116 = arith.index_cast %115 : i32 to index
      %117 = arith.cmpi sgt, %116, %c0 : index
      scf.if %117 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c27_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %118 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
      %119 = arith.index_cast %118 : i32 to index
      %120 = arith.cmpi sgt, %119, %c0 : index
      scf.if %120 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c28_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %121 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
      %122 = arith.index_cast %121 : i32 to index
      %123 = arith.cmpi sgt, %122, %c0 : index
      scf.if %123 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c29_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %124 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
      %125 = arith.index_cast %124 : i32 to index
      %126 = arith.cmpi sgt, %125, %c0 : index
      scf.if %126 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c30_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %127 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
      %128 = arith.index_cast %127 : i32 to index
      %129 = arith.cmpi sgt, %128, %c0 : index
      scf.if %129 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c31_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %130 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
      %131 = arith.index_cast %130 : i32 to index
      %132 = arith.cmpi sgt, %131, %c0 : index
      scf.if %132 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c32_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %133 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
      %134 = arith.index_cast %133 : i32 to index
      %135 = arith.cmpi sgt, %134, %c0 : index
      scf.if %135 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c33_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %136 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
      %137 = arith.index_cast %136 : i32 to index
      %138 = arith.cmpi sgt, %137, %c0 : index
      scf.if %138 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c34_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %139 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
      %140 = arith.index_cast %139 : i32 to index
      %141 = arith.cmpi sgt, %140, %c0 : index
      scf.if %141 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c35_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %142 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
      %143 = arith.index_cast %142 : i32 to index
      %144 = arith.cmpi sgt, %143, %c0 : index
      scf.if %144 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c36_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %145 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
      %146 = arith.index_cast %145 : i32 to index
      %147 = arith.cmpi sgt, %146, %c0 : index
      scf.if %147 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c37_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %148 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
      %149 = arith.index_cast %148 : i32 to index
      %150 = arith.cmpi sgt, %149, %c0 : index
      scf.if %150 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c38_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %151 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
      %152 = arith.index_cast %151 : i32 to index
      %153 = arith.cmpi sgt, %152, %c0 : index
      scf.if %153 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c39_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %154 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
      %155 = arith.index_cast %154 : i32 to index
      %156 = arith.cmpi sle, %155, %c0 : index
      scf.if %156 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c0_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %157 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
      %158 = arith.index_cast %157 : i32 to index
      %159 = arith.cmpi sle, %158, %c0 : index
      scf.if %159 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c1_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %160 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
      %161 = arith.index_cast %160 : i32 to index
      %162 = arith.cmpi sle, %161, %c0 : index
      scf.if %162 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c2_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %163 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
      %164 = arith.index_cast %163 : i32 to index
      %165 = arith.cmpi sle, %164, %c0 : index
      scf.if %165 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c3_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %166 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
      %167 = arith.index_cast %166 : i32 to index
      %168 = arith.cmpi sle, %167, %c0 : index
      scf.if %168 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c4_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %169 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
      %170 = arith.index_cast %169 : i32 to index
      %171 = arith.cmpi sle, %170, %c0 : index
      scf.if %171 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c5_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %172 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
      %173 = arith.index_cast %172 : i32 to index
      %174 = arith.cmpi sle, %173, %c0 : index
      scf.if %174 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c6_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %175 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
      %176 = arith.index_cast %175 : i32 to index
      %177 = arith.cmpi sle, %176, %c0 : index
      scf.if %177 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c7_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %178 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
      %179 = arith.index_cast %178 : i32 to index
      %180 = arith.cmpi sle, %179, %c0 : index
      scf.if %180 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c8_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %181 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
      %182 = arith.index_cast %181 : i32 to index
      %183 = arith.cmpi sle, %182, %c0 : index
      scf.if %183 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c9_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %184 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
      %185 = arith.index_cast %184 : i32 to index
      %186 = arith.cmpi sle, %185, %c0 : index
      scf.if %186 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c10_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %187 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
      %188 = arith.index_cast %187 : i32 to index
      %189 = arith.cmpi sle, %188, %c0 : index
      scf.if %189 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c11_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %190 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
      %191 = arith.index_cast %190 : i32 to index
      %192 = arith.cmpi sle, %191, %c0 : index
      scf.if %192 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c12_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %193 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
      %194 = arith.index_cast %193 : i32 to index
      %195 = arith.cmpi sle, %194, %c0 : index
      scf.if %195 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c13_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %196 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
      %197 = arith.index_cast %196 : i32 to index
      %198 = arith.cmpi sle, %197, %c0 : index
      scf.if %198 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c14_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %199 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
      %200 = arith.index_cast %199 : i32 to index
      %201 = arith.cmpi sle, %200, %c0 : index
      scf.if %201 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c15_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %202 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
      %203 = arith.index_cast %202 : i32 to index
      %204 = arith.cmpi sle, %203, %c0 : index
      scf.if %204 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c16_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %205 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
      %206 = arith.index_cast %205 : i32 to index
      %207 = arith.cmpi sle, %206, %c0 : index
      scf.if %207 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c17_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %208 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
      %209 = arith.index_cast %208 : i32 to index
      %210 = arith.cmpi sle, %209, %c0 : index
      scf.if %210 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c18_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %211 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
      %212 = arith.index_cast %211 : i32 to index
      %213 = arith.cmpi sle, %212, %c0 : index
      scf.if %213 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c19_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %214 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
      %215 = arith.index_cast %214 : i32 to index
      %216 = arith.cmpi sle, %215, %c0 : index
      scf.if %216 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c20_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %217 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
      %218 = arith.index_cast %217 : i32 to index
      %219 = arith.cmpi sle, %218, %c0 : index
      scf.if %219 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c21_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %220 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
      %221 = arith.index_cast %220 : i32 to index
      %222 = arith.cmpi sle, %221, %c0 : index
      scf.if %222 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c22_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %223 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
      %224 = arith.index_cast %223 : i32 to index
      %225 = arith.cmpi sle, %224, %c0 : index
      scf.if %225 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c23_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %226 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
      %227 = arith.index_cast %226 : i32 to index
      %228 = arith.cmpi sle, %227, %c0 : index
      scf.if %228 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c24_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %229 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
      %230 = arith.index_cast %229 : i32 to index
      %231 = arith.cmpi sle, %230, %c0 : index
      scf.if %231 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c25_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %232 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
      %233 = arith.index_cast %232 : i32 to index
      %234 = arith.cmpi sle, %233, %c0 : index
      scf.if %234 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c26_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %235 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
      %236 = arith.index_cast %235 : i32 to index
      %237 = arith.cmpi sle, %236, %c0 : index
      scf.if %237 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c27_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %238 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
      %239 = arith.index_cast %238 : i32 to index
      %240 = arith.cmpi sle, %239, %c0 : index
      scf.if %240 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c28_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %241 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
      %242 = arith.index_cast %241 : i32 to index
      %243 = arith.cmpi sle, %242, %c0 : index
      scf.if %243 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c29_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %244 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
      %245 = arith.index_cast %244 : i32 to index
      %246 = arith.cmpi sle, %245, %c0 : index
      scf.if %246 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c30_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %247 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
      %248 = arith.index_cast %247 : i32 to index
      %249 = arith.cmpi sle, %248, %c0 : index
      scf.if %249 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c31_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %250 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
      %251 = arith.index_cast %250 : i32 to index
      %252 = arith.cmpi sle, %251, %c0 : index
      scf.if %252 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c32_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %253 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
      %254 = arith.index_cast %253 : i32 to index
      %255 = arith.cmpi sle, %254, %c0 : index
      scf.if %255 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c33_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %256 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
      %257 = arith.index_cast %256 : i32 to index
      %258 = arith.cmpi sle, %257, %c0 : index
      scf.if %258 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c34_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %259 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
      %260 = arith.index_cast %259 : i32 to index
      %261 = arith.cmpi sle, %260, %c0 : index
      scf.if %261 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c35_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %262 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
      %263 = arith.index_cast %262 : i32 to index
      %264 = arith.cmpi sle, %263, %c0 : index
      scf.if %264 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c36_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %265 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
      %266 = arith.index_cast %265 : i32 to index
      %267 = arith.cmpi sle, %266, %c0 : index
      scf.if %267 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c37_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %268 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
      %269 = arith.index_cast %268 : i32 to index
      %270 = arith.cmpi sle, %269, %c0 : index
      scf.if %270 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c38_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %271 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
      %272 = arith.index_cast %271 : i32 to index
      %273 = arith.cmpi sle, %272, %c0 : index
      scf.if %273 {
        %274 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %275 = arith.index_cast %274 : i32 to index
        pto.store_scalar %c39_i32, %arg7[%275] : !pto.ptr<i32, gm>, i32
        %276 = arith.addi %275, %c1 : index
        %277 = arith.index_cast %276 : index to i32
        pto.store_scalar %277, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      return
    }
  }
}

