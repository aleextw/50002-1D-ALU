/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SEED = 128h843233523a613966423b622562592c62
*/
module pn_gen_16 (
    input clk,
    input rst,
    input next,
    input [31:0] seed,
    output reg [31:0] num
  );
  
  localparam SEED = 128'h843233523a613966423b622562592c62;
  
  
  reg [31:0] M_x_d, M_x_q = 1'h0;
  reg [31:0] M_y_d, M_y_q = 1'h0;
  reg [31:0] M_z_d, M_z_q = 1'h0;
  reg [31:0] M_w_d, M_w_q = 1'h0;
  
  reg [31:0] t;
  
  always @* begin
    M_w_d = M_w_q;
    M_x_d = M_x_q;
    M_y_d = M_y_q;
    M_z_d = M_z_q;
    
    num = M_w_q;
    t = M_x_q ^ (M_x_q << 4'hb);
    if (next) begin
      M_x_d = M_y_q;
      M_y_d = M_z_q;
      M_z_d = M_w_q;
      M_w_d = M_w_q ^ (M_w_q >> 5'h13) ^ t ^ (t >> 4'h8);
    end
    if (rst) begin
      M_x_d = 32'h62592c62;
      M_y_d = 32'h423b6225;
      M_z_d = 32'h3a613966;
      M_w_d = 32'h84323352 ^ seed;
    end
  end
  
  always @(posedge clk) begin
    M_x_q <= M_x_d;
    M_y_q <= M_y_d;
    M_z_q <= M_z_d;
    M_w_q <= M_w_d;
  end
  
endmodule
