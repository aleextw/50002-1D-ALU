/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module inst_mem_15 (
    input [15:0] ia,
    output reg [31:0] id
  );
  
  
  
  localparam INSTRUCTION = 8352'h6ffe000082dff8008016f80077f6ffff82dff800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077ffff8b7b18fffef7180001c31fffff833ff80082fff800c35a000177e0ffafd00000017be1fffcc000000177e30001a0611000c05f0001801ff8008038f800ab181000b0420800c05f0001c4240001ab181000b0420800c05f0001c4230001ab181000b0420800c05f0001c437000177e5fff8c021000290a30000f4840008f0820008f4620008604100006041000077e2fff5a0591000b0420800c05f0001c42000017be1ffd19020b8007be1ffb6f420000477e0fffe6800000082e0f8008323f80077e3ffd977e8ffe6d1020004c0210002c0420001a4661800b0c62800c0df0001c4a500017be8000877e8ffefd1020004c0210002c042000177e7000598e838006108004c6108004c60e7004c60e7004cf1060001f4c60008f0c40008f0e50001f4a400086081000060810000807ff800805ff80077e2fff6e0420001b4580800c42000017be1ffddf4200004833ff80082fff80077e0fffe6800000077e5fff8d0a1000fc02100016483004c6483004cf0810001a0620000b4580800c01f0001803ff80077ff0000eb00ffff9c00000077ff0003631f004a631f004a77ff0006631f0048631f004877fffff17b180069f7180001c31fffff7be0000ad01a00037be00009d01a00027be00008d01a0001c35f000177e0fffcf400000477e0fffe68000000;
  
  always @* begin
    id = INSTRUCTION[(ia >> 2'h2)*32+31-:32];
  end
endmodule
