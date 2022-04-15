/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_9 (
    input clk,
    input rst,
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    input slow_clock,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n,
    output reg [15:0] randout
  );
  
  
  
  wire [32-1:0] M_rand_num;
  reg [1-1:0] M_rand_clk;
  reg [1-1:0] M_rand_rst;
  reg [1-1:0] M_rand_next;
  reg [32-1:0] M_rand_seed;
  pn_gen_17 rand (
    .clk(M_rand_clk),
    .rst(M_rand_rst),
    .next(M_rand_next),
    .seed(M_rand_seed),
    .num(M_rand_num)
  );
  
  wire [16-1:0] M_add_s;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [16-1:0] M_add_a;
  reg [16-1:0] M_add_b;
  reg [1-1:0] M_add_alufn;
  adder_18 add (
    .a(M_add_a),
    .b(M_add_b),
    .alufn(M_add_alufn),
    .s(M_add_s),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  
  wire [16-1:0] M_bl_out;
  reg [16-1:0] M_bl_a;
  reg [16-1:0] M_bl_b;
  reg [4-1:0] M_bl_alufn;
  bool_19 bl (
    .a(M_bl_a),
    .b(M_bl_b),
    .alufn(M_bl_alufn),
    .out(M_bl_out)
  );
  
  wire [16-1:0] M_bs_out;
  reg [16-1:0] M_bs_a;
  reg [16-1:0] M_bs_b;
  reg [2-1:0] M_bs_alufn;
  bitshift_20 bs (
    .a(M_bs_a),
    .b(M_bs_b),
    .alufn(M_bs_alufn),
    .out(M_bs_out)
  );
  
  wire [16-1:0] M_cmp_out;
  reg [1-1:0] M_cmp_z;
  reg [1-1:0] M_cmp_v;
  reg [1-1:0] M_cmp_n;
  reg [2-1:0] M_cmp_alufn;
  compare_21 cmp (
    .z(M_cmp_z),
    .v(M_cmp_v),
    .n(M_cmp_n),
    .alufn(M_cmp_alufn),
    .out(M_cmp_out)
  );
  
  reg temp_z;
  
  reg temp_v;
  
  reg temp_n;
  
  always @* begin
    M_rand_clk = clk;
    M_rand_rst = rst;
    M_rand_seed = 128'h843233523a613966423b622562592c62;
    M_rand_next = slow_clock;
    M_add_a = a;
    M_add_b = b;
    M_add_alufn = alufn[0+0-:1];
    temp_z = M_add_z;
    temp_v = M_add_v;
    temp_n = M_add_n;
    M_bl_a = a;
    M_bl_b = b;
    M_bl_alufn = alufn[0+3-:4];
    M_bs_a = a;
    M_bs_b = b;
    M_bs_alufn = alufn[0+1-:2];
    M_cmp_z = temp_z;
    M_cmp_v = temp_v;
    M_cmp_n = temp_n;
    M_cmp_alufn = alufn[1+1-:2];
    
    case (alufn[4+1-:2])
      1'h0: begin
        
        case (alufn[3+0-:1])
          1'h0: begin
            out = M_add_s;
          end
          1'h1: begin
            out = {12'h000, M_rand_num[0+3-:4]};
          end
          default: begin
            out = a;
          end
        endcase
      end
      1'h1: begin
        out = M_bl_out;
      end
      2'h2: begin
        out = M_bs_out;
      end
      2'h3: begin
        out = M_cmp_out;
      end
      default: begin
        out = a;
      end
    endcase
    randout = M_rand_num[0+15-:16];
    z = temp_z;
    v = temp_v;
    n = temp_n;
  end
endmodule
