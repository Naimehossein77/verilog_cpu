`timescale 1ns/1ps
`include "mux_4x1_3bit.v"

module mux_4x1_3bit_tb;
    reg [2:0] in0,in1,in2,in3;
    reg [1:0] sel;
    wire [2:0] out;

    mux_4x1_3bit uut(in0,in1,in2,in3,sel,out);

    initial begin
        in0 <= 3'b000;
        in1 <= 3'b110;
        in2 <= 3'b110;
        in3 <= 3'b001;

        sel <= 2'b00;
        #20;
        sel <= 2'b01;
        #20;
        sel <= 2'b10;
        #20;
        sel <= 2'b11;
        #20;

        in2 <= 3'b101;
        in3 <= 3'b010;
        sel <= 2'b11;
        #20;
        sel <= 2'b10;
        #20;

        $finish;
    end
    
    initial begin
        $dumpfile("mux_4x1_3bit.vcd");
        $dumpvars(0, mux_4x1_3bit_tb);
        $monitor("sel=%b out=%b", sel,out);
    end
endmodule