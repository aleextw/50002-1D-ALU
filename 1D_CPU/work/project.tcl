set projDir "C:/Users/Razer/Desktop/sigma-master/work/vivado"
set projName "sigma"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Razer/Desktop/sigma-master/work/verilog/au_top_0.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/inst_mem_1.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/data_rom_2.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/seven_seg_3.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/decoder_4.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/button_conditioner_5.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/edge_detector_6.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/reset_conditioner_7.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/edge_detector_8.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/data_mem_9.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/sigma_10.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/counter_11.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/pipeline_12.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/simple_ram_13.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/cu_14.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/alu_15.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/regfile_16.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/pc_unit_17.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/pn_gen_18.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/adder_19.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/bool_20.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/bitshift_21.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/compare_22.v" "C:/Users/Razer/Desktop/sigma-master/work/verilog/alex_encoder_23.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Razer/Desktop/sigma-master/work/constraint/custom.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
