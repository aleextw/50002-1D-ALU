/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module regfile_8 (
    input clk,
    input [4:0] ra1,
    input [4:0] ra2,
    input we,
    input [15:0] wd,
    input [4:0] wa,
    input [15:0] buttons,
    input ia,
    output reg [15:0] rd1,
    output reg [15:0] rd2,
    output reg [15:0] lvl,
    output reg [15:0] peg,
    output reg [15:0] pegsel,
    output reg [15:0] val_op,
    output reg [15:0] sel_but
  );
  
  
  
  reg [511:0] M_r_d, M_r_q = 1'h0;
  
  wire [5-1:0] M_button_encoder_out;
  reg [16-1:0] M_button_encoder_in;
  alex_encoder_23 button_encoder (
    .in(M_button_encoder_in),
    .out(M_button_encoder_out)
  );
  
  always @* begin
    M_r_d = M_r_q;
    
    M_button_encoder_in = buttons;
    if (M_button_encoder_out != 1'h0) begin
      M_r_d[352+15-:16] = M_button_encoder_out;
    end
    if (wa != 5'h1f & we) begin
      M_r_d[(wa)*16+15-:16] = wd;
    end
    if (ra1 != 5'h1f) begin
      rd1 = M_r_q[(ra1)*16+15-:16];
    end else begin
      rd1 = 16'h0000;
    end
    if (ra2 != 5'h1f) begin
      rd2 = M_r_q[(ra2)*16+15-:16];
    end else begin
      rd2 = 16'h0000;
    end
    lvl = M_r_q[416+15-:16];
    peg = M_r_q[384+15-:16];
    pegsel = M_r_q[368+15-:16];
    val_op = M_r_q[400+15-:16];
    sel_but = M_r_q[0+15-:16];
  end
  
  always @(posedge clk) begin
    M_r_q <= M_r_d;
  end
  
endmodule
