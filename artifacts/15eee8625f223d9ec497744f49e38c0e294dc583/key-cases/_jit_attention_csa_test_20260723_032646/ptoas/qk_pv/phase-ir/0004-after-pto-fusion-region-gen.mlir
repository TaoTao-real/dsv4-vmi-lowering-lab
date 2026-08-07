// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @qk_pv_aic(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<bf16, gm>, %arg8: !pto.ptr<i32, gm>, %arg9: !pto.ptr<i32, gm>, %arg10: !pto.ptr<bf16, gm>, %arg11: !pto.ptr<bf16, gm>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
  %c240 = arith.constant 240 : index
  %c160 = arith.constant 160 : index
  %c80 = arith.constant 80 : index
  %c262144 = arith.constant 262144 : index
  %c2097152 = arith.constant 2097152 : index
  %c8388608 = arith.constant 8388608 : index
  %c1024 = arith.constant 1024 : index
  %c5120 = arith.constant 5120 : index
  %c1310720 = arith.constant 1310720 : index
  %c65536_i64 = arith.constant 65536 : i64
  %c196608_i64 = arith.constant 196608 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c2560 = arith.constant 2560 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c40 = arith.constant 40 : index
  %c8 = arith.constant 8 : index
  %c640 = arith.constant 640 : index
  %c5 = arith.constant 5 : index
  %c128 = arith.constant 128 : index
  %c16384 = arith.constant 16384 : index
  %c4 = arith.constant 4 : index
  %c32 = arith.constant 32 : index
  %c4096 = arith.constant 4096 : index
  %c23 = arith.constant 23 : index
  %c24 = arith.constant 24 : index
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %c320 = arith.constant 320 : index
  %c64 = arith.constant 64 : index
  %c256 = arith.constant 256 : index
  %c16 = arith.constant 16 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c2560, %c1], strides = [%c2560, %c2560, %c2560, %c1, %c2560] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c2560, %c1], strides = [%c2560, %c2560, %c2560, %c1, %c2560] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c2560, %c512], strides = [%c1310720, %c1310720, %c1310720, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c40], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8, %c640], strides = [%c5120, %c5120, %c5120, %c640, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8, %c5], strides = [%c40, %c40, %c40, %c5, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c8, %c128], strides = [%c1024, %c1024, %c1024, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c16384, %c512], strides = [%c8388608, %c8388608, %c8388608, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %8 = pto.make_tensor_view %arg8, shape = [%c1, %c1, %c1, %c8, %c512], strides = [%c4096, %c4096, %c4096, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %9 = pto.make_tensor_view %arg9, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %10 = pto.make_tensor_view %arg10, shape = [%c1, %c1, %c1, %c4096, %c512], strides = [%c2097152, %c2097152, %c2097152, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %11 = pto.make_tensor_view %arg11, shape = [%c1, %c1, %c1, %c512, %c512], strides = [%c262144, %c262144, %c262144, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %12 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
  %13 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
  %14 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
  %15 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
  %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
  %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
  %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
  %19 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
  %20 = pto.reserve_buffer{name = "qk_pv_v2c_slot_buffer", size = 65536, location = <mat>, auto = false, base = 0} -> i32
  %21 = pto.import_reserved_buffer{name = "qk_pv_c2v_slot_buffer", peer_func = @qk_pv_aiv} -> i32
  %22 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, nosplit = true} (%21 : i32, %20 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %23 = arith.index_cast %arg12 : i32 to index
  %24 = arith.subi %c23, %23 : index
  %25 = arith.addi %24, %c40 : index
  %26 = arith.divsi %25, %c24 : index
  scf.for %arg14 = %c0 to %26 step %c1 {
    %27 = arith.muli %arg14, %c24 : index
    %28 = arith.addi %23, %27 : index
    %29 = pto.load_scalar %arg3[%28] : !pto.ptr<i32, gm> -> i32
    %30 = arith.index_cast %29 : i32 to index
    %31 = arith.divsi %30, %c5 : index
    %32 = arith.muli %31, %c5 : index
    %33 = arith.subi %30, %32 : index
    %34 = arith.divsi %31, %c2 : index
    %35 = arith.muli %31, %c320 : index
    %36 = arith.muli %33, %c128 : index
    %37 = arith.muli %31, %c5 : index
    %38 = arith.addi %37, %33 : index
    %39 = pto.load_scalar %arg5[%38] : !pto.ptr<i32, gm> -> i32
    %40 = arith.index_cast %39 : i32 to index
    %41 = arith.cmpi sgt, %40, %c0 : index
    scf.if %41 {
      %42 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
      scf.for %arg15 = %c0 to %c128 step %c1 {
        %81 = arith.addi %36, %arg15 : index
        %82 = arith.cmpi slt, %81, %c128 : index
        scf.if %82 {
          %83 = arith.muli %31, %c128 : index
          %84 = arith.addi %83, %81 : index
          %85 = pto.load_scalar %arg6[%84] : !pto.ptr<i32, gm> -> i32
          %86 = arith.index_cast %85 : i32 to index
          %87 = arith.cmpi sge, %86, %c0 : index
          scf.if %87 {
            %88 = arith.index_cast %85 : i32 to index
            %89 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            %90 = pto.subview %89[%arg15, %c0] sizes [16, 512] valid [%c1, %c512] : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major> -> !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>
            %91 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %88, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
            pto.tload ins(%91 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%90 : !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          } else {
            %88 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            %89 = pto.subview %88[%arg15, %c0] sizes [16, 512] valid [%c1, %c512] : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major> -> !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>
            %90 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
            pto.tload ins(%90 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%89 : !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          }
        } else {
          %83 = arith.subi %81, %c128 : index
          %84 = arith.cmpi slt, %83, %c512 : index
          scf.if %84 {
            %85 = arith.muli %31, %c512 : index
            %86 = arith.addi %85, %83 : index
            %87 = pto.load_scalar %arg8[%86] : !pto.ptr<i32, gm> -> i32
            %88 = arith.index_cast %87 : i32 to index
            %89 = arith.cmpi sge, %88, %c0 : index
            scf.if %89 {
              %90 = arith.index_cast %87 : i32 to index
              %91 = arith.divsi %90, %c128 : index
              %92 = arith.muli %34, %c32 : index
              %93 = arith.addi %92, %91 : index
              %94 = pto.load_scalar %arg9[%93] : !pto.ptr<i32, gm> -> i32
              %95 = arith.index_cast %94 : i32 to index
              %96 = arith.muli %95, %c128 : index
              %97 = arith.index_cast %87 : i32 to index
              %98 = arith.remsi %97, %c128 : index
              %99 = arith.addi %96, %98 : index
              %100 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
              %101 = pto.subview %100[%arg15, %c0] sizes [16, 512] valid [%c1, %c512] : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major> -> !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>
              %102 = pto.partition_view %10, offsets = [%c0, %c0, %c0, %99, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
              pto.tload ins(%102 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%101 : !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            } else {
              %90 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
              %91 = pto.subview %90[%arg15, %c0] sizes [16, 512] valid [%c1, %c512] : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major> -> !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>
              %92 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
              pto.tload ins(%92 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%91 : !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            }
          } else {
            %85 = pto.alloc_tile addr = %c65536_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            %86 = pto.subview %85[%arg15, %c0] sizes [16, 512] valid [%c1, %c512] : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major> -> !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>
            %87 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
            pto.tload ins(%87 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%86 : !pto.tile_buf<mat, 16x512xbf16, valid=1x512, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          }
        }
      }
      %43 = arith.muli %31, %c64 : index
      %44 = pto.alloc_tile addr = %c196608_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
      %45 = pto.partition_view %11, offsets = [%c0, %c0, %c0, %43, %c0], sizes = [%c1, %c1, %c1, %c32, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x32x512xbf16>) outs(%44 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.alloc_tile addr = %c65536_i64 valid_row = %c512 valid_col = %c128 : !pto.tile_buf<mat, 512x128xbf16, valid=?x?, slayout=col_major>
      %47 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      scf.for %arg15 = %c0 to %c512 step %c256 {
        %81 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.textract ins(%44, %c0, %arg15 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%81 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %82 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>
        pto.textract ins(%46, %arg15, %c0 : !pto.tile_buf<mat, 512x128xbf16, valid=?x?, slayout=col_major>, index, index) outs(%82 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %83 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        %84 = arith.addi %arg15, %c128 : index
        pto.textract ins(%44, %c0, %84 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%83 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %85 = pto.alloc_tile addr = %c32768_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>
        %86 = arith.addi %arg15, %c128 : index
        pto.textract ins(%46, %86, %c0 : !pto.tile_buf<mat, 512x128xbf16, valid=?x?, slayout=col_major>, index, index) outs(%85 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %87 = arith.cmpi eq, %arg15, %c0 : index
        scf.if %87 {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul ins(%81, %82 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        } else {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul.acc ins(%89, %81, %82 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        }
        %88 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.tmatmul.acc ins(%88, %83, %85 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) outs(%88 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
      pto.tpush(%47, %22 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
      %48 = arith.muli %31, %c64 : index
      %49 = arith.addi %48, %c32 : index
      %50 = pto.alloc_tile addr = %c196608_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>
      %51 = pto.partition_view %11, offsets = [%c0, %c0, %c0, %49, %c0], sizes = [%c1, %c1, %c1, %c32, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%51 : !pto.partition_tensor_view<1x1x1x32x512xbf16>) outs(%50 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %52 = pto.alloc_tile addr = %c65536_i64 valid_row = %c512 valid_col = %c128 : !pto.tile_buf<mat, 512x128xbf16, valid=?x?, slayout=col_major>
      %53 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      scf.for %arg15 = %c0 to %c512 step %c256 {
        %81 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.textract ins(%50, %c0, %arg15 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%81 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %82 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>
        pto.textract ins(%52, %arg15, %c0 : !pto.tile_buf<mat, 512x128xbf16, valid=?x?, slayout=col_major>, index, index) outs(%82 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %83 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        %84 = arith.addi %arg15, %c128 : index
        pto.textract ins(%50, %c0, %84 : !pto.tile_buf<mat, 32x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%83 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %85 = pto.alloc_tile addr = %c32768_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>
        %86 = arith.addi %arg15, %c128 : index
        pto.textract ins(%52, %86, %c0 : !pto.tile_buf<mat, 512x128xbf16, valid=?x?, slayout=col_major>, index, index) outs(%85 : !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 4 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right_trans", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right", "transpose"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %87 = arith.cmpi eq, %arg15, %c0 : index
        scf.if %87 {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul ins(%81, %82 : !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        } else {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul.acc ins(%89, %81, %82 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        }
        %88 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.tmatmul.acc ins(%88, %83, %85 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x128xbf16, valid=?x?, slayout=col_major>) outs(%88 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
      pto.tpush(%53, %22 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
      %54 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %55 = pto.declare_tile -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
      pto.tpop(%55, %22 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
      scf.for %arg15 = %c0 to %c128 step %c64 {
        %81 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.textract ins(%55, %c0, %arg15 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%81 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %82 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>
        pto.textract ins(%42, %arg15, %c0 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%82 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %83 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        %84 = arith.addi %arg15, %c32 : index
        pto.textract ins(%55, %c0, %84 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%83 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %85 = pto.alloc_tile addr = %c32768_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>
        %86 = arith.addi %arg15, %c32 : index
        pto.textract ins(%42, %86, %c0 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%85 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %87 = arith.cmpi eq, %arg15, %c0 : index
        scf.if %87 {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul ins(%81, %82 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        } else {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul.acc ins(%89, %81, %82 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        }
        %88 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.tmatmul.acc ins(%88, %83, %85 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) outs(%88 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
      pto.tfree(%22 : !pto.pipe) {split = 0}
      %56 = arith.muli %33, %c16 : index
      %57 = arith.addi %35, %56 : index
      %58 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<acc, 16x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %59 = pto.subview %54[%c0, %c0] sizes [16, 512] : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024> -> !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>
      %60 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %57, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%59 : !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>) outs(%60 : !pto.partition_tensor_view<1x1x1x16x512xf32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %61 = arith.addi %35, %c80 : index
      %62 = arith.muli %33, %c16 : index
      %63 = arith.addi %61, %62 : index
      %64 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<acc, 16x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %65 = pto.subview %54[%c16, %c0] sizes [16, 512] : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024> -> !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>
      %66 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %63, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%65 : !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>) outs(%66 : !pto.partition_tensor_view<1x1x1x16x512xf32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %68 = pto.declare_tile -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
      pto.tpop(%68, %22 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
      scf.for %arg15 = %c0 to %c128 step %c64 {
        %81 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.textract ins(%68, %c0, %arg15 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%81 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %82 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>
        pto.textract ins(%42, %arg15, %c0 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%82 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %83 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        %84 = arith.addi %arg15, %c32 : index
        pto.textract ins(%68, %c0, %84 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%83 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_textract_mat2left", postupdate = 0 : i64, tags = ["move", "extract", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %85 = pto.alloc_tile addr = %c32768_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>
        %86 = arith.addi %arg15, %c32 : index
        pto.textract ins(%42, %86, %c0 : !pto.tile_buf<mat, 128x512xbf16, valid=?x?, blayout=col_major, slayout=row_major>, index, index) outs(%85 : !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_textract_mat2right", postupdate = 0 : i64, tags = ["move", "extract", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %87 = arith.cmpi eq, %arg15, %c0 : index
        scf.if %87 {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul ins(%81, %82 : !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        } else {
          %89 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tmatmul.acc ins(%89, %81, %82 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) outs(%89 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        }
        %88 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c512 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.tmatmul.acc ins(%88, %83, %85 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 32x32xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 32x512xbf16, valid=?x?, slayout=col_major>) outs(%88 : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
      pto.tfree(%22 : !pto.pipe) {split = 0}
      %69 = arith.addi %35, %c160 : index
      %70 = arith.muli %33, %c16 : index
      %71 = arith.addi %69, %70 : index
      %72 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<acc, 16x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %73 = pto.subview %67[%c0, %c0] sizes [16, 512] : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024> -> !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>
      %74 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %71, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%73 : !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>) outs(%74 : !pto.partition_tensor_view<1x1x1x16x512xf32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %75 = arith.addi %35, %c240 : index
      %76 = arith.muli %33, %c16 : index
      %77 = arith.addi %75, %76 : index
      %78 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<acc, 16x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %79 = pto.subview %67[%c16, %c0] sizes [16, 512] : !pto.tile_buf<acc, 32x512xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024> -> !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>
      %80 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %77, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%79 : !pto.tile_buf<acc, 16x512xf32, blayout=col_major, slayout=row_major, fractal=1024>) outs(%80 : !pto.partition_tensor_view<1x1x1x16x512xf32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  return
}
