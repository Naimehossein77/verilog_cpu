`timescale 1ns/1ps
`include "register_5bit.v"

module register_5bit_tb;
    reg [4:0] Din;
    reg sel,clk;
    wire [4:0] Dout;

    register_5bit uut(Din,sel,clk,Dout);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        Din <= 5'b10011;
        sel <= 1'b1;
        clk <= 1'b0;
        #20;
        Din <= 5'b01111;
        #20;
        sel <= 1'b0;
        #20;
        Din <= 5'b01111;
        #20;
        $finish;
    end
    
    initial begin
        $dumpfile("register_5bit.vcd");
        $dumpvars(0, register_5bit_tb);
        $monitor("Din=%b sel=%b clk=%b Dout=%b", Dout, sel, clk,Dout);
    end
endmodule