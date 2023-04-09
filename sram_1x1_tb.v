 `timescale 1ns/1ps
`include "sram_1x1.v"

module sram_1x1_tb;
    reg WD,WS,RS1,RS2,clk;
    wire RD1,RD2;

    sram_1x1 uut(WD,WS,RS1,RS2,clk,RD1,RD2);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        WD <= 1'b0;
        WS <= 1'b0;
        RS1 <= 1'b0;
        RS2 <= 1'b0;
        clk <= 1'b0;
        #20;
        WD <= 1'b1;
        WS <= 1'b1;
        #20;
        WS <= 1'b0;
        RS1 <= 1'b1;
        RS2 <= 1'b1;
        #20;
        WD <= 1'b0;
        $finish;
    end
    
    initial begin
        $dumpfile("sram_1x1.vcd");
        $dumpvars(0, sram_1x1_tb);
        $monitor("WD=%b WS=%b RS1=%b RS2=%b clk=%b RD1=%b RD2=%b",WD,WS,RS1,RS2,clk,RD1,RD2);
    end
endmodule