set projDir "C:/Users/Razer/Documents/alchitry/1D_CPU/work/vivado"
set projName "1D_CPU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/au_top_0.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/bin_to_dec_1.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/decoder_2.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/seven_seg_3.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/reset_conditioner_4.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/edge_detector_5.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/button_conditioner_6.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/alu_7.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/regfile_8.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/data_mem_9.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/pc_unit_10.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/edge_detector_11.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/counter_12.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/counter_13.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/cu_14.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/inst_mem_15.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/data_rom_16.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/pipeline_17.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/pn_gen_18.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/adder_19.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/bool_20.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/bitshift_21.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/compare_22.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/alex_encoder_23.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/simple_ram_24.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Razer/Documents/alchitry/1D_CPU/work/constraint/alchitry.xdc" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
