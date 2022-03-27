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
    output reg [2:0] customout,
    input customin,
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
  reg [1-1:0] M_sc_exButton;
  sequence_checker_3 sc (
    .clk(clk),
    .rst(rst),
    .buttons(M_sc_buttons),
    .exButton(M_sc_exButton),
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
    customout = 3'h7;
    io_led[0+0+2-:3] = io_button[0+2-:3];
    M_buttoncond_in = io_button[0+2-:3];
    M_buttondetector_in = M_buttoncond_out;
    M_sc_buttons = M_buttondetector_out;
    customout = M_sc_out_result;
    M_sc_exButton = customin;
  end
endmodule
