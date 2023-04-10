`timescale 1ns/1ps
`include "decoder_2x4.v"
module decoder_2x4_tb;
    reg E;
    reg [1:0] A;
    wire [3:0] Y;
    decoder_2x4 uut(E,A,Y);
    initial begin
        E <= 1'b0;
        A <= 2'b00;
        #20;
        E <= 1'b1;
        A <= 2'b00;
        #20;
        A <= 2'b01;
        #20;
        A <= 2'b10;
        #20;
        A <= 2'b11;
        #20;      
        $finish;
    end 
    initial begin
        $dumpfile("decoder_2x4.vcd");
        $dumpvars(0, decoder_2x4_tb);
        $monitor("E=%b A=%b Y=%b", E, A, Y);
    end
endmodule