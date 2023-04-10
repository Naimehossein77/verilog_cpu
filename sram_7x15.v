`include "decoder_3x8.v"
`include "sram_1x15.v"
module sram_7x15 (
    input wire [2:0] RA1,
    input wire [2:0] RA2,
    input wire [2:0] WA,
    input wire [14:0] WD,
    input wire WE,
    input wire clk,
    output wire [14:0] RD1,
    output wire [14:0] RD2
);
    wire [7:0] _ra1,_ra2,_w;
    wire [14:0] _rd1_0,_rd1_1,_rd1_2,_rd1_3,_rd1_4,_rd1_5,_rd1_6;
    wire [14:0] _rd2_0,_rd2_1,_rd2_2,_rd2_3,_rd2_4,_rd2_5,_rd2_6;
    decoder_3x8 ra1(1'b1,RA1,_ra1);
    decoder_3x8 ra2(1'b1,RA2,_ra2);
    decoder_3x8 wa(WE,WA,_w);
    sram_1x15 sram0(_ra1[0],_ra2[0],_w[0],WD,clk,_rd1_0,_rd2_0);
    sram_1x15 sram1(_ra1[1],_ra2[1],_w[1],WD,clk,_rd1_1,_rd2_1);
    sram_1x15 sram2(_ra1[2],_ra2[2],_w[2],WD,clk,_rd1_2,_rd2_2);
    sram_1x15 sram3(_ra1[3],_ra2[3],_w[3],WD,clk,_rd1_3,_rd2_3);
    sram_1x15 sram4(_ra1[4],_ra2[4],_w[4],WD,clk,_rd1_4,_rd2_4);
    sram_1x15 sram5(_ra1[5],_ra2[5],_w[5],WD,clk,_rd1_5,_rd2_5);
    sram_1x15 sram6(_ra1[6],_ra2[6],_w[6],WD,clk,_rd1_6,_rd2_6);
assign RD1 = _rd1_0 | _rd1_1 | _rd1_2 | _rd1_3 | _rd1_4 | _rd1_5 | _rd1_6;
assign RD2 = _rd2_0 | _rd2_1 | _rd2_2 | _rd2_3 | _rd2_4 | _rd2_5 | _rd2_6;
endmodule