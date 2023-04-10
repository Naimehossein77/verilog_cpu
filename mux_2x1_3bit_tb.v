`timescale 1ns/1ps
`include "mux_2x1_3bit.v"
module mux_2x1_3bit_tb;
    reg [2:0] in0,in1;
    reg sel;
    wire [2:0] out;
    mux_2x1_3bit uut(in0,in1,sel,out);
    initial begin
        in0 <= 3'b000;
        in1 <= 3'b001;
        sel <= 1'b0;
        #20;
        sel <= 1'b1;
        #20;
        in0 <= 3'b100;
        in1 <= 3'b111;
        sel <= 1'b0;
        #20;
        sel <= 1'b1;
        #20;
        $finish;
    end 
    initial begin
        $dumpfile("mux_2x1_3bit.vcd");
        $dumpvars(0, mux_2x1_3bit_tb);
        $monitor("in0=%b in1=%b sel=%b out=%b",in0,in1, sel,out);
    end
endmodule