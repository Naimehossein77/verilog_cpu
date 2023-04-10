`timescale 1ns/1ps
`include "mux_4x1_5bit.v"
module mux_4x1_5bit_tb;
    reg [4:0] in0,in1,in2,in3;
    reg [1:0] sel;
    wire [4:0] out;
    mux_4x1_5bit uut(in0,in1,in2,in3,sel,out);
    initial begin
        in0 <= 5'b00000;
        in1 <= 5'b11001;
        in2 <= 5'b11000;
        in3 <= 5'b00111;
        sel <= 2'b00;
        #20;
        sel <= 2'b01;
        #20;
        sel <= 2'b10;
        #20;
        sel <= 2'b11;
        #20;
        in2 <= 5'b00100;
        in3 <= 5'b11011;
        sel <= 2'b11;
        #20;
        sel <= 2'b10;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("mux_4x1_5bit.vcd");
        $dumpvars(0, mux_4x1_5bit_tb);
        $monitor("sel=%b out=%b", sel,out);
    end
endmodule