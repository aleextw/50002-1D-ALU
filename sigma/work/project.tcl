set projDir "C:/Users/user-windows/Desktop/sigma/work/vivado"
set projName "sigma"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/user-windows/Desktop/sigma/work/verilog/au_top_0.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/inst_mem_1.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/data_rom_2.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/bin_to_dec_3.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/decoder_4.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/seven_seg_5.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/decoder_6.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/edge_detector_7.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/button_conditioner_8.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/reset_conditioner_9.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/edge_detector_10.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/data_mem_11.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/sigma_12.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/matrix_writer_13.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/matrix_ram_writer_14.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/matrix_ram_15.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/counter_16.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/counter_17.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/counter_18.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/counter_19.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/counter_20.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/pipeline_21.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/simple_ram_22.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/cu_23.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/alu_24.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/regfile_25.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/pc_unit_26.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/simple_dual_ram_27.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/pn_gen_28.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/adder_29.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/bool_30.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/bitshift_31.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/compare_32.v" "C:/Users/user-windows/Desktop/sigma/work/verilog/alex_encoder_33.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/user-windows/Desktop/sigma/work/constraint/custom.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 2
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
