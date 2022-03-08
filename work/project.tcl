set projDir "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/vivado"
set projName "1D ALU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/au_top_0.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/alu_1.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/answer_rom_2.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/bin_to_dec_3.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/reset_conditioner_4.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/button_conditioner_5.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/answer_fsm_6.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/multi_seven_seg_7.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/counter_8.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/sixteen_bit_adder_9.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/mult_10.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/bool_11.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/bitshift_12.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/compare_13.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/pipeline_14.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/counter_15.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/seven_seg_16.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/decoder_17.v" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/verilog/one_bit_adder_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/constraint/alchitry.xdc" "C:/Users/Razer/Documents/alchitry/1D\ ALU/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
import_ip -srcset [get_filesets sources_1] [list "C:/Users/Razer/Documents/alchitry/1D\ ALU/cores/mig_7series_0/mig_7series_0.xci"]
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
