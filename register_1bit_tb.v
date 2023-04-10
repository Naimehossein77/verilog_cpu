`timescale 1ns/1ps
`include "register_1bit.v"
module register_1bit_tb;
    reg Din,sel,clk;
    wire Dout;
    register_1bit uut(Din,sel,clk,Dout);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        Din <= 1'b1;
        sel <= 1'b1;
        clk <= 1'b0;
        #20;
        Din <= 1'b0;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("register_1bit.vcd");
        $dumpvars(0, register_1bit_tb);
        $monitor("Din=%b sel=%b clk=%b Dout=%b", Dout, sel, clk,Dout);
    end
endmodule