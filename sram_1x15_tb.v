`timescale 1ns/1ps
`include "sram_1x15.v"
module sram_1x15_tb;
    reg RS1,RS2,WS,clk;
    reg [14:0] WD;
    wire [14:0] RD1,RD2;
    sram_1x15 uut(RS1,RS2,WS,WD,clk,RD1,RD2);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        WD <= 15'b000000000000000;
        WS <= 1'b0;
        RS1 <= 1'b0;
        RS2 <= 1'b0;
        clk <= 1'b0;
        #20;
        WS <= 1'b1;
        WD <= 15'b000000000000001;  
        #20;
        WS <= 1'b0;
        RS1 <= 1'b1;
        RS2 <= 1'b1;
        #20;
        WD <= 15'b000000000000010;
        $finish;
    end
    initial begin
        $dumpfile("sram_1x15.vcd");
        $dumpvars(0, sram_1x15_tb);
        $monitor("WD=%b WS=%b RS1=%b RS2=%b clk=%b RD1=%b RD2=%b",WD,WS,RS1,RS2,clk,RD1,RD2);
    end
endmodule