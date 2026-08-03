module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @topk(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c512_i16 = arith.constant 512 : i16
      %c2048_i16 = arith.constant 2048 : i16
      %c64_i16 = arith.constant 64 : i16
      %c4096_i16 = arith.constant 4096 : i16
      %c0_i16 = arith.constant 0 : i16
      %c4032 = arith.constant 4032 : index
      %c3968 = arith.constant 3968 : index
      %c3904 = arith.constant 3904 : index
      %c3840 = arith.constant 3840 : index
      %c3776 = arith.constant 3776 : index
      %c3712 = arith.constant 3712 : index
      %c3648 = arith.constant 3648 : index
      %c3584 = arith.constant 3584 : index
      %c3520 = arith.constant 3520 : index
      %c3456 = arith.constant 3456 : index
      %c3392 = arith.constant 3392 : index
      %c3328 = arith.constant 3328 : index
      %c3264 = arith.constant 3264 : index
      %c3200 = arith.constant 3200 : index
      %c3136 = arith.constant 3136 : index
      %c3008 = arith.constant 3008 : index
      %c2944 = arith.constant 2944 : index
      %c2880 = arith.constant 2880 : index
      %c2816 = arith.constant 2816 : index
      %c2752 = arith.constant 2752 : index
      %c2688 = arith.constant 2688 : index
      %c2624 = arith.constant 2624 : index
      %c2560 = arith.constant 2560 : index
      %c2496 = arith.constant 2496 : index
      %c2432 = arith.constant 2432 : index
      %c2368 = arith.constant 2368 : index
      %c2304 = arith.constant 2304 : index
      %c2240 = arith.constant 2240 : index
      %c2176 = arith.constant 2176 : index
      %c2112 = arith.constant 2112 : index
      %c1984 = arith.constant 1984 : index
      %c1920 = arith.constant 1920 : index
      %c1856 = arith.constant 1856 : index
      %c1792 = arith.constant 1792 : index
      %c1728 = arith.constant 1728 : index
      %c1664 = arith.constant 1664 : index
      %c1600 = arith.constant 1600 : index
      %c1536 = arith.constant 1536 : index
      %c1472 = arith.constant 1472 : index
      %c1408 = arith.constant 1408 : index
      %c1344 = arith.constant 1344 : index
      %c1280 = arith.constant 1280 : index
      %c1216 = arith.constant 1216 : index
      %c1152 = arith.constant 1152 : index
      %c1088 = arith.constant 1088 : index
      %c960 = arith.constant 960 : index
      %c896 = arith.constant 896 : index
      %c832 = arith.constant 832 : index
      %c704 = arith.constant 704 : index
      %c640 = arith.constant 640 : index
      %c576 = arith.constant 576 : index
      %c448 = arith.constant 448 : index
      %c384 = arith.constant 384 : index
      %c320 = arith.constant 320 : index
      %c16384_i64 = arith.constant 16384 : i64
      %c1_i32 = arith.constant 1 : i32
      %c2048_i64 = arith.constant 2048 : i64
      %c1_i64 = arith.constant 1 : i64
      %c769_i64 = arith.constant 769 : i64
      %c3842_i64 = arith.constant 3842 : i64
      %c3072 = arith.constant 3072 : index
      %c144117387132666368_i64 = arith.constant 144117387132666368 : i64
      %c33554944_i64 = arith.constant 33554944 : i64
      %c4096_i32 = arith.constant 4096 : i32
      %c3848_i64 = arith.constant 3848 : i64
      %c768 = arith.constant 768 : index
      %c36029346783166592_i64 = arith.constant 36029346783166592 : i64
      %c1024 = arith.constant 1024 : index
      %c3872_i64 = arith.constant 3872 : i64
      %c192 = arith.constant 192 : index
      %c128 = arith.constant 128 : index
      %c9007336695791648_i64 = arith.constant 9007336695791648 : i64
      %c256 = arith.constant 256 : index
      %c0_i32 = arith.constant 0 : i32
      %cst = arith.constant -3.40282347E+38 : f32
      %c-1_i32 = arith.constant -1 : i32
      %false = arith.constant false
      %c49152_i64 = arith.constant 49152 : i64
      %c512 = arith.constant 512 : index
      %c2048 = arith.constant 2048 : index
      %c0_i64 = arith.constant 0 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %17 = scf.for %arg6 = %c0_i16 to %c4096_i16 step %c64_i16 iter_args(%arg7 = %c4096) -> (index)  : i16 {
          %18 = arith.index_cast %arg6 : i16 to index
          %19 = arith.index_cast %arg7 : index to i32
          %mask, %scalar_out = pto.plt_b32 %19 : i32 -> !pto.mask<b32>, i32
          %20 = arith.index_cast %scalar_out : i32 to index
          %21 = pto.vdup %c-1_i32, %mask : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
          %22 = pto.addptr %0, %18 : <i32, ub> -> <i32, ub>
          pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          scf.yield %20 : index
        }
      }
      %1 = arith.index_cast %arg4 : i32 to index
      %2 = arith.muli %1, %c4096 : index
      %3 = pto.addptr %arg0, %2 : <i32, gm> -> <i32, gm>
      %4 = pto.addptr %0, %c0 : <i32, ub> -> <i32, ub>
      %5 = pto.addptr %3, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %4, %5, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      %6 = arith.divsi %1, %c2 : index
      %7 = pto.load_scalar %arg1[%6] : !pto.ptr<i32, gm> -> i32
      %8 = arith.index_cast %7 : i32 to index
      %9 = arith.divsi %8, %c4 : index
      %10 = pto.load_scalar %arg2[%1] : !pto.ptr<i32, gm> -> i32
      %11 = arith.index_cast %10 : i32 to index
      %12 = arith.addi %11, %c1 : index
      %13 = arith.divsi %12, %c4 : index
      %14 = arith.minsi %9, %13 : index
      %15 = arith.minsi %14, %c4096 : index
      %16 = arith.cmpi sgt, %15, %c0 : index
      scf.if %16 {
        %17 = pto.addptr %arg3, %2 : <f32, gm> -> <f32, gm>
        %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %19 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        %20 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
        pto.copy_gm_to_ubuf %19, %20, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %21 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c4096_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg6 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %41 = arith.index_cast %arg6 : i16 to index
            %42 = pto.addptr %18, %41 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %40 = scf.for %arg6 = %c0_i16 to %c4096_i16 step %c64_i16 iter_args(%arg7 = %c4096) -> (index)  : i16 {
            %41 = arith.index_cast %arg6 : i16 to index
            %42 = arith.index_cast %arg7 : index to i32
            %mask_0, %scalar_out_1 = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
            %43 = arith.index_cast %scalar_out_1 : i32 to index
            %44 = pto.vdup %cst, %mask_0 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.addptr %21, %41 : <f32, ub> -> <f32, ub>
            pto.vsts %44, %45[%c0], %mask_0 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %43 : index
          }
        }
        %22 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>
        pto.vecscope {
          %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %18[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %18[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %18[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %18[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %18[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %18[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %18[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %18[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %18[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %18[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %18[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %18[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %18[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %18[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %18[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %18[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %18[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %18[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %18[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %18[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %18[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %18[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %18[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %18[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %18[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %18[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %18[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %18[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %18[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %18[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %18[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %18[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %18[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %18[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %18[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %18[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %18[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %18[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %18[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %18[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %18[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %18[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_42 = pto.vlds %18[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_43 = pto.vlds %18[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_44 = pto.vlds %18[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_45 = pto.vlds %18[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_46 = pto.vlds %18[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_47 = pto.vlds %18[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_48 = pto.vlds %18[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_49 = pto.vlds %18[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_50 = pto.vlds %18[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_51 = pto.vlds %18[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_52 = pto.vlds %18[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_53 = pto.vlds %18[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_54 = pto.vlds %18[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_55 = pto.vlds %18[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_56 = pto.vlds %18[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_57 = pto.vlds %18[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_58 = pto.vlds %18[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_59 = pto.vlds %18[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_60 = pto.vlds %18[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_61 = pto.vlds %18[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_62 = pto.vlds %18[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_63 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_64 = pto.vlds %21[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_65 = pto.vlds %21[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_66 = pto.vlds %21[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_67 = pto.vlds %21[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_68 = pto.vlds %21[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_69 = pto.vlds %21[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_70 = pto.vlds %21[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_71 = pto.vlds %21[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_72 = pto.vlds %21[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_73 = pto.vlds %21[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_74 = pto.vlds %21[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_75 = pto.vlds %21[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_76 = pto.vlds %21[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_77 = pto.vlds %21[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_78 = pto.vlds %21[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_79 = pto.vlds %21[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_80 = pto.vlds %21[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_81 = pto.vlds %21[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_82 = pto.vlds %21[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_83 = pto.vlds %21[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_84 = pto.vlds %21[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_85 = pto.vlds %21[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_86 = pto.vlds %21[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_87 = pto.vlds %21[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_88 = pto.vlds %21[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_89 = pto.vlds %21[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_90 = pto.vlds %21[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_91 = pto.vlds %21[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_92 = pto.vlds %21[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_93 = pto.vlds %21[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_94 = pto.vlds %21[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_95 = pto.vlds %21[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_96 = pto.vlds %21[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_97 = pto.vlds %21[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_98 = pto.vlds %21[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_99 = pto.vlds %21[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_100 = pto.vlds %21[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_101 = pto.vlds %21[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_102 = pto.vlds %21[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_103 = pto.vlds %21[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_104 = pto.vlds %21[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_105 = pto.vlds %21[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_106 = pto.vlds %21[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_107 = pto.vlds %21[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_108 = pto.vlds %21[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_109 = pto.vlds %21[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_110 = pto.vlds %21[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_111 = pto.vlds %21[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_112 = pto.vlds %21[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_113 = pto.vlds %21[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_114 = pto.vlds %21[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_115 = pto.vlds %21[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_116 = pto.vlds %21[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_117 = pto.vlds %21[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_118 = pto.vlds %21[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_119 = pto.vlds %21[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_120 = pto.vlds %21[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_121 = pto.vlds %21[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_122 = pto.vlds %21[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_123 = pto.vlds %21[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_124 = pto.vlds %21[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_125 = pto.vlds %21[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_126 = pto.vlds %21[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.vmax %result, %result_63, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmax %result_0, %result_64, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vmax %result_1, %result_65, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmax %result_2, %result_66, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmax %result_3, %result_67, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vmax %result_4, %result_68, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmax %result_5, %result_69, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmax %result_6, %result_70, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vmax %result_7, %result_71, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmax %result_8, %result_72, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmax %result_9, %result_73, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vmax %result_10, %result_74, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vmax %result_11, %result_75, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vmax %result_12, %result_76, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vmax %result_13, %result_77, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vmax %result_14, %result_78, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vmax %result_15, %result_79, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vmax %result_16, %result_80, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vmax %result_17, %result_81, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vmax %result_18, %result_82, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vmax %result_19, %result_83, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vmax %result_20, %result_84, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vmax %result_21, %result_85, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vmax %result_22, %result_86, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vmax %result_23, %result_87, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vmax %result_24, %result_88, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vmax %result_25, %result_89, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vmax %result_26, %result_90, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vmax %result_27, %result_91, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vmax %result_28, %result_92, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vmax %result_29, %result_93, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vmax %result_30, %result_94, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %result_31, %result_95, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vmax %result_32, %result_96, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vmax %result_33, %result_97, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vmax %result_34, %result_98, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vmax %result_35, %result_99, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vmax %result_36, %result_100, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vmax %result_37, %result_101, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vmax %result_38, %result_102, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.vmax %result_39, %result_103, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vmax %result_40, %result_104, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vmax %result_41, %result_105, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.vmax %result_42, %result_106, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %86 = pto.vmax %result_43, %result_107, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vmax %result_44, %result_108, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.vmax %result_45, %result_109, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %89 = pto.vmax %result_46, %result_110, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %90 = pto.vmax %result_47, %result_111, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = pto.vmax %result_48, %result_112, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %92 = pto.vmax %result_49, %result_113, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vmax %result_50, %result_114, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmax %result_51, %result_115, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.vmax %result_52, %result_116, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %96 = pto.vmax %result_53, %result_117, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %97 = pto.vmax %result_54, %result_118, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %98 = pto.vmax %result_55, %result_119, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %99 = pto.vmax %result_56, %result_120, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %100 = pto.vmax %result_57, %result_121, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.vmax %result_58, %result_122, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %102 = pto.vmax %result_59, %result_123, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %103 = pto.vmax %result_60, %result_124, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %104 = pto.vmax %result_61, %result_125, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %105 = pto.vmax %result_62, %result_126, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %21[%c0], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %21[%c64], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %21[%c128], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %21[%c192], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %21[%c256], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %21[%c320], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %21[%c384], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %21[%c448], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %21[%c512], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %21[%c576], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %21[%c640], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %21[%c704], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %21[%c768], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %55, %21[%c832], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %56, %21[%c896], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %57, %21[%c960], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %58, %21[%c1024], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %59, %21[%c1088], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %60, %21[%c1152], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %21[%c1216], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %62, %21[%c1280], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %63, %21[%c1344], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %64, %21[%c1408], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %65, %21[%c1472], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %66, %21[%c1536], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %67, %21[%c1600], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %68, %21[%c1664], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %69, %21[%c1728], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %70, %21[%c1792], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %71, %21[%c1856], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %72, %21[%c1920], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %73, %21[%c1984], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %74, %21[%c2048], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %75, %21[%c2112], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %76, %21[%c2176], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %77, %21[%c2240], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %78, %21[%c2304], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %79, %21[%c2368], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %80, %21[%c2432], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %81, %21[%c2496], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %82, %21[%c2560], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %83, %21[%c2624], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %84, %21[%c2688], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %85, %21[%c2752], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %86, %21[%c2816], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %87, %21[%c2880], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %88, %21[%c2944], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %89, %21[%c3008], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %90, %21[%c3072], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %91, %21[%c3136], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %92, %21[%c3200], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %21[%c3264], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %94, %21[%c3328], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %95, %21[%c3392], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %96, %21[%c3456], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %97, %21[%c3520], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %98, %21[%c3584], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %99, %21[%c3648], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %100, %21[%c3712], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %101, %21[%c3776], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %102, %21[%c3840], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %103, %21[%c3904], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %104, %21[%c3968], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %105, %21[%c4032], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %23 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<ui32, ub>
        scf.for %arg6 = %c0 to %c4096 step %c1 {
          %40 = arith.index_cast %arg6 : index to i32
          %41 = builtin.unrealized_conversion_cast %40 : i32 to ui32
          pto.store %41, %23[%arg6] : !pto.ptr<ui32, ub>, ui32
        } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
        %24 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
        %25 = pto.addptr %23, %c0 : <ui32, ub> -> <ui32, ub>
        pto.vbitsort %20, %24, %25, %c128 : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<ui32, ub>, index
        %26 = pto.addptr %18, %c64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %27 = pto.addptr %18, %c128 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %28 = pto.addptr %18, %c192 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        pto.vmrgsort4 %21, %18, %26, %27, %28, %c9007336695791648_i64, %c3872_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %29 = pto.addptr %21, %c256 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %30 = pto.addptr %21, %c512 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %31 = pto.addptr %21, %c768 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        pto.vmrgsort4 %18, %21, %29, %30, %31, %c36029346783166592_i64, %c3848_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %32 = pto.addptr %18, %c1024 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %33 = pto.addptr %18, %c2048 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        %34 = pto.addptr %18, %c3072 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : <f32, ub> -> <f32, ub>
        pto.vmrgsort4 %21, %18, %32, %33, %34, %c144117387132666368_i64, %c3842_i64 {pto.tilelib.candidate = "template_tmrgsort_single_list", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %35 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
        %36 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<f32, ub>
        pto.vmrgsort4 %35, %21, %36, %21, %21, %c33554944_i64, %c769_i64 {pto.tilelib.candidate = "template_tmrgsort_multi_list2", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"} : !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, !pto.ptr<f32, ub>, i64, i64
        %37 = arith.minsi %15, %c512 : index
        pto.vecscope {
          %40 = scf.for %arg6 = %c0_i16 to %c2048_i16 step %c64_i16 iter_args(%arg7 = %c2048) -> (index)  : i16 {
            %44 = arith.index_cast %arg6 : i16 to index
            %45 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %45 : i32 -> !pto.mask<b32>, i32
            %46 = arith.index_cast %scalar_out : i32 to index
            %47 = pto.addptr %35, %44 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = pto.addptr %18, %44 : <f32, ub> -> <f32, ub>
            pto.vsts %result, %48[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %46 : index
          } {pto.tilelib.candidate = "template_tmrgsort_multi_list2", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmrgsort"}
          %41 = pto.vci %c0_i32 {order = "ASC", pto.tilelib.candidate = "template_tgather_mask", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tgather"} : i32 -> !pto.vreg<64xi32>
          %42 = scf.for %arg6 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg7 = %c512) -> (index)  : i16 {
            %44 = arith.index_cast %arg6 : i16 to index
            %45 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %45 : i32 -> !pto.mask<b32>, i32
            %46 = arith.index_cast %scalar_out : i32 to index
            %47 = arith.index_cast %44 : index to i32
            %48 = pto.vadds %41, %47, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            %49 = pto.vadd %48, %48, %mask : !pto.vreg<64xi32>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %50 = pto.vadds %49, %c1_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            %51 = pto.vgather2 %35, %50, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vbitcast %51 : !pto.vreg<64xf32> -> !pto.vreg<64xi32>
            %53 = pto.addptr %0, %44 : <i32, ub> -> <i32, ub>
            pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            scf.yield %46 : index
          }
          %43 = scf.for %arg6 = %c0 to %37 step %c64 iter_args(%arg7 = %37) -> (index) {
            %44 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %44 : i32 -> !pto.mask<b32>, i32
            %45 = arith.index_cast %scalar_out : i32 to index
            %46 = pto.addptr %0, %arg6 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %46[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %47 = pto.vadds %result, %c0_i32, %mask : !pto.vreg<64xi32>, i32, !pto.mask<b32> -> !pto.vreg<64xi32>
            pto.vsts %47, %46[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            scf.yield %45 : index
          }
        }
        %38 = arith.muli %37, %c4 {pto.tilelib.candidate = "template_tstore_nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tstore"} : index
        %39 = arith.index_cast %38 : index to i64
        pto.copy_ubuf_to_gm %4, %5, %c0_i64, %c1_i64, %39, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

