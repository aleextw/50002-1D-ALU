/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seq_plus_twoSlow_1 (
    input clk,
    input rst,
    output reg [7:0] out
  );
  
  
  
  reg [7:0] M_register_1_d, M_register_1_q = 1'h0;
  
  wire [8-1:0] M_plus_two_s;
  wire [1-1:0] M_plus_two_cout;
  reg [8-1:0] M_plus_two_x;
  reg [8-1:0] M_plus_two_y;
  reg [1-1:0] M_plus_two_cin;
  eight_bit_adder_7 plus_two (
    .x(M_plus_two_x),
    .y(M_plus_two_y),
    .cin(M_plus_two_cin),
    .s(M_plus_two_s),
    .cout(M_plus_two_cout)
  );
  
  wire [1-1:0] M_slowClock_value;
  counter_8 slowClock (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock_value)
  );
  
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_5 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  
  always @* begin
    M_register_1_d = M_register_1_q;
    
    M_slowClockEdge_in = M_slowClock_value;
    M_plus_two_y = 8'h02;
    M_plus_two_x = M_register_1_q;
    M_plus_two_cin = 1'h0;
    if (M_slowClockEdge_out == 1'h1) begin
      M_register_1_d = M_plus_two_s;
    end
    out = M_plus_two_s;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_register_1_q <= 1'h0;
    end else begin
      M_register_1_q <= M_register_1_d;
    end
  end
  
endmodule
