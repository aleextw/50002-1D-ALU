/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module inst_mem_21 (
    input [15:0] ia,
    output reg [31:0] id
  );
  
  
  
  localparam INSTRUCTION = 8352'h6ffe000082dff8008016f80077f6ffff82dff80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077ffff7a7b18fffef7180001c31fffff833ff80082fff800c35a000177e0ff9ed00000017be1fffbf4210001c000000177e30001a0611000c05f0001801ff8008038f80077e5fff8d0a1000fc02100016464007c6464007cf0810001a0620000b4580800c01f0001803ff800ab181000b0420800c05f0001c4240001ab181000b0420800c05f0001c4230001ab181000b0420800c05f0001c437000177e5fff8c021000290a30000f4840008f0820008f46200086041000060410000f0210003c437000177e2fff5a0591000b0420800c05f0001c42000017be1ffb09020b8007be1ffb2f420000477e0fffe6800000082e0f8008323f80077e3ffd777e8ffe3d1020004c0210002c0420001a4661800b0c62800c0df0001c4a500017be8000877e8ffecd1020004c0210002c042000177eb0005996a48006148007c6148007c6127007c6127007cf1080001c5060001f4c60008f0c40008f0e70001c4e50001f4a4000877e4001a6081000060810000f0210003807ff800805ff80077e2fff8e0420001b4580800c42000017be1ffddf420000477e0fffe68000000833ff80082fff80077e5fff8d0a1000fc02100016464007c6464007cf0810001a0620000b4580800c01f0001c03f000077ff0000eb00ffff9c00000077ff0003631f007a631f007a77ff0006631f0078631f007877fffff17b18fffef7180001c31fffff7be0000ad01a00037be00009d01a00027be00008d01a0001c35f000177e0fffcf400000477e0fffe68000000;
  
  always @* begin
    id = INSTRUCTION[(ia >> 2'h2)*32+31-:32];
  end
endmodule
