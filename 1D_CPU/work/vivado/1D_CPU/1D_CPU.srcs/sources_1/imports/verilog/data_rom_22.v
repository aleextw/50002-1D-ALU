/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module data_rom_22 (
    input [15:0] address,
    output reg [15:0] out
  );
  
  
  
  localparam DATA = 1248'h00000000000000000000000000000000000000000000000000000000000000007e007ffe000000000d0e060a000000000c0d05090f0e0b0c06090408000000000e0d0508000000000d0c040700000000080903060000000007080205000000000a09030500000000090802040f0a0d0904050103000000000e090c080d080b0706050102000000000a06080500000000090507040000000006030402;
  
  always @* begin
    out = DATA[(address)*16+15-:16];
  end
endmodule
