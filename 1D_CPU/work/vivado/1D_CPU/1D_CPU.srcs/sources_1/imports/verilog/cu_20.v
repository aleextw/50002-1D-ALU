/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module cu_20 (
    input rst,
    input [5:0] id,
    input z,
    output reg bsel,
    output reg ra2sel,
    output reg [5:0] alufn,
    output reg [1:0] wdsel,
    output reg [2:0] pcsel,
    output reg wasel,
    output reg werf,
    output reg wr
  );
  
  
  
  always @* begin
    alufn = 6'h00;
    werf = 1'h0;
    bsel = 1'h0;
    wdsel = 1'h0;
    wr = 1'h0;
    ra2sel = 1'h0;
    pcsel = 1'h0;
    wasel = 1'h0;
    
    case (id[4+1-:2])
      1'h1: begin
        
        case (id[0+3-:4])
          4'h8: begin
            alufn = 6'h00;
            werf = 1'h1;
            bsel = 1'h1;
            wdsel = 2'h2;
            wr = 1'h0;
            ra2sel = 1'h0;
            pcsel = 1'h0;
            wasel = 1'h0;
          end
          4'h9: begin
            alufn = 6'h00;
            werf = 1'h0;
            bsel = 1'h1;
            wdsel = 1'h0;
            wr = 1'h1;
            ra2sel = 1'h1;
            pcsel = 1'h0;
            wasel = 1'h0;
          end
          4'hb: begin
            werf = 1'h0;
            bsel = 1'h1;
            wdsel = 1'h0;
            wr = 1'h0;
            ra2sel = 1'h0;
            pcsel = 2'h2;
            wasel = 1'h0;
          end
          4'hd: begin
            werf = 1'h1;
            bsel = 1'h0;
            wdsel = 1'h0;
            wr = 1'h0;
            ra2sel = 1'h0;
            pcsel = z;
            wasel = 1'h0;
          end
          4'he: begin
            werf = 1'h1;
            bsel = 1'h0;
            wdsel = 1'h0;
            wr = 1'h0;
            ra2sel = 1'h0;
            pcsel = !z;
            wasel = 1'h0;
          end
          4'hf: begin
            werf = 1'h0;
            bsel = 1'h0;
            wdsel = 1'h0;
            wr = 1'h0;
            ra2sel = 1'h0;
            pcsel = 1'h0;
            wasel = 1'h0;
          end
          4'ha: begin
            alufn = 1'h0;
            werf = 1'h1;
            bsel = 1'h0;
            wdsel = 1'h0;
            wr = 1'h0;
            ra2sel = 1'h0;
            pcsel = 3'h4;
            wasel = 1'h1;
          end
        endcase
      end
      2'h2: begin
        werf = 1'h1;
        bsel = 1'h0;
        wdsel = 1'h1;
        wr = 1'h0;
        ra2sel = 1'h0;
        pcsel = 1'h0;
        wasel = 1'h0;
        
        case (id[0+3-:4])
          4'h0: begin
            alufn = 6'h00;
          end
          4'h1: begin
            alufn = 6'h01;
          end
          4'h7: begin
            alufn = 6'h08;
          end
          4'hc: begin
            alufn = 6'h20;
          end
          4'hd: begin
            alufn = 6'h21;
          end
          4'he: begin
            alufn = 6'h23;
          end
          4'h8: begin
            alufn = 6'h18;
          end
          4'h9: begin
            alufn = 6'h1e;
          end
          4'ha: begin
            alufn = 6'h16;
          end
          4'h4: begin
            alufn = 6'h33;
          end
          4'h5: begin
            alufn = 6'h35;
          end
          4'h6: begin
            alufn = 6'h37;
          end
        endcase
      end
      2'h3: begin
        werf = 1'h1;
        bsel = 1'h1;
        wdsel = 1'h1;
        wr = 1'h0;
        ra2sel = 1'h0;
        pcsel = 1'h0;
        wasel = 1'h0;
        
        case (id[0+3-:4])
          4'h0: begin
            alufn = 6'h00;
          end
          4'h1: begin
            alufn = 6'h01;
          end
          4'h7: begin
            alufn = 6'h08;
          end
          4'hc: begin
            alufn = 6'h20;
          end
          4'hd: begin
            alufn = 6'h21;
          end
          4'he: begin
            alufn = 6'h23;
          end
          4'h8: begin
            alufn = 6'h18;
          end
          4'h9: begin
            alufn = 6'h1e;
          end
          4'ha: begin
            alufn = 6'h16;
          end
          4'h4: begin
            alufn = 6'h33;
          end
          4'h5: begin
            alufn = 6'h35;
          end
          4'h6: begin
            alufn = 6'h37;
          end
        endcase
      end
      default: begin
        werf = 1'h1;
        bsel = 1'h0;
        wdsel = 1'h0;
        wr = 1'h0;
        ra2sel = 1'h0;
        pcsel = 3'h4;
        wasel = 1'h1;
      end
    endcase
    if (rst == 1'h1) begin
      wr = 1'h0;
    end
  end
endmodule
