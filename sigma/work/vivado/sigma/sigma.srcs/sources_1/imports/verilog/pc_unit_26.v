/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module pc_unit_26 (
    input clk,
    input rst,
    input [15:0] c,
    input [15:0] ra,
    input slow_clock,
    input [2:0] pcsel,
    output reg [31:0] ia,
    output reg [31:0] pc_4
  );
  
  
  
  reg [31:0] M_pc_d, M_pc_q = 1'h0;
  
  always @* begin
    M_pc_d = M_pc_q;
    
    ia = M_pc_q;
    pc_4 = M_pc_q + 3'h4;
    if (slow_clock) begin
      
      case (pcsel)
        1'h0: begin
          M_pc_d = M_pc_q + 3'h4;
        end
        1'h1: begin
          M_pc_d = M_pc_q + 3'h4 + {c[15+0-:1], c} * 3'h4;
        end
        2'h2: begin
          M_pc_d = {ra[15+0-:1], ra[0+14-:15]};
        end
        2'h3: begin
          M_pc_d = 11'h500;
        end
        3'h4: begin
          M_pc_d = 11'h400;
        end
        default: begin
          M_pc_d = M_pc_q;
        end
      endcase
      if (rst) begin
        M_pc_d = 1'h0;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_pc_q <= 1'h0;
    end else begin
      M_pc_q <= M_pc_d;
    end
  end
  
endmodule
