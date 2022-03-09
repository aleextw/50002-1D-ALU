/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module bitshift_12 (
    input [15:0] a,
    input [15:0] b,
    input [2:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn)
      1'h0: begin
        out = a << b[0+3-:4];
      end
      1'h1: begin
        out = a >> b[0+3-:4];
      end
      2'h2: begin
        out = a >>> b[0+3-:4] ^ ({5'h10{a[15+0-:1]}} << (5'h10 - b[0+3-:4]));
      end
      2'h3: begin
        out = (a >> (5'h10 - b[0+3-:4])) | (a << b[0+3-:4]);
      end
      3'h4: begin
        out = (a << (5'h10 - b[0+3-:4])) | (a >> b[0+3-:4]);
      end
      default: begin
        out = a;
      end
    endcase
  end
endmodule
