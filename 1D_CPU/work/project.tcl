set projDir "C:/Users/Razer/Documents/alchitry/1D_CPU/work/vivado"
set projName "1D_CPU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/au_top_0.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/matrix_writer_1.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/matrix_ram_writer_2.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/matrix_ram_3.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/decoder_4.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/reset_conditioner_5.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/edge_detector_6.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/sigma_cpu_7.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/counter_8.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/simple_dual_ram_9.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/bin_to_dec_10.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/decoder_11.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/seven_seg_12.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/edge_detector_13.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/button_conditioner_14.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/alu_15.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/regfile_16.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/data_mem_17.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/pc_unit_18.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/counter_19.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/cu_20.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/inst_mem_21.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/data_rom_22.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/pipeline_23.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/pn_gen_24.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/adder_25.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/bool_26.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/bitshift_27.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/compare_28.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/alex_encoder_29.v" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/verilog/simple_ram_30.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" "C:/Users/Razer/Documents/alchitry/1D_CPU/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
