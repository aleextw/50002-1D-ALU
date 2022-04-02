/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = 1
     DIV = 20
     TOP = 0
     UP = 1
*/
module counter_16 (
    input clk,
    input rst,
    output reg [0:0] value
  );
  
  localparam SIZE = 1'h1;
  localparam DIV = 5'h14;
  localparam TOP = 1'h0;
  localparam UP = 1'h1;
  
  
  reg [20:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 21'h0fffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[20+0-:1];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h0 && M_ctr_q == 21'h0fffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h0 && M_ctr_q == 1'h0) begin
        M_ctr_d = 21'h0fffff;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
