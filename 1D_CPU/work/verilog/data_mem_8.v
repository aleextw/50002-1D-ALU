/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module data_mem_8 (
    input clk,
    input wr,
    input [15:0] wd,
    input [15:0] addr,
    output reg [15:0] out
  );
  
  
  
  wire [16-1:0] M_ram_read_data;
  reg [8-1:0] M_ram_address;
  reg [16-1:0] M_ram_write_data;
  reg [1-1:0] M_ram_write_en;
  simple_ram_22 #(.SIZE(5'h10), .DEPTH(9'h100)) ram (
    .clk(clk),
    .address(M_ram_address),
    .write_data(M_ram_write_data),
    .write_en(M_ram_write_en),
    .read_data(M_ram_read_data)
  );
  
  always @* begin
    M_ram_address = addr >> 1'h1;
    M_ram_write_data = wd;
    M_ram_write_en = wr;
    out = M_ram_read_data;
  end
endmodule
