`timescale 1ns/1ps
`include "pc_3bit.v"
module pc_3bit_tb;
    reg [2:0] i;
    reg clk;
    wire [2:0] o;  
    pc_3bit uut(i,clk,o);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        i <= 3'b000;
        clk <= 1'b0;
        #20;
        i <= 3'b101;
        #20;
        i <= 3'b111;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("pc_3bit.vcd");
        $dumpvars(0, pc_3bit_tb);
        $monitor("i=%b clk=%b o=%b", i,clk,o);
    end
endmodule