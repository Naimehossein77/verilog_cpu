`timescale 1ns/1ps
`include "mux_2x1_1bit.v"
module mux_2x1_1bit_tb;
    reg in0,in1;
    reg sel;
    wire out;
    mux_2x1_1bit uut(in0,in1,sel,out);
    initial begin
        in0 <= 1'b0;
        in1 <= 1'b1;
        sel <= 1'b0;
        #20;
        sel <= 1'b11;
        #20;
        in0 <= 1'b1;
        in1 <= 1'b0;
        sel <= 1'b0;
        #20;
        sel <= 1'b1;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("mux_2x1_1bit.vcd");
        $dumpvars(0, mux_2x1_1bit_tb);
        $monitor("in0=%b in1=%b sel=%b out=%b",in0,in1, sel,out);
    end
endmodule