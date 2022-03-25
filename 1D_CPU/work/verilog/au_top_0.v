/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [(4'h8+0)-1:0] M_button_cond_out;
  reg [(4'h8+0)-1:0] M_button_cond_in;
  
  genvar GEN_button_cond0;
  generate
  for (GEN_button_cond0=0;GEN_button_cond0<4'h8;GEN_button_cond0=GEN_button_cond0+1) begin: button_cond_gen_0
    button_conditioner_2 button_cond (
      .clk(clk),
      .in(M_button_cond_in[GEN_button_cond0*(1)+(1)-1-:(1)]),
      .out(M_button_cond_out[GEN_button_cond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(4'h8+0)-1:0] M_edge_det_out;
  reg [(4'h8+0)-1:0] M_edge_det_in;
  
  genvar GEN_edge_det0;
  generate
  for (GEN_edge_det0=0;GEN_edge_det0<4'h8;GEN_edge_det0=GEN_edge_det0+1) begin: edge_det_gen_0
    edge_detector_3 edge_det (
      .clk(clk),
      .in(M_edge_det_in[GEN_edge_det0*(1)+(1)-1-:(1)]),
      .out(M_edge_det_out[GEN_edge_det0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [16-1:0] M_rf_rd1;
  wire [16-1:0] M_rf_rd2;
  wire [16-1:0] M_rf_lvl;
  wire [16-1:0] M_rf_peg;
  wire [16-1:0] M_rf_pegsel;
  wire [16-1:0] M_rf_val_op;
  reg [5-1:0] M_rf_ra1;
  reg [5-1:0] M_rf_ra2;
  reg [1-1:0] M_rf_we;
  reg [16-1:0] M_rf_wd;
  reg [5-1:0] M_rf_wa;
  reg [16-1:0] M_rf_buttons;
  reg [1-1:0] M_rf_ia;
  regfile_4 rf (
    .clk(clk),
    .ra1(M_rf_ra1),
    .ra2(M_rf_ra2),
    .we(M_rf_we),
    .wd(M_rf_wd),
    .wa(M_rf_wa),
    .buttons(M_rf_buttons),
    .ia(M_rf_ia),
    .rd1(M_rf_rd1),
    .rd2(M_rf_rd2),
    .lvl(M_rf_lvl),
    .peg(M_rf_peg),
    .pegsel(M_rf_pegsel),
    .val_op(M_rf_val_op)
  );
  wire [16-1:0] M_arith_out;
  wire [1-1:0] M_arith_z;
  wire [1-1:0] M_arith_v;
  wire [1-1:0] M_arith_n;
  reg [1-1:0] M_arith_rst;
  reg [16-1:0] M_arith_a;
  reg [16-1:0] M_arith_b;
  reg [6-1:0] M_arith_alufn;
  alu_5 arith (
    .clk(clk),
    .rst(M_arith_rst),
    .a(M_arith_a),
    .b(M_arith_b),
    .alufn(M_arith_alufn),
    .out(M_arith_out),
    .z(M_arith_z),
    .v(M_arith_v),
    .n(M_arith_n)
  );
  wire [16-1:0] M_data_out;
  reg [1-1:0] M_data_wr;
  reg [16-1:0] M_data_wd;
  reg [16-1:0] M_data_addr;
  data_mem_6 data (
    .clk(clk),
    .wr(M_data_wr),
    .wd(M_data_wd),
    .addr(M_data_addr),
    .out(M_data_out)
  );
  wire [16-1:0] M_pc_ia;
  wire [16-1:0] M_pc_pc_4;
  reg [1-1:0] M_pc_rst;
  reg [16-1:0] M_pc_id;
  reg [16-1:0] M_pc_ra;
  reg [3-1:0] M_pc_pcsel;
  reg [1-1:0] M_pc_slow_clock;
  pc_unit_7 pc (
    .clk(clk),
    .rst(M_pc_rst),
    .id(M_pc_id),
    .ra(M_pc_ra),
    .pcsel(M_pc_pcsel),
    .slow_clock(M_pc_slow_clock),
    .ia(M_pc_ia),
    .pc_4(M_pc_pc_4)
  );
  wire [1-1:0] M_slow_clock_edge_detector_out;
  reg [1-1:0] M_slow_clock_edge_detector_in;
  edge_detector_3 slow_clock_edge_detector (
    .clk(clk),
    .in(M_slow_clock_edge_detector_in),
    .out(M_slow_clock_edge_detector_out)
  );
  wire [1-1:0] M_cnt_value;
  counter_8 cnt (
    .clk(clk),
    .rst(rst),
    .value(M_cnt_value)
  );
  
  wire [1-1:0] M_cu_bsel;
  wire [1-1:0] M_cu_ra2sel;
  wire [6-1:0] M_cu_alufn;
  wire [2-1:0] M_cu_wdsel;
  wire [3-1:0] M_cu_pcsel;
  wire [1-1:0] M_cu_wasel;
  wire [1-1:0] M_cu_werf;
  wire [1-1:0] M_cu_wr;
  reg [1-1:0] M_cu_rst;
  reg [6-1:0] M_cu_id;
  reg [1-1:0] M_cu_z;
  cu_9 cu (
    .rst(M_cu_rst),
    .id(M_cu_id),
    .z(M_cu_z),
    .bsel(M_cu_bsel),
    .ra2sel(M_cu_ra2sel),
    .alufn(M_cu_alufn),
    .wdsel(M_cu_wdsel),
    .pcsel(M_cu_pcsel),
    .wasel(M_cu_wasel),
    .werf(M_cu_werf),
    .wr(M_cu_wr)
  );
  
  wire [32-1:0] M_instructions_id;
  reg [16-1:0] M_instructions_ia;
  inst_mem_10 instructions (
    .ia(M_instructions_ia),
    .id(M_instructions_id)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    usb_tx = usb_rx;
    M_button_cond_in = io_button[1+0-:1];
    M_edge_det_in = M_button_cond_out;
    M_slow_clock_edge_detector_in = M_cnt_value;
    M_pc_slow_clock = M_slow_clock_edge_detector_out;
    M_pc_rst = rst;
    M_instructions_ia = M_pc_ia;
    M_pc_id = M_instructions_id[0+15-:16];
    M_pc_pcsel = M_cu_pcsel;
    M_pc_ra = M_rf_rd1;
    M_cu_rst = rst;
    M_rf_we = M_cu_werf;
    M_cu_z = ~(|M_rf_rd1);
    M_cu_id = M_instructions_id[26+5-:6];
    M_arith_alufn = M_cu_alufn;
    M_data_wr = M_cu_wr;
    
    case (M_cu_ra2sel)
      1'h0: begin
        M_rf_ra2 = M_instructions_id[11+4-:5];
      end
      1'h1: begin
        M_rf_ra2 = M_instructions_id[21+4-:5];
      end
      default: begin
        M_rf_ra2 = M_instructions_id[11+4-:5];
      end
    endcase
    M_rf_ra1 = M_instructions_id[16+4-:5];
    
    case (M_cu_wasel)
      1'h0: begin
        M_rf_wa = M_instructions_id[21+4-:5];
      end
      1'h1: begin
        M_rf_wa = 5'h1e;
      end
      default: begin
        M_rf_wa = M_instructions_id[21+4-:5];
      end
    endcase
    M_rf_buttons = M_edge_det_out;
    M_rf_ia = M_pc_ia[12+0-:1];
    io_led[16+7-:8] = M_rf_peg[0+7-:8];
    io_led[8+7-:8] = M_rf_val_op[0+7-:8];
    io_led[0+7-:8] = M_rf_lvl[0+7-:8];
    led[0+0-:1] = M_cnt_value;
    led[1+6-:7] = M_pc_ia[0+6-:7];
    M_arith_rst = rst;
    
    case (M_cu_bsel)
      1'h0: begin
        M_arith_b = M_rf_rd2;
      end
      1'h1: begin
        M_arith_b = M_instructions_id[0+15-:16];
      end
      default: begin
        M_arith_b = M_rf_rd2;
      end
    endcase
    M_arith_a = M_rf_rd1;
    
    case (M_cu_wdsel)
      1'h0: begin
        M_rf_wd = {M_pc_ia[15+0-:1], M_pc_pc_4[0+14-:15]};
      end
      1'h1: begin
        M_rf_wd = M_arith_out;
      end
      2'h2: begin
        M_rf_wd = M_data_out;
      end
      default: begin
        M_rf_wd = M_arith_out;
      end
    endcase
    M_data_addr = M_arith_out;
    M_data_wd = M_rf_rd2;
  end
endmodule