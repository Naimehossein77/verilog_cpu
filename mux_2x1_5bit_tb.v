`timescale 1ns/1ps
`include "mux_2x1_5bit.v"
module mux_2x1_5bit_tb;
    reg [4:0] in0,in1;
    reg sel;
    wire [4:0] out;
    mux_2x1_5bit uut(in0,in1,sel,out);
    initial begin
        in0 <= 5'b00000;
        in1 <= 5'b00001;
        sel <= 1'b0;
        #20;
        sel <= 1'b1;
        #20;
        in0 <= 5'b11100;
        in1 <= 5'b11111;
        sel <= 1'b0;
        #20;
        sel <= 1'b1;
        #20;
        $finish;
    end 
    initial begin
        $dumpfile("mux_2x1_5bit.vcd");
        $dumpvars(0, mux_2x1_5bit_tb);
        $monitor("in0=%b in1=%b sel=%b out=%b",in0,in1, sel,out);
    end
endmodule