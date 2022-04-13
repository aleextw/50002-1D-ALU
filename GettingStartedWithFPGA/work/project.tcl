set projDir "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/vivado"
set projName "GettingStartedWithFPGA"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/au_top_0.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/seq_plus_twoSlow_1.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/seq_plus_varySlow_2.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/sequence_checker_3.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/button_conditioner_4.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/edge_detector_5.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/reset_conditioner_6.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/eight_bit_adder_7.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/counter_8.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/counter_9.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/pipeline_10.v" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/verilog/full_adder_11.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/work/constraint/custom.xdc" "C:/Users/Siyang/OneDrive/Documents/Alchitry/GettingStartedWithFPGA/constraint/newAu.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
