/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [6:0] seven_seg,
    output reg [2:0] button_a1,
    output reg [2:0] button_b1,
    output reg [2:0] button_b2,
    output reg [2:0] button_c1,
    output reg [2:0] button_c2,
    output reg [2:0] button_c3,
    output reg [2:0] button_d1,
    output reg [2:0] button_d2,
    output reg [2:0] button_d3,
    output reg [2:0] button_d4,
    output reg [2:0] button_e1,
    output reg [2:0] button_e2,
    output reg [2:0] button_e3,
    output reg [2:0] button_e4,
    output reg [2:0] button_e5,
    input ex_button,
    input [14:0] exButtons,
    input button_reset,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [8-1:0] M_seqplustwo_out;
  seq_plus_twoSlow_1 seqplustwo (
    .clk(clk),
    .rst(rst),
    .out(M_seqplustwo_out)
  );
  
  wire [8-1:0] M_seqplusvary_out;
  seq_plus_varySlow_2 seqplusvary (
    .clk(clk),
    .rst(rst),
    .out(M_seqplusvary_out)
  );
  
  wire [3-1:0] M_sc_out_result;
  wire [1-1:0] M_sc_out_buttonseq;
  reg [3-1:0] M_sc_buttons;
  reg [1-1:0] M_sc_button_reset;
  reg [1-1:0] M_sc_exButton;
  reg [15-1:0] M_sc_exButtons;
  sequence_checker_3 sc (
    .clk(clk),
    .rst(rst),
    .buttons(M_sc_buttons),
    .button_reset(M_sc_button_reset),
    .exButton(M_sc_exButton),
    .exButtons(M_sc_exButtons),
    .out_result(M_sc_out_result),
    .out_buttonseq(M_sc_out_buttonseq)
  );
  
  wire [(2'h3+0)-1:0] M_buttoncond_out;
  reg [(2'h3+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<2'h3;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_4 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(2'h3+0)-1:0] M_buttondetector_out;
  reg [(2'h3+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<2'h3;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_5 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [1-1:0] M_resetbuttoncond_out;
  reg [1-1:0] M_resetbuttoncond_in;
  button_conditioner_4 resetbuttoncond (
    .clk(clk),
    .in(M_resetbuttoncond_in),
    .out(M_resetbuttoncond_out)
  );
  
  wire [1-1:0] M_resetbuttondetector_out;
  reg [1-1:0] M_resetbuttondetector_in;
  edge_detector_5 resetbuttondetector (
    .clk(clk),
    .in(M_resetbuttondetector_in),
    .out(M_resetbuttondetector_out)
  );
  
  wire [1-1:0] M_ex_buttoncond_out;
  reg [1-1:0] M_ex_buttoncond_in;
  button_conditioner_4 ex_buttoncond (
    .clk(clk),
    .in(M_ex_buttoncond_in),
    .out(M_ex_buttoncond_out)
  );
  
  wire [1-1:0] M_ex_buttondetector_out;
  reg [1-1:0] M_ex_buttondetector_in;
  edge_detector_5 ex_buttondetector (
    .clk(clk),
    .in(M_ex_buttondetector_in),
    .out(M_ex_buttondetector_out)
  );
  
  wire [(4'hf+0)-1:0] M_total_ex_buttoncond_out;
  reg [(4'hf+0)-1:0] M_total_ex_buttoncond_in;
  
  genvar GEN_total_ex_buttoncond0;
  generate
  for (GEN_total_ex_buttoncond0=0;GEN_total_ex_buttoncond0<4'hf;GEN_total_ex_buttoncond0=GEN_total_ex_buttoncond0+1) begin: total_ex_buttoncond_gen_0
    button_conditioner_4 total_ex_buttoncond (
      .clk(clk),
      .in(M_total_ex_buttoncond_in[GEN_total_ex_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_total_ex_buttoncond_out[GEN_total_ex_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(4'hf+0)-1:0] M_total_ex_buttondetector_out;
  reg [(4'hf+0)-1:0] M_total_ex_buttondetector_in;
  
  genvar GEN_total_ex_buttondetector0;
  generate
  for (GEN_total_ex_buttondetector0=0;GEN_total_ex_buttondetector0<4'hf;GEN_total_ex_buttondetector0=GEN_total_ex_buttondetector0+1) begin: total_ex_buttondetector_gen_0
    edge_detector_5 total_ex_buttondetector (
      .clk(clk),
      .in(M_total_ex_buttondetector_in[GEN_total_ex_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_total_ex_buttondetector_out[GEN_total_ex_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_6 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    io_led[0+0+2-:3] = io_button[0+2-:3];
    M_buttoncond_in = io_button[0+2-:3];
    M_buttondetector_in = M_buttoncond_out;
    M_sc_buttons = M_buttondetector_out;
    button_a1 = M_sc_out_result;
    button_b1 = M_sc_out_result;
    button_b2 = M_sc_out_result;
    button_c1 = M_sc_out_result;
    button_c2 = M_sc_out_result;
    button_c3 = M_sc_out_result;
    button_d1 = M_sc_out_result;
    button_d2 = M_sc_out_result;
    button_d3 = M_sc_out_result;
    button_d4 = M_sc_out_result;
    button_e1 = M_sc_out_result;
    button_e2 = M_sc_out_result;
    button_e3 = M_sc_out_result;
    button_e4 = M_sc_out_result;
    button_e5 = M_sc_out_result;
    seven_seg = M_sc_out_result;
    M_resetbuttoncond_in = button_reset;
    M_resetbuttondetector_in = M_resetbuttoncond_out;
    M_sc_button_reset = M_resetbuttondetector_out;
    M_ex_buttoncond_in = ex_button;
    M_ex_buttondetector_in = M_ex_buttoncond_out;
    M_sc_exButton = M_ex_buttondetector_out;
    M_total_ex_buttoncond_in = exButtons;
    M_total_ex_buttondetector_in = M_total_ex_buttoncond_out;
    M_sc_exButtons = M_total_ex_buttondetector_out;
  end
endmodule
