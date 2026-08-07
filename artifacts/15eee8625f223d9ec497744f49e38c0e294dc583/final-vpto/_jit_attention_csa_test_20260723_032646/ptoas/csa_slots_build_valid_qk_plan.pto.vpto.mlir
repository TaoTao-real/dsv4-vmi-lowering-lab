module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @csa_slots_build_valid_qk_plan(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
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
      %cst_3 = arith.constant -1.000000e+00 : f32
      %cst_4 = arith.constant -3.40282347E+38 : f32
      %c64 = arith.constant 64 : index
      %c1_i64 = arith.constant 1 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %0 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<i32, ub>
      %1 = pto.addptr %arg0, %c0 : <i32, gm> -> <i32, gm>
      %2 = pto.addptr %0, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %3 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %4 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %265 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c512 : index
          %result = pto.vlds %0[%267] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %268 = arith.addi %267, %c64 : index
          %result_5 = pto.vlds %0[%268] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %269 = arith.addi %267, %c128 : index
          %result_6 = pto.vlds %0[%269] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %270 = arith.addi %267, %c192 : index
          %result_7 = pto.vlds %0[%270] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %271 = arith.addi %267, %c256 : index
          %result_8 = pto.vlds %0[%271] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %272 = arith.addi %267, %c320 : index
          %result_9 = pto.vlds %0[%272] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %273 = arith.addi %267, %c384 : index
          %result_10 = pto.vlds %0[%273] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %274 = arith.addi %267, %c448 : index
          %result_11 = pto.vlds %0[%274] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %275 = pto.vcvt %result, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vcvt %result_5, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vcvt %result_6, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vcvt %result_7, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vcvt %result_8, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vcvt %result_9, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vcvt %result_10, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %282 = pto.vcvt %result_11, %265 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %275, %4[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %4[%268], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %4[%269], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %4[%270], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %4[%271], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %4[%272], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %4[%273], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %282, %4[%274], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %5 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %6 = pto.addptr %arg1, %c0 : <i32, gm> -> <i32, gm>
      %7 = pto.addptr %5, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %8 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
      %11 = pto.addptr %10, %c0 : <i32, ub> -> <i32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %result = pto.vlds %7[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %264 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %264, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %265 = pto.vadds %result_5, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %265, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %266 = pto.vmuls %result_6, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %266, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %267 = pto.vcvt %result_7, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        pto.vsts %267, %11[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        %result_8 = pto.vlds %11[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %268 = pto.vcvt %result_8, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %269 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<f32, ub>
        %270 = pto.addptr %269, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %268, %270[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %271 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %272 = pto.vdup %cst, %271 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %273 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %274 = arith.index_cast %arg8 : i16 to index
          %275 = arith.muli %274, %c512 : index
          %result_9 = pto.vlds %269[%274] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %276 = pto.vdup %result_9, %271 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vmul %272, %276, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %277, %8[%275], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %278 = arith.addi %275, %c64 : index
          pto.vsts %277, %8[%278], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %279 = arith.addi %275, %c128 : index
          pto.vsts %277, %8[%279], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %280 = arith.addi %275, %c192 : index
          pto.vsts %277, %8[%280], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %281 = arith.addi %275, %c256 : index
          pto.vsts %277, %8[%281], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %282 = arith.addi %275, %c320 : index
          pto.vsts %277, %8[%282], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %283 = arith.addi %275, %c384 : index
          pto.vsts %277, %8[%283], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %284 = arith.addi %275, %c448 : index
          pto.vsts %277, %8[%284], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %274 = arith.index_cast %arg8 : i16 to index
          %275 = arith.muli %274, %c512 : index
          %result_9 = pto.vlds %4[%275] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %276 = arith.addi %275, %c64 : index
          %result_10 = pto.vlds %4[%276] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %277 = arith.addi %275, %c128 : index
          %result_11 = pto.vlds %4[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %278 = arith.addi %275, %c192 : index
          %result_12 = pto.vlds %4[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %279 = arith.addi %275, %c256 : index
          %result_13 = pto.vlds %4[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %280 = arith.addi %275, %c320 : index
          %result_14 = pto.vlds %4[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %281 = arith.addi %275, %c384 : index
          %result_15 = pto.vlds %4[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %282 = arith.addi %275, %c448 : index
          %result_16 = pto.vlds %4[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %283 = pto.vadds %result_9, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %284 = pto.vadds %result_10, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %285 = pto.vadds %result_11, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vadds %result_12, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadds %result_13, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.vadds %result_14, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %289 = pto.vadds %result_15, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %290 = pto.vadds %result_16, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %291 = pto.vmaxs %283, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %292 = pto.vmaxs %284, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %293 = pto.vmaxs %285, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %294 = pto.vmaxs %286, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %295 = pto.vmaxs %287, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %296 = pto.vmaxs %288, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %297 = pto.vmaxs %289, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %298 = pto.vmaxs %290, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %299 = pto.vmins %291, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %300 = pto.vmins %292, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %301 = pto.vmins %293, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %302 = pto.vmins %294, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %303 = pto.vmins %295, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %304 = pto.vmins %296, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %305 = pto.vmins %297, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %306 = pto.vmins %298, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %299, %269[%275], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %300, %269[%276], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %301, %269[%277], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %302, %269[%278], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %303, %269[%279], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %304, %269[%280], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %305, %269[%281], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %306, %269[%282], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_17 = pto.vlds %8[%275] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %8[%276] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %8[%277] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %8[%278] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %8[%279] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %8[%280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %8[%281] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %8[%282] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %307 = pto.vsub %result_17, %result_9, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %308 = pto.vsub %result_18, %result_10, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %309 = pto.vsub %result_19, %result_11, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %310 = pto.vsub %result_20, %result_12, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %311 = pto.vsub %result_21, %result_13, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %312 = pto.vsub %result_22, %result_14, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %313 = pto.vsub %result_23, %result_15, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %314 = pto.vsub %result_24, %result_16, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %315 = pto.vmaxs %307, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %316 = pto.vmaxs %308, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %317 = pto.vmaxs %309, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %318 = pto.vmaxs %310, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %319 = pto.vmaxs %311, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %320 = pto.vmaxs %312, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %321 = pto.vmaxs %313, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %322 = pto.vmaxs %314, %cst_1, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %323 = pto.vmins %315, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %324 = pto.vmins %316, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %325 = pto.vmins %317, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %326 = pto.vmins %318, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %327 = pto.vmins %319, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %328 = pto.vmins %320, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %329 = pto.vmins %321, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %330 = pto.vmins %322, %cst, %273 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %331 = pto.vmul %299, %323, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %332 = pto.vmul %300, %324, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %333 = pto.vmul %301, %325, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %334 = pto.vmul %302, %326, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %335 = pto.vmul %303, %327, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %336 = pto.vmul %304, %328, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %337 = pto.vmul %305, %329, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %338 = pto.vmul %306, %330, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %331, %8[%275], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %332, %8[%276], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %333, %8[%277], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %334, %8[%278], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %335, %8[%279], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %336, %8[%280], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %337, %8[%281], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %338, %8[%282], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %339 = pto.vmul %331, %283, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %340 = pto.vmul %332, %284, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %341 = pto.vmul %333, %285, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %342 = pto.vmul %334, %286, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %343 = pto.vmul %335, %287, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %344 = pto.vmul %336, %288, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %345 = pto.vmul %337, %289, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %346 = pto.vmul %338, %290, %271 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %339, %4[%275], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %340, %4[%276], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %341, %4[%277], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %342, %4[%278], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %343, %4[%279], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %344, %4[%280], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %345, %4[%281], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %346, %4[%282], %273 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %12 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c512 : index
          %result = pto.vlds %4[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_5 = pto.vlds %4[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %266, %c128 : index
          %result_6 = pto.vlds %4[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %266, %c192 : index
          %result_7 = pto.vlds %4[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %266, %c256 : index
          %result_8 = pto.vlds %4[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %266, %c320 : index
          %result_9 = pto.vlds %4[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %266, %c384 : index
          %result_10 = pto.vlds %4[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %266, %c448 : index
          %result_11 = pto.vlds %4[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = pto.vadds %result, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vadds %result_5, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vadds %result_6, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vadds %result_7, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vadds %result_8, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vadds %result_9, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vadds %result_10, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vadds %result_11, %cst_3, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %274, %4[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %275, %4[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %4[%268], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %4[%269], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %4[%270], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %4[%271], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %4[%272], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %4[%273], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %13 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
      %14 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %264 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %265 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c512 : index
          %result = pto.vlds %4[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %267, %c64 : index
          %result_5 = pto.vlds %4[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %267, %c128 : index
          %result_6 = pto.vlds %4[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %267, %c192 : index
          %result_7 = pto.vlds %4[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %267, %c256 : index
          %result_8 = pto.vlds %4[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %267, %c320 : index
          %result_9 = pto.vlds %4[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %267, %c384 : index
          %result_10 = pto.vlds %4[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = arith.addi %267, %c448 : index
          %result_11 = pto.vlds %4[%274] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %275 = pto.vcvt %result, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %276 = pto.vcvt %result_5, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %277 = pto.vcvt %result_6, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %278 = pto.vcvt %result_7, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %279 = pto.vcvt %result_8, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %280 = pto.vcvt %result_9, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %281 = pto.vcvt %result_10, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %282 = pto.vcvt %result_11, %264 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %275, %14[%267], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %276, %14[%268], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %277, %14[%269], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %278, %14[%270], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %279, %14[%271], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %280, %14[%272], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %281, %14[%273], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %282, %14[%274], %265 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %15 = pto.addptr %14, %c0 : <i32, ub> -> <i32, ub>
      %16 = pto.addptr %arg2, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %15, %16, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %264 = arith.muli %arg8, %c5 : index
        pto.store_scalar %c1_i32, %arg3[%264] : !pto.ptr<i32, gm>, i32
      }
      scf.for %arg8 = %c1 to %c5 step %c1 {
        %264 = arith.subi %arg8, %c1 : index
        %265 = arith.muli %264, %c128 : index
        %266 = arith.index_cast %265 : index to i64
        %267 = arith.muli %266, %c4_i64 : i64
        %268 = arith.addi %267, %c32_i64 : i64
        %269 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
        pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %270 = pto.castptr %268 : i64 -> !pto.ptr<f32, ub>
          %271 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
          %272 = pto.vbr %cst_4 : f32 -> !pto.vreg<64xf32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %273 = arith.index_cast %arg9 : i16 to index
            %274 = arith.muli %273, %c512 : index
            %275:2 = scf.for %arg10 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg11 = %272, %arg12 = %c128) -> (!pto.vreg<64xf32>, index)  : i16 {
              %277 = arith.index_cast %arg10 : i16 to index
              %278 = arith.index_cast %arg12 : index to i32
              %mask_5, %scalar_out_6 = pto.plt_b32 %278 : i32 -> !pto.mask<b32>, i32
              %279 = arith.index_cast %scalar_out_6 : i32 to index
              %280 = arith.addi %274, %277 : index
              %281 = pto.addptr %270, %280 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %281[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %282 = pto.vcmax %result, %mask_5 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %283 = pto.vsel %282, %arg11, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %284 = pto.vmax %arg11, %283, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.yield %284, %279 : !pto.vreg<64xf32>, index
            }
            %276 = pto.addptr %271, %273 : <f32, ub> -> <f32, ub>
            pto.vsts %275#0, %276[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %270 = pto.tgetval ins(%269, %arg9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
          %271 = arith.fptosi %270 : f32 to i32
          %272 = arith.muli %arg9, %c5 : index
          %273 = arith.addi %272, %arg8 : index
          pto.store_scalar %271, %arg3[%273] : !pto.ptr<i32, gm>, i32
        }
        pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %17 = pto.addptr %arg4, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_gm_to_ubuf %17, %11, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.vecscope {
        %264 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %265 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c128 : index
          %result = pto.vlds %10[%267] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %268 = arith.addi %267, %c64 : index
          %result_5 = pto.vlds %10[%268] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %269 = pto.vcvt %result, %264 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %270 = pto.vcvt %result_5, %264 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %269, %8[%267], %265 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %270, %8[%268], %265 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %266 = arith.index_cast %arg8 : i16 to index
          %267 = arith.muli %266, %c128 : index
          %result = pto.vlds %8[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %267, %c64 : index
          %result_5 = pto.vlds %8[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = pto.vadds %result, %cst, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %270 = pto.vadds %result_5, %cst, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %271 = pto.vmaxs %269, %cst_1, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %272 = pto.vmaxs %270, %cst_1, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %273 = pto.vmins %271, %cst, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %274 = pto.vmins %272, %cst, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vadds %273, %cst_3, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vadds %274, %cst_3, %265 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %275, %8[%267], %265 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %8[%268], %265 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %18 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.vecscope {
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c128 : index
          %result = pto.vlds %8[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_5 = pto.vlds %8[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = pto.vmuls %result, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %269 = pto.vmuls %result_5, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %268, %8[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %269, %8[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %19 = pto.addptr %arg5, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %9, %19, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c2560_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c512 : index
          %result = pto.vlds %4[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_5 = pto.vlds %4[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %266, %c128 : index
          %result_6 = pto.vlds %4[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %266, %c192 : index
          %result_7 = pto.vlds %4[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %266, %c256 : index
          %result_8 = pto.vlds %4[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %266, %c320 : index
          %result_9 = pto.vlds %4[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %266, %c384 : index
          %result_10 = pto.vlds %4[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %266, %c448 : index
          %result_11 = pto.vlds %4[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = pto.vmins %result, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vmins %result_5, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vmins %result_6, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vmins %result_7, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vmins %result_8, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vmins %result_9, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vmins %result_10, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmins %result_11, %cst_1, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %274, %4[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %275, %4[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %4[%268], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %4[%269], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %4[%270], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %4[%271], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %4[%272], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %4[%273], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
      }
      %20 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.vecscope {
        %264 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %265 = arith.index_cast %arg8 : i16 to index
          %266 = arith.muli %265, %c512 : index
          %result = pto.vlds %4[%266] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %267 = arith.addi %266, %c64 : index
          %result_5 = pto.vlds %4[%267] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %268 = arith.addi %266, %c128 : index
          %result_6 = pto.vlds %4[%268] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %269 = arith.addi %266, %c192 : index
          %result_7 = pto.vlds %4[%269] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %270 = arith.addi %266, %c256 : index
          %result_8 = pto.vlds %4[%270] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %271 = arith.addi %266, %c320 : index
          %result_9 = pto.vlds %4[%271] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %272 = arith.addi %266, %c384 : index
          %result_10 = pto.vlds %4[%272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %273 = arith.addi %266, %c448 : index
          %result_11 = pto.vlds %4[%273] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %274 = pto.vmuls %result, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %275 = pto.vmuls %result_5, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %276 = pto.vmuls %result_6, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %277 = pto.vmuls %result_7, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %278 = pto.vmuls %result_8, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %279 = pto.vmuls %result_9, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %280 = pto.vmuls %result_10, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %281 = pto.vmuls %result_11, %cst_2, %264 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %274, %4[%266], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %275, %4[%267], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %276, %4[%268], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %277, %4[%269], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %278, %4[%270], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %279, %4[%271], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %280, %4[%272], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %281, %4[%273], %264 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.barrier <PIPE_MTE3>
      %21 = pto.addptr %arg5, %c128 : <f32, gm> -> <f32, gm>
      %22 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %22, %23, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c2560_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.store_scalar %c0_i32, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      %24 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
      %25 = arith.index_cast %24 : i32 to index
      %26 = arith.cmpi sgt, %25, %c0 : index
      scf.if %26 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c0_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %27 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
      %28 = arith.index_cast %27 : i32 to index
      %29 = arith.cmpi sgt, %28, %c0 : index
      scf.if %29 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c1_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %30 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
      %31 = arith.index_cast %30 : i32 to index
      %32 = arith.cmpi sgt, %31, %c0 : index
      scf.if %32 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c2_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %33 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
      %34 = arith.index_cast %33 : i32 to index
      %35 = arith.cmpi sgt, %34, %c0 : index
      scf.if %35 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c3_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %36 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
      %37 = arith.index_cast %36 : i32 to index
      %38 = arith.cmpi sgt, %37, %c0 : index
      scf.if %38 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c4_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %39 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
      %40 = arith.index_cast %39 : i32 to index
      %41 = arith.cmpi sgt, %40, %c0 : index
      scf.if %41 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c5_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %42 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
      %43 = arith.index_cast %42 : i32 to index
      %44 = arith.cmpi sgt, %43, %c0 : index
      scf.if %44 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c6_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %45 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
      %46 = arith.index_cast %45 : i32 to index
      %47 = arith.cmpi sgt, %46, %c0 : index
      scf.if %47 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c7_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %48 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
      %49 = arith.index_cast %48 : i32 to index
      %50 = arith.cmpi sgt, %49, %c0 : index
      scf.if %50 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c8_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %51 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
      %52 = arith.index_cast %51 : i32 to index
      %53 = arith.cmpi sgt, %52, %c0 : index
      scf.if %53 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c9_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %54 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
      %55 = arith.index_cast %54 : i32 to index
      %56 = arith.cmpi sgt, %55, %c0 : index
      scf.if %56 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c10_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %57 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
      %58 = arith.index_cast %57 : i32 to index
      %59 = arith.cmpi sgt, %58, %c0 : index
      scf.if %59 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c11_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %60 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
      %61 = arith.index_cast %60 : i32 to index
      %62 = arith.cmpi sgt, %61, %c0 : index
      scf.if %62 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c12_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %63 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
      %64 = arith.index_cast %63 : i32 to index
      %65 = arith.cmpi sgt, %64, %c0 : index
      scf.if %65 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c13_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %66 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
      %67 = arith.index_cast %66 : i32 to index
      %68 = arith.cmpi sgt, %67, %c0 : index
      scf.if %68 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c14_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %69 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
      %70 = arith.index_cast %69 : i32 to index
      %71 = arith.cmpi sgt, %70, %c0 : index
      scf.if %71 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c15_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %72 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
      %73 = arith.index_cast %72 : i32 to index
      %74 = arith.cmpi sgt, %73, %c0 : index
      scf.if %74 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c16_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %75 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
      %76 = arith.index_cast %75 : i32 to index
      %77 = arith.cmpi sgt, %76, %c0 : index
      scf.if %77 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c17_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %78 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
      %79 = arith.index_cast %78 : i32 to index
      %80 = arith.cmpi sgt, %79, %c0 : index
      scf.if %80 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c18_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %81 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
      %82 = arith.index_cast %81 : i32 to index
      %83 = arith.cmpi sgt, %82, %c0 : index
      scf.if %83 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c19_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %84 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
      %85 = arith.index_cast %84 : i32 to index
      %86 = arith.cmpi sgt, %85, %c0 : index
      scf.if %86 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c20_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %87 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
      %88 = arith.index_cast %87 : i32 to index
      %89 = arith.cmpi sgt, %88, %c0 : index
      scf.if %89 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c21_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %90 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
      %91 = arith.index_cast %90 : i32 to index
      %92 = arith.cmpi sgt, %91, %c0 : index
      scf.if %92 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c22_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %93 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
      %94 = arith.index_cast %93 : i32 to index
      %95 = arith.cmpi sgt, %94, %c0 : index
      scf.if %95 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c23_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %96 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
      %97 = arith.index_cast %96 : i32 to index
      %98 = arith.cmpi sgt, %97, %c0 : index
      scf.if %98 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c24_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %99 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
      %100 = arith.index_cast %99 : i32 to index
      %101 = arith.cmpi sgt, %100, %c0 : index
      scf.if %101 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c25_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %102 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
      %103 = arith.index_cast %102 : i32 to index
      %104 = arith.cmpi sgt, %103, %c0 : index
      scf.if %104 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c26_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %105 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
      %106 = arith.index_cast %105 : i32 to index
      %107 = arith.cmpi sgt, %106, %c0 : index
      scf.if %107 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c27_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %108 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
      %109 = arith.index_cast %108 : i32 to index
      %110 = arith.cmpi sgt, %109, %c0 : index
      scf.if %110 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c28_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %111 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
      %112 = arith.index_cast %111 : i32 to index
      %113 = arith.cmpi sgt, %112, %c0 : index
      scf.if %113 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c29_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %114 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
      %115 = arith.index_cast %114 : i32 to index
      %116 = arith.cmpi sgt, %115, %c0 : index
      scf.if %116 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c30_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %117 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
      %118 = arith.index_cast %117 : i32 to index
      %119 = arith.cmpi sgt, %118, %c0 : index
      scf.if %119 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c31_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %120 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
      %121 = arith.index_cast %120 : i32 to index
      %122 = arith.cmpi sgt, %121, %c0 : index
      scf.if %122 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c32_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %123 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
      %124 = arith.index_cast %123 : i32 to index
      %125 = arith.cmpi sgt, %124, %c0 : index
      scf.if %125 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c33_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %126 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
      %127 = arith.index_cast %126 : i32 to index
      %128 = arith.cmpi sgt, %127, %c0 : index
      scf.if %128 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c34_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %129 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
      %130 = arith.index_cast %129 : i32 to index
      %131 = arith.cmpi sgt, %130, %c0 : index
      scf.if %131 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c35_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %132 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
      %133 = arith.index_cast %132 : i32 to index
      %134 = arith.cmpi sgt, %133, %c0 : index
      scf.if %134 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c36_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %135 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
      %136 = arith.index_cast %135 : i32 to index
      %137 = arith.cmpi sgt, %136, %c0 : index
      scf.if %137 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c37_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %138 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
      %139 = arith.index_cast %138 : i32 to index
      %140 = arith.cmpi sgt, %139, %c0 : index
      scf.if %140 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c38_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %141 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
      %142 = arith.index_cast %141 : i32 to index
      %143 = arith.cmpi sgt, %142, %c0 : index
      scf.if %143 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c39_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %144 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
      %145 = arith.index_cast %144 : i32 to index
      %146 = arith.cmpi sle, %145, %c0 : index
      scf.if %146 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c0_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %147 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
      %148 = arith.index_cast %147 : i32 to index
      %149 = arith.cmpi sle, %148, %c0 : index
      scf.if %149 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c1_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %150 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
      %151 = arith.index_cast %150 : i32 to index
      %152 = arith.cmpi sle, %151, %c0 : index
      scf.if %152 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c2_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %153 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
      %154 = arith.index_cast %153 : i32 to index
      %155 = arith.cmpi sle, %154, %c0 : index
      scf.if %155 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c3_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %156 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
      %157 = arith.index_cast %156 : i32 to index
      %158 = arith.cmpi sle, %157, %c0 : index
      scf.if %158 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c4_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %159 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
      %160 = arith.index_cast %159 : i32 to index
      %161 = arith.cmpi sle, %160, %c0 : index
      scf.if %161 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c5_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %162 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
      %163 = arith.index_cast %162 : i32 to index
      %164 = arith.cmpi sle, %163, %c0 : index
      scf.if %164 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c6_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %165 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
      %166 = arith.index_cast %165 : i32 to index
      %167 = arith.cmpi sle, %166, %c0 : index
      scf.if %167 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c7_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %168 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
      %169 = arith.index_cast %168 : i32 to index
      %170 = arith.cmpi sle, %169, %c0 : index
      scf.if %170 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c8_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %171 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
      %172 = arith.index_cast %171 : i32 to index
      %173 = arith.cmpi sle, %172, %c0 : index
      scf.if %173 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c9_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %174 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
      %175 = arith.index_cast %174 : i32 to index
      %176 = arith.cmpi sle, %175, %c0 : index
      scf.if %176 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c10_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %177 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
      %178 = arith.index_cast %177 : i32 to index
      %179 = arith.cmpi sle, %178, %c0 : index
      scf.if %179 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c11_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %180 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
      %181 = arith.index_cast %180 : i32 to index
      %182 = arith.cmpi sle, %181, %c0 : index
      scf.if %182 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c12_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %183 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
      %184 = arith.index_cast %183 : i32 to index
      %185 = arith.cmpi sle, %184, %c0 : index
      scf.if %185 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c13_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %186 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
      %187 = arith.index_cast %186 : i32 to index
      %188 = arith.cmpi sle, %187, %c0 : index
      scf.if %188 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c14_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %189 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
      %190 = arith.index_cast %189 : i32 to index
      %191 = arith.cmpi sle, %190, %c0 : index
      scf.if %191 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c15_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %192 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
      %193 = arith.index_cast %192 : i32 to index
      %194 = arith.cmpi sle, %193, %c0 : index
      scf.if %194 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c16_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %195 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
      %196 = arith.index_cast %195 : i32 to index
      %197 = arith.cmpi sle, %196, %c0 : index
      scf.if %197 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c17_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %198 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
      %199 = arith.index_cast %198 : i32 to index
      %200 = arith.cmpi sle, %199, %c0 : index
      scf.if %200 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c18_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %201 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
      %202 = arith.index_cast %201 : i32 to index
      %203 = arith.cmpi sle, %202, %c0 : index
      scf.if %203 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c19_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %204 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
      %205 = arith.index_cast %204 : i32 to index
      %206 = arith.cmpi sle, %205, %c0 : index
      scf.if %206 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c20_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %207 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
      %208 = arith.index_cast %207 : i32 to index
      %209 = arith.cmpi sle, %208, %c0 : index
      scf.if %209 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c21_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %210 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
      %211 = arith.index_cast %210 : i32 to index
      %212 = arith.cmpi sle, %211, %c0 : index
      scf.if %212 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c22_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %213 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
      %214 = arith.index_cast %213 : i32 to index
      %215 = arith.cmpi sle, %214, %c0 : index
      scf.if %215 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c23_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %216 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
      %217 = arith.index_cast %216 : i32 to index
      %218 = arith.cmpi sle, %217, %c0 : index
      scf.if %218 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c24_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %219 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
      %220 = arith.index_cast %219 : i32 to index
      %221 = arith.cmpi sle, %220, %c0 : index
      scf.if %221 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c25_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %222 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
      %223 = arith.index_cast %222 : i32 to index
      %224 = arith.cmpi sle, %223, %c0 : index
      scf.if %224 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c26_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %225 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
      %226 = arith.index_cast %225 : i32 to index
      %227 = arith.cmpi sle, %226, %c0 : index
      scf.if %227 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c27_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %228 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
      %229 = arith.index_cast %228 : i32 to index
      %230 = arith.cmpi sle, %229, %c0 : index
      scf.if %230 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c28_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %231 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
      %232 = arith.index_cast %231 : i32 to index
      %233 = arith.cmpi sle, %232, %c0 : index
      scf.if %233 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c29_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %234 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
      %235 = arith.index_cast %234 : i32 to index
      %236 = arith.cmpi sle, %235, %c0 : index
      scf.if %236 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c30_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %237 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
      %238 = arith.index_cast %237 : i32 to index
      %239 = arith.cmpi sle, %238, %c0 : index
      scf.if %239 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c31_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %240 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
      %241 = arith.index_cast %240 : i32 to index
      %242 = arith.cmpi sle, %241, %c0 : index
      scf.if %242 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c32_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %243 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
      %244 = arith.index_cast %243 : i32 to index
      %245 = arith.cmpi sle, %244, %c0 : index
      scf.if %245 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c33_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %246 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
      %247 = arith.index_cast %246 : i32 to index
      %248 = arith.cmpi sle, %247, %c0 : index
      scf.if %248 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c34_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %249 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
      %250 = arith.index_cast %249 : i32 to index
      %251 = arith.cmpi sle, %250, %c0 : index
      scf.if %251 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c35_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %252 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
      %253 = arith.index_cast %252 : i32 to index
      %254 = arith.cmpi sle, %253, %c0 : index
      scf.if %254 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c36_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %255 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
      %256 = arith.index_cast %255 : i32 to index
      %257 = arith.cmpi sle, %256, %c0 : index
      scf.if %257 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c37_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %258 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
      %259 = arith.index_cast %258 : i32 to index
      %260 = arith.cmpi sle, %259, %c0 : index
      scf.if %260 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c38_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      %261 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
      %262 = arith.index_cast %261 : i32 to index
      %263 = arith.cmpi sle, %262, %c0 : index
      scf.if %263 {
        %264 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
        %265 = arith.index_cast %264 : i32 to index
        pto.store_scalar %c39_i32, %arg7[%265] : !pto.ptr<i32, gm>, i32
        %266 = arith.addi %265, %c1 : index
        %267 = arith.index_cast %266 : index to i32
        pto.store_scalar %267, %arg6[%c0] : !pto.ptr<i32, gm>, i32
      }
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
