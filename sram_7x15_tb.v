 `timescale 1ns/1ps
`include "sram_7x15.v"

module sram_7x15_tb;
    reg [2:0] RA1,RA2,WA;
    reg [14:0] WD;
    reg WE,clk;
    wire [14:0] RD1,RD2;

    sram_7x15 uut(RA1,RA2,WA,WD,WE,clk,RD1,RD2);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        WD <= 15'b000000000000000;
        WA <= 3'b000;
        RA1 <= 3'b00;
        RA2 <= 3'b000;
        clk <= 1'b0;
        WE <= 1'b1;
        #20;
        WD <= 15'b000000000000001;
        WA <= 3'b000;
        #20;
        WD <= 15'b000000000000010;
        WA <= 3'b001;
        #20;
        WD <= 15'b000000000000101;
        WA <= 3'b101;
        #20;
        WD <= 15'b000000000000111;
        WA <= 3'b110;
        #20;
        WE <= 1'b0;
        WD <= 15'b000000000000000;
        WA <= 3'b110;
        
        #20;
        RA1 <= 3'b000;
        RA2 <= 3'b001;
        #20;
        RA1 <= 3'b101;
        RA2 <= 3'b110;
        $finish;
    end
    
    initial begin
        $dumpfile("sram_7x15.vcd");
        $dumpvars(0, sram_7x15_tb);
        $monitor("RA1=%b RA2=%b WA=%b WD=%b WE=%b clk=%b RD1=%b RD2=%b",RA1,RA2,WA,WD,WE,clk,RD1,RD2);
    end
endmodule