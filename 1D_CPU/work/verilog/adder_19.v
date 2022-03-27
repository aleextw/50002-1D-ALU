/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_19 (
    input [15:0] a,
    input [15:0] b,
    input alufn,
    output reg [15:0] s,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] sum;
  
  always @* begin
    
    case (alufn)
      1'h0: begin
        sum = a + b;
      end
      1'h1: begin
        sum = a - b;
      end
      default: begin
        sum = 16'h0000;
      end
    endcase
    s = sum;
    z = ~(|sum);
    v = (((b[15+0-:1] ^ alufn) && a[15+0-:1]) & !sum[15+0-:1]) || ((!(b[15+0-:1] ^ alufn) & !a[15+0-:1]) && sum[15+0-:1]);
    n = sum[15+0-:1];
  end
endmodule
