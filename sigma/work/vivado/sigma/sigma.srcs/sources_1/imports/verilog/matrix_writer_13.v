/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     ADDRESS_SIZE = 4
     MATRIX_WIDTH = 64
*/
module matrix_writer_13 (
    input clk,
    input rst,
    input [5:0] data,
    output reg [5:0] col_index,
    output reg [3:0] row_index,
    output reg red0,
    output reg green0,
    output reg blue0,
    output reg red1,
    output reg green1,
    output reg blue1,
    output reg latch,
    output reg blank,
    output reg sclk_out,
    output reg [3:0] address,
    output reg [15:0] debug
  );
  
  localparam ADDRESS_SIZE = 3'h4;
  localparam MATRIX_WIDTH = 7'h40;
  
  
  localparam DIV = 3'h6;
  
  reg [1:0] M_state_d, M_state_q = 1'h0;
  reg [5:0] M_sclk_counter_d, M_sclk_counter_q = 1'h0;
  reg [6:0] M_led_bit_counter_d, M_led_bit_counter_q = 1'h0;
  reg [3:0] M_current_address_d, M_current_address_q = 1'h0;
  reg [15:0] M_debug_dff_d, M_debug_dff_q = 1'h0;
  reg [5:0] M_rgb_data_d, M_rgb_data_q = 1'h0;
  reg M_sclk_d, M_sclk_q = 1'h0;
  reg [1:0] M_latch_blank_d, M_latch_blank_q = 1'h0;
  
  always @* begin
    M_current_address_d = M_current_address_q;
    M_rgb_data_d = M_rgb_data_q;
    M_sclk_counter_d = M_sclk_counter_q;
    M_led_bit_counter_d = M_led_bit_counter_q;
    M_latch_blank_d = M_latch_blank_q;
    M_sclk_d = M_sclk_q;
    M_debug_dff_d = M_debug_dff_q;
    M_state_d = M_state_q;
    
    row_index = 1'h0;
    col_index = 1'h0;
    red0 = M_rgb_data_q[0+0-:1];
    green0 = M_rgb_data_q[1+0-:1];
    blue0 = M_rgb_data_q[2+0-:1];
    red1 = M_rgb_data_q[3+0-:1];
    green1 = M_rgb_data_q[4+0-:1];
    blue1 = M_rgb_data_q[5+0-:1];
    blank = M_latch_blank_q[0+0-:1];
    latch = M_latch_blank_q[1+0-:1];
    sclk_out = M_sclk_q;
    address = M_current_address_q;
    M_debug_dff_d = M_led_bit_counter_q;
    debug = M_debug_dff_q;
    M_sclk_counter_d = M_sclk_counter_q + 1'h1;
    if (M_state_q == 2'h0) begin
      M_latch_blank_d = 2'h1;
      M_current_address_d = 4'hf;
      col_index = M_led_bit_counter_q[0+5-:6];
      row_index = 1'h0;
      M_state_d = 2'h1;
    end
    if (M_sclk_counter_q == 6'h00 && M_state_q == 2'h1 && M_led_bit_counter_q <= 7'h40) begin
      M_sclk_d = 1'h0;
      col_index = M_led_bit_counter_q[0+5-:6];
      row_index = M_current_address_q + 1'h1;
      M_led_bit_counter_d = M_led_bit_counter_q + 1'h1;
    end else begin
      if (M_sclk_counter_q == 1'h1 && M_state_q == 2'h1 && M_led_bit_counter_q <= 7'h40) begin
        M_rgb_data_d = data;
      end else begin
        if (M_sclk_counter_q == 5'h1f && M_state_q == 2'h1) begin
          M_sclk_d = 1'h1;
        end else begin
          if (M_sclk_counter_q == 6'h3f && M_state_q == 2'h1 && M_led_bit_counter_q == 7'h40) begin
            M_state_d = 2'h2;
            M_latch_blank_d = 2'h3;
            M_current_address_d = M_current_address_q + 1'h1;
            M_sclk_d = 1'h0;
            M_led_bit_counter_d = 1'h0;
          end else begin
            if (M_sclk_counter_q == 6'h3f && M_state_q == 2'h2) begin
              M_latch_blank_d = 2'h0;
              col_index = M_led_bit_counter_q[0+5-:6];
              row_index = M_current_address_q + 1'h1;
              M_state_d = 2'h1;
            end
          end
        end
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
      M_sclk_counter_q <= 1'h0;
      M_led_bit_counter_q <= 1'h0;
      M_current_address_q <= 1'h0;
      M_debug_dff_q <= 1'h0;
      M_rgb_data_q <= 1'h0;
      M_sclk_q <= 1'h0;
      M_latch_blank_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
      M_sclk_counter_q <= M_sclk_counter_d;
      M_led_bit_counter_q <= M_led_bit_counter_d;
      M_current_address_q <= M_current_address_d;
      M_debug_dff_q <= M_debug_dff_d;
      M_rgb_data_q <= M_rgb_data_d;
      M_sclk_q <= M_sclk_d;
      M_latch_blank_q <= M_latch_blank_d;
    end
  end
  
endmodule
