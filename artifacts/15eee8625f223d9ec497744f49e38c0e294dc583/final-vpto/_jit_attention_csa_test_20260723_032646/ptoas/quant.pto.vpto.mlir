module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c1024_i16 = arith.constant 1024 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c1024 = arith.constant 1024 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %cst_0 = arith.constant 1.270000e+02 : f32
      %cst_1 = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c65536 = arith.constant 65536 : index
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c128 = arith.constant 128 : index
      %c128_i32 = arith.constant 128 : i32
      %c1024_i32 = arith.constant 1024 : i32
      %c255_i16 = arith.constant 255 : i16
      %c4096_i64 = arith.constant 4096 : i64
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c8_i32 = arith.constant 8 : i32
      %c64 = arith.constant 64 : index
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
      %c2048 = arith.constant 2048 : index
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
      %c3072 = arith.constant 3072 : index
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
      %c4096 = arith.constant 4096 : index
      %c4160 = arith.constant 4160 : index
      %c4224 = arith.constant 4224 : index
      %c4288 = arith.constant 4288 : index
      %c4352 = arith.constant 4352 : index
      %c4416 = arith.constant 4416 : index
      %c4480 = arith.constant 4480 : index
      %c4544 = arith.constant 4544 : index
      %c4608 = arith.constant 4608 : index
      %c4672 = arith.constant 4672 : index
      %c4736 = arith.constant 4736 : index
      %c4800 = arith.constant 4800 : index
      %c4864 = arith.constant 4864 : index
      %c4928 = arith.constant 4928 : index
      %c4992 = arith.constant 4992 : index
      %c5056 = arith.constant 5056 : index
      %c5120 = arith.constant 5120 : index
      %c5184 = arith.constant 5184 : index
      %c5248 = arith.constant 5248 : index
      %c5312 = arith.constant 5312 : index
      %c5376 = arith.constant 5376 : index
      %c5440 = arith.constant 5440 : index
      %c5504 = arith.constant 5504 : index
      %c5568 = arith.constant 5568 : index
      %c5632 = arith.constant 5632 : index
      %c5696 = arith.constant 5696 : index
      %c5760 = arith.constant 5760 : index
      %c5824 = arith.constant 5824 : index
      %c5888 = arith.constant 5888 : index
      %c5952 = arith.constant 5952 : index
      %c6016 = arith.constant 6016 : index
      %c6080 = arith.constant 6080 : index
      %c6144 = arith.constant 6144 : index
      %c6208 = arith.constant 6208 : index
      %c6272 = arith.constant 6272 : index
      %c6336 = arith.constant 6336 : index
      %c6400 = arith.constant 6400 : index
      %c6464 = arith.constant 6464 : index
      %c6528 = arith.constant 6528 : index
      %c6592 = arith.constant 6592 : index
      %c6656 = arith.constant 6656 : index
      %c6720 = arith.constant 6720 : index
      %c6784 = arith.constant 6784 : index
      %c6848 = arith.constant 6848 : index
      %c6912 = arith.constant 6912 : index
      %c6976 = arith.constant 6976 : index
      %c7040 = arith.constant 7040 : index
      %c7104 = arith.constant 7104 : index
      %c7168 = arith.constant 7168 : index
      %c7232 = arith.constant 7232 : index
      %c7296 = arith.constant 7296 : index
      %c7360 = arith.constant 7360 : index
      %c7424 = arith.constant 7424 : index
      %c7488 = arith.constant 7488 : index
      %c7552 = arith.constant 7552 : index
      %c7616 = arith.constant 7616 : index
      %c7680 = arith.constant 7680 : index
      %c7744 = arith.constant 7744 : index
      %c7808 = arith.constant 7808 : index
      %c7872 = arith.constant 7872 : index
      %c7936 = arith.constant 7936 : index
      %c8000 = arith.constant 8000 : index
      %c8064 = arith.constant 8064 : index
      %c8128 = arith.constant 8128 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c4 = arith.constant 4 : index
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %0 = pto.addptr %arg2, %arg3 : <f32, gm> -> <f32, gm>
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %0, %c0 : <f32, gm> -> <f32, gm>
      %3 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %4 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %159 = arith.index_cast %arg5 : i16 to index
          %160 = arith.muli %159, %c1024 : index
          %result_135 = pto.vlds %1[%160] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %161 = arith.addi %160, %c64 : index
          %result_136 = pto.vlds %1[%161] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %162 = arith.addi %160, %c128 : index
          %result_137 = pto.vlds %1[%162] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %163 = arith.addi %160, %c192 : index
          %result_138 = pto.vlds %1[%163] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %164 = arith.addi %160, %c256 : index
          %result_139 = pto.vlds %1[%164] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %165 = arith.addi %160, %c320 : index
          %result_140 = pto.vlds %1[%165] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %166 = arith.addi %160, %c384 : index
          %result_141 = pto.vlds %1[%166] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %167 = arith.addi %160, %c448 : index
          %result_142 = pto.vlds %1[%167] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %168 = arith.addi %160, %c512 : index
          %result_143 = pto.vlds %1[%168] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %169 = arith.addi %160, %c576 : index
          %result_144 = pto.vlds %1[%169] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %170 = arith.addi %160, %c640 : index
          %result_145 = pto.vlds %1[%170] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %171 = arith.addi %160, %c704 : index
          %result_146 = pto.vlds %1[%171] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %172 = arith.addi %160, %c768 : index
          %result_147 = pto.vlds %1[%172] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %173 = arith.addi %160, %c832 : index
          %result_148 = pto.vlds %1[%173] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %174 = arith.addi %160, %c896 : index
          %result_149 = pto.vlds %1[%174] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %175 = arith.addi %160, %c960 : index
          %result_150 = pto.vlds %1[%175] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %176 = pto.vabs %result_135, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %177 = pto.vabs %result_136, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %178 = pto.vabs %result_137, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %179 = pto.vabs %result_138, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %180 = pto.vabs %result_139, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %181 = pto.vabs %result_140, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %182 = pto.vabs %result_141, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %183 = pto.vabs %result_142, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %184 = pto.vabs %result_143, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %185 = pto.vabs %result_144, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %186 = pto.vabs %result_145, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %187 = pto.vabs %result_146, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %188 = pto.vabs %result_147, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %189 = pto.vabs %result_148, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %190 = pto.vabs %result_149, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %191 = pto.vabs %result_150, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %176, %1[%160], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %177, %1[%161], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %178, %1[%162], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %179, %1[%163], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %180, %1[%164], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %181, %1[%165], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %182, %1[%166], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %183, %1[%167], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %184, %1[%168], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %185, %1[%169], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %186, %1[%170], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %187, %1[%171], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %188, %1[%172], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %189, %1[%173], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %190, %1[%174], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %191, %1[%175], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tabs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %21 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %1[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %1[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_5 = pto.vlds %1[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %1[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_7 = pto.vlds %1[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_8 = pto.vlds %1[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_9 = pto.vlds %1[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_10 = pto.vlds %1[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_11 = pto.vlds %1[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_12 = pto.vlds %1[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_13 = pto.vlds %1[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_14 = pto.vlds %1[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_15 = pto.vlds %1[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_16 = pto.vlds %1[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_17 = pto.vlds %1[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_18 = pto.vlds %1[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_19 = pto.vlds %1[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_20 = pto.vlds %1[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_21 = pto.vlds %1[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_22 = pto.vlds %1[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_23 = pto.vlds %1[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_24 = pto.vlds %1[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_25 = pto.vlds %1[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_26 = pto.vlds %1[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_27 = pto.vlds %1[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_28 = pto.vlds %1[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_29 = pto.vlds %1[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_30 = pto.vlds %1[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_31 = pto.vlds %1[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_32 = pto.vlds %1[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_33 = pto.vlds %1[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_34 = pto.vlds %1[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_35 = pto.vlds %1[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_36 = pto.vlds %1[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_37 = pto.vlds %1[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_38 = pto.vlds %1[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_39 = pto.vlds %1[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_40 = pto.vlds %1[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_41 = pto.vlds %1[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_42 = pto.vlds %1[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_43 = pto.vlds %1[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_44 = pto.vlds %1[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_45 = pto.vlds %1[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_46 = pto.vlds %1[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_47 = pto.vlds %1[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_48 = pto.vlds %1[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_49 = pto.vlds %1[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_50 = pto.vlds %1[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_51 = pto.vlds %1[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_52 = pto.vlds %1[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_53 = pto.vlds %1[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_54 = pto.vlds %1[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_55 = pto.vlds %1[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_56 = pto.vlds %1[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_57 = pto.vlds %1[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_58 = pto.vlds %1[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_59 = pto.vlds %1[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_60 = pto.vlds %1[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_61 = pto.vlds %1[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_62 = pto.vlds %1[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_63 = pto.vlds %1[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_64 = pto.vlds %1[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_65 = pto.vlds %1[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_66 = pto.vlds %1[%c4096] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_67 = pto.vlds %1[%c4160] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_68 = pto.vlds %1[%c4224] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_69 = pto.vlds %1[%c4288] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_70 = pto.vlds %1[%c4352] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_71 = pto.vlds %1[%c4416] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_72 = pto.vlds %1[%c4480] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_73 = pto.vlds %1[%c4544] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_74 = pto.vlds %1[%c4608] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_75 = pto.vlds %1[%c4672] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_76 = pto.vlds %1[%c4736] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_77 = pto.vlds %1[%c4800] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_78 = pto.vlds %1[%c4864] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_79 = pto.vlds %1[%c4928] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_80 = pto.vlds %1[%c4992] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_81 = pto.vlds %1[%c5056] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_82 = pto.vlds %1[%c5120] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_83 = pto.vlds %1[%c5184] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_84 = pto.vlds %1[%c5248] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_85 = pto.vlds %1[%c5312] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_86 = pto.vlds %1[%c5376] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_87 = pto.vlds %1[%c5440] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_88 = pto.vlds %1[%c5504] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_89 = pto.vlds %1[%c5568] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_90 = pto.vlds %1[%c5632] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_91 = pto.vlds %1[%c5696] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_92 = pto.vlds %1[%c5760] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_93 = pto.vlds %1[%c5824] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_94 = pto.vlds %1[%c5888] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_95 = pto.vlds %1[%c5952] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_96 = pto.vlds %1[%c6016] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_97 = pto.vlds %1[%c6080] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_98 = pto.vlds %1[%c6144] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_99 = pto.vlds %1[%c6208] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_100 = pto.vlds %1[%c6272] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_101 = pto.vlds %1[%c6336] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_102 = pto.vlds %1[%c6400] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_103 = pto.vlds %1[%c6464] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_104 = pto.vlds %1[%c6528] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_105 = pto.vlds %1[%c6592] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_106 = pto.vlds %1[%c6656] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_107 = pto.vlds %1[%c6720] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_108 = pto.vlds %1[%c6784] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_109 = pto.vlds %1[%c6848] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_110 = pto.vlds %1[%c6912] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_111 = pto.vlds %1[%c6976] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_112 = pto.vlds %1[%c7040] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_113 = pto.vlds %1[%c7104] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_114 = pto.vlds %1[%c7168] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_115 = pto.vlds %1[%c7232] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_116 = pto.vlds %1[%c7296] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_117 = pto.vlds %1[%c7360] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_118 = pto.vlds %1[%c7424] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_119 = pto.vlds %1[%c7488] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_120 = pto.vlds %1[%c7552] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_121 = pto.vlds %1[%c7616] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_122 = pto.vlds %1[%c7680] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_123 = pto.vlds %1[%c7744] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_124 = pto.vlds %1[%c7808] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_125 = pto.vlds %1[%c7872] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_126 = pto.vlds %1[%c7936] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_127 = pto.vlds %1[%c8000] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_128 = pto.vlds %1[%c8064] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_129 = pto.vlds %1[%c8128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.vmax %result, %result_3, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.vmax %22, %result_4, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vmax %23, %result_5, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.vmax %24, %result_6, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.vmax %25, %result_7, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.vmax %26, %result_8, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %28 = pto.vmax %27, %result_9, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.vmax %28, %result_10, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.vmax %29, %result_11, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.vmax %30, %result_12, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.vmax %31, %result_13, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %33 = pto.vmax %32, %result_14, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.vmax %33, %result_15, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.vmax %34, %result_16, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vmax %35, %result_17, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vcmax %36, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.vmax %result_18, %result_19, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vmax %38, %result_20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %40 = pto.vmax %39, %result_21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %41 = pto.vmax %40, %result_22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %42 = pto.vmax %41, %result_23, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %43 = pto.vmax %42, %result_24, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.vmax %43, %result_25, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %45 = pto.vmax %44, %result_26, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %46 = pto.vmax %45, %result_27, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.vmax %46, %result_28, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %48 = pto.vmax %47, %result_29, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.vmax %48, %result_30, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.vmax %49, %result_31, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %51 = pto.vmax %50, %result_32, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %52 = pto.vmax %51, %result_33, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %53 = pto.vcmax %52, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %54 = pto.vmax %result_34, %result_35, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %55 = pto.vmax %54, %result_36, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %56 = pto.vmax %55, %result_37, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %57 = pto.vmax %56, %result_38, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %58 = pto.vmax %57, %result_39, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %59 = pto.vmax %58, %result_40, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %60 = pto.vmax %59, %result_41, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %61 = pto.vmax %60, %result_42, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %62 = pto.vmax %61, %result_43, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %63 = pto.vmax %62, %result_44, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %64 = pto.vmax %63, %result_45, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %65 = pto.vmax %64, %result_46, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %66 = pto.vmax %65, %result_47, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %67 = pto.vmax %66, %result_48, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %68 = pto.vmax %67, %result_49, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %69 = pto.vcmax %68, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %70 = pto.vmax %result_50, %result_51, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %71 = pto.vmax %70, %result_52, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %72 = pto.vmax %71, %result_53, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %73 = pto.vmax %72, %result_54, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %74 = pto.vmax %73, %result_55, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %75 = pto.vmax %74, %result_56, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %76 = pto.vmax %75, %result_57, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %77 = pto.vmax %76, %result_58, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %78 = pto.vmax %77, %result_59, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %79 = pto.vmax %78, %result_60, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %80 = pto.vmax %79, %result_61, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %81 = pto.vmax %80, %result_62, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %82 = pto.vmax %81, %result_63, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %83 = pto.vmax %82, %result_64, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %84 = pto.vmax %83, %result_65, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %85 = pto.vcmax %84, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %86 = pto.vmax %result_66, %result_67, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %87 = pto.vmax %86, %result_68, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %88 = pto.vmax %87, %result_69, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %89 = pto.vmax %88, %result_70, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %90 = pto.vmax %89, %result_71, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %91 = pto.vmax %90, %result_72, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %92 = pto.vmax %91, %result_73, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %93 = pto.vmax %92, %result_74, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %94 = pto.vmax %93, %result_75, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %95 = pto.vmax %94, %result_76, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %96 = pto.vmax %95, %result_77, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %97 = pto.vmax %96, %result_78, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %98 = pto.vmax %97, %result_79, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %99 = pto.vmax %98, %result_80, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %100 = pto.vmax %99, %result_81, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %101 = pto.vcmax %100, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %102 = pto.vmax %result_82, %result_83, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %103 = pto.vmax %102, %result_84, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %104 = pto.vmax %103, %result_85, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %105 = pto.vmax %104, %result_86, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %106 = pto.vmax %105, %result_87, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %107 = pto.vmax %106, %result_88, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %108 = pto.vmax %107, %result_89, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %109 = pto.vmax %108, %result_90, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %110 = pto.vmax %109, %result_91, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %111 = pto.vmax %110, %result_92, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %112 = pto.vmax %111, %result_93, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %113 = pto.vmax %112, %result_94, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %114 = pto.vmax %113, %result_95, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %115 = pto.vmax %114, %result_96, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %116 = pto.vmax %115, %result_97, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %117 = pto.vcmax %116, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %118 = pto.vmax %result_98, %result_99, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %119 = pto.vmax %118, %result_100, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %120 = pto.vmax %119, %result_101, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %121 = pto.vmax %120, %result_102, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %122 = pto.vmax %121, %result_103, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %123 = pto.vmax %122, %result_104, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %124 = pto.vmax %123, %result_105, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %125 = pto.vmax %124, %result_106, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %126 = pto.vmax %125, %result_107, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %127 = pto.vmax %126, %result_108, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %128 = pto.vmax %127, %result_109, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %129 = pto.vmax %128, %result_110, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %130 = pto.vmax %129, %result_111, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %131 = pto.vmax %130, %result_112, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %132 = pto.vmax %131, %result_113, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %133 = pto.vcmax %132, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %134 = pto.vmax %result_114, %result_115, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %135 = pto.vmax %134, %result_116, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %136 = pto.vmax %135, %result_117, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %137 = pto.vmax %136, %result_118, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %138 = pto.vmax %137, %result_119, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %139 = pto.vmax %138, %result_120, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %140 = pto.vmax %139, %result_121, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %141 = pto.vmax %140, %result_122, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %142 = pto.vmax %141, %result_123, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %143 = pto.vmax %142, %result_124, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %144 = pto.vmax %143, %result_125, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %145 = pto.vmax %144, %result_126, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %146 = pto.vmax %145, %result_127, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %147 = pto.vmax %146, %result_128, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %148 = pto.vmax %147, %result_129, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %149 = pto.vcmax %148, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %150 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        pto.vsts %37, %21[%c0], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %53, %21[%c1], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %69, %21[%c2], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %85, %21[%c3], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %101, %21[%c4], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %117, %21[%c5], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %133, %21[%c6], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %149, %21[%c7], %150 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %151 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %151, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_130 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %152 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
        %result_131 = pto.vlds %152[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %153 = pto.vmax %result_130, %result_131, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %153, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %154 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %155 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %154, %155[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_132 = pto.vlds %155[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_133 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %156 = pto.vdiv %result_132, %result_133, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %156, %155[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_134 = pto.vlds %155[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %157 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %158 = pto.vdiv %157, %result_134, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %158, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %5 = arith.muli %arg4, %c8 : index
      %6 = pto.addptr %arg0, %5 : <f32, gm> -> <f32, gm>
      %7 = pto.addptr %6, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %7, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %result = pto.vlds %4[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vdup %result, %19 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = arith.muli %21, %c1024 : index
          %result_3 = pto.vlds %1[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %23, %c64 : index
          %result_4 = pto.vlds %1[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %23, %c128 : index
          %result_5 = pto.vlds %1[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %23, %c192 : index
          %result_6 = pto.vlds %1[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %23, %c256 : index
          %result_7 = pto.vlds %1[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %23, %c320 : index
          %result_8 = pto.vlds %1[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %23, %c384 : index
          %result_9 = pto.vlds %1[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %23, %c448 : index
          %result_10 = pto.vlds %1[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %23, %c512 : index
          %result_11 = pto.vlds %1[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %23, %c576 : index
          %result_12 = pto.vlds %1[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %23, %c640 : index
          %result_13 = pto.vlds %1[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.addi %23, %c704 : index
          %result_14 = pto.vlds %1[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = arith.addi %23, %c768 : index
          %result_15 = pto.vlds %1[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = arith.addi %23, %c832 : index
          %result_16 = pto.vlds %1[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = arith.addi %23, %c896 : index
          %result_17 = pto.vlds %1[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = arith.addi %23, %c960 : index
          %result_18 = pto.vlds %1[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_3, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_4, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_5, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_6, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_7, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result_8, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_9, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result_10, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_11, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmul %result_12, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_13, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result_14, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result_15, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_16, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result_17, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result_18, %22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %1[%23], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %1[%24], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %1[%25], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %1[%26], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %1[%27], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %1[%28], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %1[%29], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %1[%30], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %1[%31], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %1[%32], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %1[%33], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %1[%34], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %1[%35], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %1[%36], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %1[%37], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %1[%38], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c1024 : index
          %result = pto.vlds %1[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %22, %c64 : index
          %result_3 = pto.vlds %1[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %22, %c128 : index
          %result_4 = pto.vlds %1[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %22, %c192 : index
          %result_5 = pto.vlds %1[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %22, %c256 : index
          %result_6 = pto.vlds %1[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %22, %c320 : index
          %result_7 = pto.vlds %1[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %22, %c384 : index
          %result_8 = pto.vlds %1[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %22, %c448 : index
          %result_9 = pto.vlds %1[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %22, %c512 : index
          %result_10 = pto.vlds %1[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %22, %c576 : index
          %result_11 = pto.vlds %1[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %22, %c640 : index
          %result_12 = pto.vlds %1[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %22, %c704 : index
          %result_13 = pto.vlds %1[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.addi %22, %c768 : index
          %result_14 = pto.vlds %1[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = arith.addi %22, %c832 : index
          %result_15 = pto.vlds %1[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = arith.addi %22, %c896 : index
          %result_16 = pto.vlds %1[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = arith.addi %22, %c960 : index
          %result_17 = pto.vlds %1[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %39 = pto.vcvt %result_3, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %40 = pto.vcvt %result_4, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %41 = pto.vcvt %result_5, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %42 = pto.vcvt %result_6, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %43 = pto.vcvt %result_7, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %44 = pto.vcvt %result_8, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %45 = pto.vcvt %result_9, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %46 = pto.vcvt %result_10, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %47 = pto.vcvt %result_11, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %48 = pto.vcvt %result_12, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %49 = pto.vcvt %result_13, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %50 = pto.vcvt %result_14, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %51 = pto.vcvt %result_15, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %52 = pto.vcvt %result_16, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %53 = pto.vcvt %result_17, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %38, %8[%22], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %39, %8[%23], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %40, %8[%24], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %41, %8[%25], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %42, %8[%26], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %43, %8[%27], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %44, %8[%28], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %45, %8[%29], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %46, %8[%30], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %47, %8[%31], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %48, %8[%32], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %49, %8[%33], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %50, %8[%34], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %51, %8[%35], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %52, %8[%36], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %53, %8[%37], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %9 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1024xf16, valid=?x?>
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f16, ub>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c1024 : index
          %result = pto.vlds %8[%25] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %26 = arith.addi %25, %c64 : index
          %result_5 = pto.vlds %8[%26] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %27 = arith.addi %25, %c128 : index
          %result_6 = pto.vlds %8[%27] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %28 = arith.addi %25, %c192 : index
          %result_7 = pto.vlds %8[%28] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %29 = arith.addi %25, %c256 : index
          %result_8 = pto.vlds %8[%29] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = arith.addi %25, %c320 : index
          %result_9 = pto.vlds %8[%30] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = arith.addi %25, %c384 : index
          %result_10 = pto.vlds %8[%31] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %32 = arith.addi %25, %c448 : index
          %result_11 = pto.vlds %8[%32] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %33 = arith.addi %25, %c512 : index
          %result_12 = pto.vlds %8[%33] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %34 = arith.addi %25, %c576 : index
          %result_13 = pto.vlds %8[%34] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %35 = arith.addi %25, %c640 : index
          %result_14 = pto.vlds %8[%35] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %36 = arith.addi %25, %c704 : index
          %result_15 = pto.vlds %8[%36] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %37 = arith.addi %25, %c768 : index
          %result_16 = pto.vlds %8[%37] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = arith.addi %25, %c832 : index
          %result_17 = pto.vlds %8[%38] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %39 = arith.addi %25, %c896 : index
          %result_18 = pto.vlds %8[%39] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = arith.addi %25, %c960 : index
          %result_19 = pto.vlds %8[%40] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %41 = pto.vcvt %result, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcvt %result_5, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcvt %result_6, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcvt %result_7, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcvt %result_8, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result_9, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vcvt %result_10, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcvt %result_11, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcvt %result_12, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vcvt %result_13, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result_14, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result_15, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcvt %result_16, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result_17, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vcvt %result_18, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vcvt %result_19, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vcvt %41, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %58 = pto.vcvt %42, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %59 = pto.vcvt %43, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %60 = pto.vcvt %44, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %61 = pto.vcvt %45, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %62 = pto.vcvt %46, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %63 = pto.vcvt %47, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %64 = pto.vcvt %48, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %65 = pto.vcvt %49, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %66 = pto.vcvt %50, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %67 = pto.vcvt %51, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %68 = pto.vcvt %52, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %69 = pto.vcvt %53, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %70 = pto.vcvt %54, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %71 = pto.vcvt %55, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %72 = pto.vcvt %56, %19 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          pto.vsts %57, %10[%25], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %58, %10[%26], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %59, %10[%27], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %60, %10[%28], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %61, %10[%29], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %62, %10[%30], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %63, %10[%31], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %64, %10[%32], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %65, %10[%33], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %66, %10[%34], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %67, %10[%35], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %68, %10[%36], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %69, %10[%37], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %70, %10[%38], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %71, %10[%39], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %72, %10[%40], %20 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %21 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %mask_3, %scalar_out_4 = pto.plt_b16 %c1024_i32 : i32 -> !pto.mask<b16>, i32
        %22 = pto.vdup %c255_i16, %21 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %23 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c1024 : index
          scf.for %arg6 = %c0_i16 to %c1024_i16 step %c128_i16  : i16 {
            %26 = arith.index_cast %arg6 : i16 to index
            %27 = arith.addi %25, %26 : index
            %28 = pto.addptr %10, %27 : <f16, ub> -> <f16, ub>
            %result = pto.vlds %28[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
            %29 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %30 = pto.vand %29, %22, %mask_3 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %31 = pto.vcvt %30, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
            %32 = pto.vcvt %31, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
            %33 = pto.addptr %23, %27 : <i8, ub> -> <i8, ub>
            pto.vsts %32, %33[%c0], %mask_3 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
          }
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
      %12 = pto.addptr %arg1, %arg3 : <i8, gm> -> <i8, gm>
      %13 = pto.addptr %11, %c0 : <i8, ub> -> <i8, ub>
      %14 = pto.addptr %12, %c0 : <i8, gm> -> <i8, gm>
      pto.copy_ubuf_to_gm %13, %14, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1024xf16, valid=?x?>
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %19 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %20 = pto.vdup %cst_1, %19 : f16, !pto.mask<b16> -> !pto.vreg<128xf16>
        %21 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c1024 : index
          pto.vsts %20, %10[%25], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %26 = arith.addi %25, %c128 : index
          pto.vsts %20, %10[%26], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %27 = arith.addi %25, %c256 : index
          pto.vsts %20, %10[%27], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %28 = arith.addi %25, %c384 : index
          pto.vsts %20, %10[%28], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %29 = arith.addi %25, %c512 : index
          pto.vsts %20, %10[%29], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %30 = arith.addi %25, %c640 : index
          pto.vsts %20, %10[%30], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %31 = arith.addi %25, %c768 : index
          pto.vsts %20, %10[%31], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
          %32 = arith.addi %25, %c896 : index
          pto.vsts %20, %10[%32], %21 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "vmi_texpands_f16", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %mask_3, %scalar_out_4 = pto.plt_b16 %c1024_i32 : i32 -> !pto.mask<b16>, i32
        %22 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %23 = pto.vdup %c255_i16, %22 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c1024 : index
          scf.for %arg6 = %c0_i16 to %c1024_i16 step %c128_i16  : i16 {
            %26 = arith.index_cast %arg6 : i16 to index
            %27 = arith.addi %25, %26 : index
            %28 = pto.addptr %10, %27 : <f16, ub> -> <f16, ub>
            %result = pto.vlds %28[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
            %29 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %30 = pto.vand %29, %23, %mask_3 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %31 = pto.vcvt %30, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
            %32 = pto.vcvt %31, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
            %33 = pto.addptr %11, %27 : <i8, ub> -> <i8, ub>
            pto.vsts %32, %33[%c0], %mask_3 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
          }
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
      %16 = arith.addi %arg3, %c65536 : index
      %17 = pto.addptr %arg1, %16 : <i8, gm> -> <i8, gm>
      %18 = pto.addptr %17, %c0 : <i8, gm> -> <i8, gm>
      pto.copy_ubuf_to_gm %13, %18, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
