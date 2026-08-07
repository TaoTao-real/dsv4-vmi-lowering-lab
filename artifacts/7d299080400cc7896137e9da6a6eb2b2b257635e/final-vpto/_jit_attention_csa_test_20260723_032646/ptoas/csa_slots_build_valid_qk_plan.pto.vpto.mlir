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
        %262 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %263 = arith.index_cast %arg8 : i16 to index
          %264 = arith.muli %263, %c512 : index
          scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
            %265 = arith.index_cast %arg9 : i16 to index
            %266 = arith.addi %264, %265 : index
            %267 = pto.addptr %0, %266 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %267[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %268 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %269 = pto.addptr %262, %266 : <f32, ub> -> <f32, ub>
            pto.vsts %268, %269[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
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
      %10 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %result = pto.vlds %5[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %262 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %262, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %263 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %264 = pto.vdup %cst, %263 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %265 = pto.vadd %result_4, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %266 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %267 = pto.vdup %cst_0, %263 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %268 = pto.vmul %265, %267, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %269 = pto.pand %266, %mask, %263 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %268, %6[%c0], %269 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %270 = pto.vcvt %result_5, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        pto.vsts %270, %9[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %9[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %271 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %272 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<f32, ub>
        %273 = pto.addptr %272, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %271, %273[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %276 = arith.index_cast %arg8 : i16 to index
          %277 = arith.muli %276, %c512 : index
          %278 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
            %279 = arith.index_cast %arg9 : i16 to index
            %280 = arith.index_cast %arg10 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %280 : i32 -> !pto.mask<b32>, i32
            %281 = arith.index_cast %scalar_out_8 : i32 to index
            %282 = pto.vdup %cst, %mask_7 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %283 = arith.addi %277, %279 : index
            %284 = pto.addptr %6, %283 : <f32, ub> -> <f32, ub>
            pto.vsts %282, %284[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %281 : index
          }
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %276 = arith.index_cast %arg8 : i16 to index
          %277 = arith.muli %276, %c512 : index
          %278 = pto.addptr %272, %276 : <f32, ub> -> <f32, ub>
          %279 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
            %280 = arith.index_cast %arg9 : i16 to index
            %281 = arith.index_cast %arg10 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %281 : i32 -> !pto.mask<b32>, i32
            %282 = arith.index_cast %scalar_out_8 : i32 to index
            %283 = arith.addi %277, %280 : index
            %284 = pto.addptr %6, %283 : <f32, ub> -> <f32, ub>
            %result_9 = pto.vlds %284[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %278[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %285 = pto.vdup %result_10, %mask_7 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %286 = pto.vmul %result_9, %285, %mask_7 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %286, %284[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %282 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %274 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %275 = pto.vdup %cst_1, %263 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %276 = arith.index_cast %arg8 : i16 to index
          %277 = arith.muli %276, %c512 : index
          %result_7 = pto.vlds %10[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %278 = arith.addi %277, %c64 : index
          %result_8 = pto.vlds %10[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %277, %c128 : index
          %result_9 = pto.vlds %10[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %277, %c192 : index
          %result_10 = pto.vlds %10[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %277, %c256 : index
          %result_11 = pto.vlds %10[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %277, %c320 : index
          %result_12 = pto.vlds %10[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = arith.addi %277, %c384 : index
          %result_13 = pto.vlds %10[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %284 = arith.addi %277, %c448 : index
          %result_14 = pto.vlds %10[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %285 = pto.vadd %result_7, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vadd %result_8, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %result_9, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vadd %result_10, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vadd %result_11, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vadd %result_12, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vadd %result_13, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vadd %result_14, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmax %285, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %294 = pto.vmax %286, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %295 = pto.vmax %287, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %296 = pto.vmax %288, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %297 = pto.vmax %289, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %298 = pto.vmax %290, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %299 = pto.vmax %291, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %300 = pto.vmax %292, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %301 = pto.vmin %293, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %302 = pto.vmin %294, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %303 = pto.vmin %295, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %304 = pto.vmin %296, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %305 = pto.vmin %297, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %306 = pto.vmin %298, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %307 = pto.vmin %299, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %308 = pto.vmin %300, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %301, %272[%277], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %302, %272[%278], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %303, %272[%279], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %304, %272[%280], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %305, %272[%281], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %306, %272[%282], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %307, %272[%283], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %308, %272[%284], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_15 = pto.vlds %6[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %6[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %6[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %6[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %6[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %6[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %6[%283] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %6[%284] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %309 = pto.vsub %result_15, %result_7, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %310 = pto.vsub %result_16, %result_8, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %311 = pto.vsub %result_17, %result_9, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %312 = pto.vsub %result_18, %result_10, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %313 = pto.vsub %result_19, %result_11, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %314 = pto.vsub %result_20, %result_12, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %315 = pto.vsub %result_21, %result_13, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %316 = pto.vsub %result_22, %result_14, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %317 = pto.vmax %309, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %318 = pto.vmax %310, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %319 = pto.vmax %311, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %320 = pto.vmax %312, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %321 = pto.vmax %313, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %322 = pto.vmax %314, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %323 = pto.vmax %315, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %324 = pto.vmax %316, %275, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %325 = pto.vmin %317, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %326 = pto.vmin %318, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %327 = pto.vmin %319, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %328 = pto.vmin %320, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %329 = pto.vmin %321, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %330 = pto.vmin %322, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %331 = pto.vmin %323, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %332 = pto.vmin %324, %264, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %333 = pto.vmul %301, %325, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %334 = pto.vmul %302, %326, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %335 = pto.vmul %303, %327, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %336 = pto.vmul %304, %328, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %337 = pto.vmul %305, %329, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %338 = pto.vmul %306, %330, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %339 = pto.vmul %307, %331, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %340 = pto.vmul %308, %332, %263 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %333, %6[%277], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %334, %6[%278], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %335, %6[%279], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %336, %6[%280], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %337, %6[%281], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %338, %6[%282], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %339, %6[%283], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %340, %6[%284], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %285, %10[%277], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %286, %10[%278], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %287, %10[%279], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %288, %10[%280], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %289, %10[%281], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %290, %10[%282], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %291, %10[%283], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %292, %10[%284], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %11 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %262 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %263 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c512 : index
          %result = pto.vlds %6[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %267, %c64 : index
          %result_4 = pto.vlds %6[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %267, %c128 : index
          %result_5 = pto.vlds %6[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %267, %c192 : index
          %result_6 = pto.vlds %6[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %267, %c256 : index
          %result_7 = pto.vlds %6[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %267, %c320 : index
          %result_8 = pto.vlds %6[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %267, %c384 : index
          %result_9 = pto.vlds %6[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = arith.addi %267, %c448 : index
          %result_10 = pto.vlds %6[%274] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %10[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %10[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %10[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %10[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %10[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %10[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %10[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %10[%274] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %275 = pto.vmul %result, %result_11, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vmul %result_4, %result_12, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vmul %result_5, %result_13, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vmul %result_6, %result_14, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vmul %result_7, %result_15, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vmul %result_8, %result_16, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmul %result_9, %result_17, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %282 = pto.vmul %result_10, %result_18, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %275, %10[%267], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %10[%268], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %10[%269], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %10[%270], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %10[%271], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %10[%272], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %10[%273], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %282, %10[%274], %263 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        %264 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c512 : index
          %268 = scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg10 = %c512) -> (index)  : i16 {
            %269 = arith.index_cast %arg9 : i16 to index
            %270 = arith.index_cast %arg10 : index to i32
            %mask_4, %scalar_out_5 = pto.plt_b32 %270 : i32 -> !pto.mask<b32>, i32
            %271 = arith.index_cast %scalar_out_5 : i32 to index
            %272 = arith.addi %267, %269 : index
            %273 = pto.addptr %10, %272 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %273[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %274 = pto.vsub %result, %264, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %274, %273[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %271 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
        %265 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c512 : index
          scf.for %arg9 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
            %268 = arith.index_cast %arg9 : i16 to index
            %269 = arith.addi %267, %268 : index
            %270 = pto.addptr %10, %269 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %270[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %271 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %272 = pto.addptr %265, %269 : <i32, ub> -> <i32, ub>
            pto.vsts %271, %272[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %12 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<i32, ub>
      %13 = pto.addptr %12, %c0 : <i32, ub> -> <i32, ub>
      %14 = pto.addptr %arg2, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %13, %14, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %262 = arith.muli %arg8, %c5 : index
        pto.store_scalar %c1_i32, %arg3[%262] : !pto.ptr<i32, gm>, i32
      }
      scf.for %arg8 = %c1 to %c5 step %c1 {
        %262 = arith.subi %arg8, %c1 : index
        %263 = arith.muli %262, %c128 : index
        %264 = arith.index_cast %263 : index to i64
        %265 = arith.muli %264, %c4_i64 : i64
        %266 = arith.addi %265, %c32_i64 : i64
        %267 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
        pto.vecscope {
          %268 = pto.castptr %266 : i64 -> !pto.ptr<f32, ub>
          %269 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %270 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %271 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %272 = pto.vdup %cst_3, %271 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %273 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %274 = pto.pand %270, %mask, %271 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %275 = arith.index_cast %arg9 : i16 to index
            %276 = arith.muli %275, %c512 : index
            %result = pto.vlds %268[%276] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %277 = arith.addi %276, %c64 : index
            %result_4 = pto.vlds %268[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %278 = pto.vmax %result, %result_4, %273 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %279 = pto.vcmax %278, %273 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %280 = pto.vmax %279, %272, %270 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %280, %269[%275], %274 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        }
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %268 = pto.tgetval ins(%267, %arg9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
          %269 = arith.fptosi %268 : f32 to i32
          %270 = arith.muli %arg9, %c5 : index
          %271 = arith.addi %270, %arg8 : index
          pto.store_scalar %269, %arg3[%271] : !pto.ptr<i32, gm>, i32
        }
      }
      %15 = pto.addptr %arg4, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_gm_to_ubuf %15, %9, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %267 = arith.index_cast %arg8 : i16 to index
          %268 = arith.muli %267, %c128 : index
          scf.for %arg9 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %269 = arith.index_cast %arg9 : i16 to index
            %270 = arith.addi %268, %269 : index
            %271 = pto.addptr %8, %270 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %271[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %272 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %273 = pto.addptr %6, %270 : <f32, ub> -> <f32, ub>
            pto.vsts %272, %273[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %262 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %263 = pto.vdup %cst, %262 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %264 = pto.vdup %cst_1, %262 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %265 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %267 = arith.index_cast %arg8 : i16 to index
          %268 = arith.muli %267, %c128 : index
          %result = pto.vlds %6[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %268, %c64 : index
          %result_4 = pto.vlds %6[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = pto.vadd %result, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %271 = pto.vadd %result_4, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %272 = pto.vmax %270, %264, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %273 = pto.vmax %271, %264, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %274 = pto.vmin %272, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vmin %273, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %274, %6[%268], %265 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %275, %6[%269], %265 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %266 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %267 = arith.index_cast %arg8 : i16 to index
          %268 = arith.muli %267, %c128 : index
          %269 = scf.for %arg9 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg10 = %c128) -> (index)  : i16 {
            %270 = arith.index_cast %arg9 : i16 to index
            %271 = arith.index_cast %arg10 : index to i32
            %mask_4, %scalar_out_5 = pto.plt_b32 %271 : i32 -> !pto.mask<b32>, i32
            %272 = arith.index_cast %scalar_out_5 : i32 to index
            %273 = arith.addi %268, %270 : index
            %274 = pto.addptr %6, %273 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %274[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %275 = pto.vsub %result, %266, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %275, %274[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %272 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %16 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.vecscope {
        %262 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %263 = pto.vdup %cst_2, %262 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c128 : index
          %result = pto.vlds %6[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_4 = pto.vlds %6[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = pto.vmul %result, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %269 = pto.vmul %result_4, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %268, %6[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %269, %6[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %17 = pto.addptr %arg5, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %17, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c2560_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %262 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %263 = pto.vdup %cst_1, %262 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c512 : index
          %result = pto.vlds %10[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_4 = pto.vlds %10[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %266, %c128 : index
          %result_5 = pto.vlds %10[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %266, %c192 : index
          %result_6 = pto.vlds %10[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %266, %c256 : index
          %result_7 = pto.vlds %10[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %266, %c320 : index
          %result_8 = pto.vlds %10[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %266, %c384 : index
          %result_9 = pto.vlds %10[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %266, %c448 : index
          %result_10 = pto.vlds %10[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = pto.vmin %result, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vmin %result_4, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vmin %result_5, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vmin %result_6, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vmin %result_7, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vmin %result_8, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vmin %result_9, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmin %result_10, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %274, %10[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %275, %10[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %10[%268], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %10[%269], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %10[%270], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %10[%271], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %10[%272], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %10[%273], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
      }
      %18 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %262 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %263 = pto.vdup %cst_2, %262 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c512 : index
          %result = pto.vlds %10[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_4 = pto.vlds %10[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %266, %c128 : index
          %result_5 = pto.vlds %10[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %266, %c192 : index
          %result_6 = pto.vlds %10[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %266, %c256 : index
          %result_7 = pto.vlds %10[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %266, %c320 : index
          %result_8 = pto.vlds %10[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %266, %c384 : index
          %result_9 = pto.vlds %10[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %266, %c448 : index
          %result_10 = pto.vlds %10[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = pto.vmul %result, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vmul %result_4, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vmul %result_5, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vmul %result_6, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vmul %result_7, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vmul %result_8, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vmul %result_9, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmul %result_10, %263, %262 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %274, %10[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %275, %10[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %10[%268], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %10[%269], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %10[%270], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %10[%271], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %10[%272], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %10[%273], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %19 = pto.addptr %arg5, %c128 : <f32, gm> -> <f32, gm>
      %20 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      %21 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %20, %21, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c2560_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.store_scalar %c0_i32, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      %22 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
      %23 = arith.index_cast %22 : i32 to index
      %24 = arith.cmpi sgt, %23, %c0 : index
      scf.if %24 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c0_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %25 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
      %26 = arith.index_cast %25 : i32 to index
      %27 = arith.cmpi sgt, %26, %c0 : index
      scf.if %27 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c1_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %28 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
      %29 = arith.index_cast %28 : i32 to index
      %30 = arith.cmpi sgt, %29, %c0 : index
      scf.if %30 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c2_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %31 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
      %32 = arith.index_cast %31 : i32 to index
      %33 = arith.cmpi sgt, %32, %c0 : index
      scf.if %33 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c3_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %34 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
      %35 = arith.index_cast %34 : i32 to index
      %36 = arith.cmpi sgt, %35, %c0 : index
      scf.if %36 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c4_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %37 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
      %38 = arith.index_cast %37 : i32 to index
      %39 = arith.cmpi sgt, %38, %c0 : index
      scf.if %39 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c5_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %40 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
      %41 = arith.index_cast %40 : i32 to index
      %42 = arith.cmpi sgt, %41, %c0 : index
      scf.if %42 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c6_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %43 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
      %44 = arith.index_cast %43 : i32 to index
      %45 = arith.cmpi sgt, %44, %c0 : index
      scf.if %45 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c7_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %46 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
      %47 = arith.index_cast %46 : i32 to index
      %48 = arith.cmpi sgt, %47, %c0 : index
      scf.if %48 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c8_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %49 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
      %50 = arith.index_cast %49 : i32 to index
      %51 = arith.cmpi sgt, %50, %c0 : index
      scf.if %51 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c9_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %52 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = arith.cmpi sgt, %53, %c0 : index
      scf.if %54 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c10_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %55 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
      %56 = arith.index_cast %55 : i32 to index
      %57 = arith.cmpi sgt, %56, %c0 : index
      scf.if %57 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c11_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %58 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
      %59 = arith.index_cast %58 : i32 to index
      %60 = arith.cmpi sgt, %59, %c0 : index
      scf.if %60 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c12_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %61 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
      %62 = arith.index_cast %61 : i32 to index
      %63 = arith.cmpi sgt, %62, %c0 : index
      scf.if %63 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c13_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %64 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
      %65 = arith.index_cast %64 : i32 to index
      %66 = arith.cmpi sgt, %65, %c0 : index
      scf.if %66 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c14_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %67 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
      %68 = arith.index_cast %67 : i32 to index
      %69 = arith.cmpi sgt, %68, %c0 : index
      scf.if %69 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c15_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %70 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
      %71 = arith.index_cast %70 : i32 to index
      %72 = arith.cmpi sgt, %71, %c0 : index
      scf.if %72 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c16_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %73 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
      %74 = arith.index_cast %73 : i32 to index
      %75 = arith.cmpi sgt, %74, %c0 : index
      scf.if %75 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c17_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %76 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
      %77 = arith.index_cast %76 : i32 to index
      %78 = arith.cmpi sgt, %77, %c0 : index
      scf.if %78 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c18_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %79 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
      %80 = arith.index_cast %79 : i32 to index
      %81 = arith.cmpi sgt, %80, %c0 : index
      scf.if %81 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c19_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %82 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
      %83 = arith.index_cast %82 : i32 to index
      %84 = arith.cmpi sgt, %83, %c0 : index
      scf.if %84 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c20_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %85 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
      %86 = arith.index_cast %85 : i32 to index
      %87 = arith.cmpi sgt, %86, %c0 : index
      scf.if %87 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c21_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %88 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
      %89 = arith.index_cast %88 : i32 to index
      %90 = arith.cmpi sgt, %89, %c0 : index
      scf.if %90 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c22_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %91 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
      %92 = arith.index_cast %91 : i32 to index
      %93 = arith.cmpi sgt, %92, %c0 : index
      scf.if %93 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c23_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %94 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
      %95 = arith.index_cast %94 : i32 to index
      %96 = arith.cmpi sgt, %95, %c0 : index
      scf.if %96 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c24_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %97 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
      %98 = arith.index_cast %97 : i32 to index
      %99 = arith.cmpi sgt, %98, %c0 : index
      scf.if %99 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c25_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %100 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
      %101 = arith.index_cast %100 : i32 to index
      %102 = arith.cmpi sgt, %101, %c0 : index
      scf.if %102 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c26_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %103 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
      %104 = arith.index_cast %103 : i32 to index
      %105 = arith.cmpi sgt, %104, %c0 : index
      scf.if %105 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c27_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %106 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
      %107 = arith.index_cast %106 : i32 to index
      %108 = arith.cmpi sgt, %107, %c0 : index
      scf.if %108 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c28_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %109 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
      %110 = arith.index_cast %109 : i32 to index
      %111 = arith.cmpi sgt, %110, %c0 : index
      scf.if %111 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c29_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %112 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
      %113 = arith.index_cast %112 : i32 to index
      %114 = arith.cmpi sgt, %113, %c0 : index
      scf.if %114 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c30_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %115 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
      %116 = arith.index_cast %115 : i32 to index
      %117 = arith.cmpi sgt, %116, %c0 : index
      scf.if %117 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c31_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %118 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
      %119 = arith.index_cast %118 : i32 to index
      %120 = arith.cmpi sgt, %119, %c0 : index
      scf.if %120 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c32_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %121 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
      %122 = arith.index_cast %121 : i32 to index
      %123 = arith.cmpi sgt, %122, %c0 : index
      scf.if %123 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c33_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %124 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
      %125 = arith.index_cast %124 : i32 to index
      %126 = arith.cmpi sgt, %125, %c0 : index
      scf.if %126 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c34_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %127 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
      %128 = arith.index_cast %127 : i32 to index
      %129 = arith.cmpi sgt, %128, %c0 : index
      scf.if %129 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c35_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %130 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
      %131 = arith.index_cast %130 : i32 to index
      %132 = arith.cmpi sgt, %131, %c0 : index
      scf.if %132 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c36_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %133 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
      %134 = arith.index_cast %133 : i32 to index
      %135 = arith.cmpi sgt, %134, %c0 : index
      scf.if %135 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c37_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %136 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
      %137 = arith.index_cast %136 : i32 to index
      %138 = arith.cmpi sgt, %137, %c0 : index
      scf.if %138 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c38_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %139 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
      %140 = arith.index_cast %139 : i32 to index
      %141 = arith.cmpi sgt, %140, %c0 : index
      scf.if %141 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c39_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %142 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
      %143 = arith.index_cast %142 : i32 to index
      %144 = arith.cmpi sle, %143, %c0 : index
      scf.if %144 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c0_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %145 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
      %146 = arith.index_cast %145 : i32 to index
      %147 = arith.cmpi sle, %146, %c0 : index
      scf.if %147 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c1_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %148 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
      %149 = arith.index_cast %148 : i32 to index
      %150 = arith.cmpi sle, %149, %c0 : index
      scf.if %150 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c2_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %151 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
      %152 = arith.index_cast %151 : i32 to index
      %153 = arith.cmpi sle, %152, %c0 : index
      scf.if %153 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c3_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %154 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
      %155 = arith.index_cast %154 : i32 to index
      %156 = arith.cmpi sle, %155, %c0 : index
      scf.if %156 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c4_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %157 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
      %158 = arith.index_cast %157 : i32 to index
      %159 = arith.cmpi sle, %158, %c0 : index
      scf.if %159 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c5_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %160 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
      %161 = arith.index_cast %160 : i32 to index
      %162 = arith.cmpi sle, %161, %c0 : index
      scf.if %162 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c6_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %163 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
      %164 = arith.index_cast %163 : i32 to index
      %165 = arith.cmpi sle, %164, %c0 : index
      scf.if %165 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c7_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %166 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
      %167 = arith.index_cast %166 : i32 to index
      %168 = arith.cmpi sle, %167, %c0 : index
      scf.if %168 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c8_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %169 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
      %170 = arith.index_cast %169 : i32 to index
      %171 = arith.cmpi sle, %170, %c0 : index
      scf.if %171 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c9_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %172 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
      %173 = arith.index_cast %172 : i32 to index
      %174 = arith.cmpi sle, %173, %c0 : index
      scf.if %174 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c10_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %175 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
      %176 = arith.index_cast %175 : i32 to index
      %177 = arith.cmpi sle, %176, %c0 : index
      scf.if %177 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c11_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %178 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
      %179 = arith.index_cast %178 : i32 to index
      %180 = arith.cmpi sle, %179, %c0 : index
      scf.if %180 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c12_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %181 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
      %182 = arith.index_cast %181 : i32 to index
      %183 = arith.cmpi sle, %182, %c0 : index
      scf.if %183 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c13_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %184 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
      %185 = arith.index_cast %184 : i32 to index
      %186 = arith.cmpi sle, %185, %c0 : index
      scf.if %186 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c14_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %187 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
      %188 = arith.index_cast %187 : i32 to index
      %189 = arith.cmpi sle, %188, %c0 : index
      scf.if %189 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c15_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %190 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
      %191 = arith.index_cast %190 : i32 to index
      %192 = arith.cmpi sle, %191, %c0 : index
      scf.if %192 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c16_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %193 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
      %194 = arith.index_cast %193 : i32 to index
      %195 = arith.cmpi sle, %194, %c0 : index
      scf.if %195 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c17_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %196 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
      %197 = arith.index_cast %196 : i32 to index
      %198 = arith.cmpi sle, %197, %c0 : index
      scf.if %198 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c18_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %199 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
      %200 = arith.index_cast %199 : i32 to index
      %201 = arith.cmpi sle, %200, %c0 : index
      scf.if %201 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c19_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %202 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
      %203 = arith.index_cast %202 : i32 to index
      %204 = arith.cmpi sle, %203, %c0 : index
      scf.if %204 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c20_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %205 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
      %206 = arith.index_cast %205 : i32 to index
      %207 = arith.cmpi sle, %206, %c0 : index
      scf.if %207 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c21_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %208 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
      %209 = arith.index_cast %208 : i32 to index
      %210 = arith.cmpi sle, %209, %c0 : index
      scf.if %210 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c22_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %211 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
      %212 = arith.index_cast %211 : i32 to index
      %213 = arith.cmpi sle, %212, %c0 : index
      scf.if %213 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c23_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %214 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
      %215 = arith.index_cast %214 : i32 to index
      %216 = arith.cmpi sle, %215, %c0 : index
      scf.if %216 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c24_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %217 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
      %218 = arith.index_cast %217 : i32 to index
      %219 = arith.cmpi sle, %218, %c0 : index
      scf.if %219 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c25_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %220 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
      %221 = arith.index_cast %220 : i32 to index
      %222 = arith.cmpi sle, %221, %c0 : index
      scf.if %222 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c26_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %223 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
      %224 = arith.index_cast %223 : i32 to index
      %225 = arith.cmpi sle, %224, %c0 : index
      scf.if %225 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c27_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %226 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
      %227 = arith.index_cast %226 : i32 to index
      %228 = arith.cmpi sle, %227, %c0 : index
      scf.if %228 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c28_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %229 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
      %230 = arith.index_cast %229 : i32 to index
      %231 = arith.cmpi sle, %230, %c0 : index
      scf.if %231 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c29_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %232 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
      %233 = arith.index_cast %232 : i32 to index
      %234 = arith.cmpi sle, %233, %c0 : index
      scf.if %234 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c30_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %235 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
      %236 = arith.index_cast %235 : i32 to index
      %237 = arith.cmpi sle, %236, %c0 : index
      scf.if %237 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c31_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %238 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
      %239 = arith.index_cast %238 : i32 to index
      %240 = arith.cmpi sle, %239, %c0 : index
      scf.if %240 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c32_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %241 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
      %242 = arith.index_cast %241 : i32 to index
      %243 = arith.cmpi sle, %242, %c0 : index
      scf.if %243 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c33_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %244 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
      %245 = arith.index_cast %244 : i32 to index
      %246 = arith.cmpi sle, %245, %c0 : index
      scf.if %246 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c34_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %247 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
      %248 = arith.index_cast %247 : i32 to index
      %249 = arith.cmpi sle, %248, %c0 : index
      scf.if %249 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c35_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %250 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
      %251 = arith.index_cast %250 : i32 to index
      %252 = arith.cmpi sle, %251, %c0 : index
      scf.if %252 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c36_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %253 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
      %254 = arith.index_cast %253 : i32 to index
      %255 = arith.cmpi sle, %254, %c0 : index
      scf.if %255 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c37_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %256 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
      %257 = arith.index_cast %256 : i32 to index
      %258 = arith.cmpi sle, %257, %c0 : index
      scf.if %258 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c38_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %259 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
      %260 = arith.index_cast %259 : i32 to index
      %261 = arith.cmpi sle, %260, %c0 : index
      scf.if %261 {
        %262 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %263 = arith.index_cast %262 : i32 to index
        pto.store_scalar %c39_i32, %arg7[%263] : !pto.ptr<i32, gm>, i32
        %264 = arith.addi %263, %c1 : index
        %265 = arith.index_cast %264 : index to i32
        pto.store_scalar %265, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      return
    }
  }
}
