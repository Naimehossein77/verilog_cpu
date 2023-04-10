`include "sram_1x1.v"
module sram_1x15(
    input wire RS1,
    input wire RS2,
    input wire WS,
    input wire [14:0] WD,
    input wire clk,
    output wire [14:0] RD1,
    output wire [14:0] RD2
);
sram_1x1 sram0(WD[0],WS,RS1,RS2,clk,RD1[0],RD2[0]);
sram_1x1 sram1(WD[1],WS,RS1,RS2,clk,RD1[1],RD2[1]);
sram_1x1 sram2(WD[2],WS,RS1,RS2,clk,RD1[2],RD2[2]);
sram_1x1 sram3(WD[3],WS,RS1,RS2,clk,RD1[3],RD2[3]);
sram_1x1 sram4(WD[4],WS,RS1,RS2,clk,RD1[4],RD2[4]);
sram_1x1 sram5(WD[5],WS,RS1,RS2,clk,RD1[5],RD2[5]);
sram_1x1 sram6(WD[6],WS,RS1,RS2,clk,RD1[6],RD2[6]);
sram_1x1 sram7(WD[7],WS,RS1,RS2,clk,RD1[7],RD2[7]);
sram_1x1 sram8(WD[8],WS,RS1,RS2,clk,RD1[8],RD2[8]);
sram_1x1 sram9(WD[9],WS,RS1,RS2,clk,RD1[9],RD2[9]);
sram_1x1 sram10(WD[10],WS,RS1,RS2,clk,RD1[10],RD2[10]);
sram_1x1 sram11(WD[11],WS,RS1,RS2,clk,RD1[11],RD2[11]);
sram_1x1 sram12(WD[12],WS,RS1,RS2,clk,RD1[12],RD2[12]);
sram_1x1 sram13(WD[13],WS,RS1,RS2,clk,RD1[13],RD2[13]);
sram_1x1 sram14(WD[14],WS,RS1,RS2,clk,RD1[14],RD2[14]);
endmodule