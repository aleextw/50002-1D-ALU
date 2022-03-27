/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_14 (
    input z,
    input v,
    input n,
    input [2:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn)
      2'h3: begin
        out = {15'h0000, z};
      end
      3'h5: begin
        out = {15'h0000, n ^ v};
      end
      3'h7: begin
        out = {15'h0000, z + (n ^ v)};
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule