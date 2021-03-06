/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SIZE = NUM_STATE_BITS
     DIV = 26
     TOP = NUM_STATES
     UP = 1
*/
module counter_8 (
    input clk,
    input rst,
    output reg [6:0] value
  );
  
  localparam SIZE = 3'h7;
  localparam DIV = 5'h1a;
  localparam TOP = 7'h6e;
  localparam UP = 1'h1;
  
  
  reg [32:0] M_ctr_d, M_ctr_q = 1'h0;
  
  localparam MAX_VALUE = 33'h1bbffffff;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    value = M_ctr_q[26+6-:7];
    if (1'h1) begin
      M_ctr_d = M_ctr_q + 1'h1;
      if (1'h1 && M_ctr_q == 33'h1bbffffff) begin
        M_ctr_d = 1'h0;
      end
    end else begin
      M_ctr_d = M_ctr_q - 1'h1;
      if (1'h1 && M_ctr_q == 1'h0) begin
        M_ctr_d = 33'h1bbffffff;
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
