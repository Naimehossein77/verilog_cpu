`timescale 1ns/1ps
`include "decoder_3x8.v"

module decoder_3x8_tb;
    reg E;
    reg [2:0] A;
    wire [7:0] Y;

    decoder_3x8 uut(E,A,Y);
    initial begin
        E <= 1'b0;
        A <= 3'b000;
        #20;
        E <= 1'b1;
        A <= 3'b000;
        #20;
        A <= 3'b001;
        #20;
        A <= 3'b010;
        #20;
        A <= 3'b011;
        #20;
        A <= 3'b111;
        #20;
        
        $finish;
    end
    
    initial begin
        $dumpfile("decoder_3x8.vcd");
        $dumpvars(0, decoder_3x8_tb);
        $monitor("E=%b A=%b Y=%b", E, A, Y);
    end
endmodule