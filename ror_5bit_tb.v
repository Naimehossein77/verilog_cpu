`timescale 1ns/1ps
`include "ror_5bit.v"
module ror_5bit_tb;
    reg [4:0] a;
    reg [2:0] shift;
    wire [4:0] z;
    wire cf,sf,zf;
    ror_5bit uut(a,shift,z,cf,sf,zf);
    initial begin
        a <= 5'b11100;
        shift <= 3'b000;
        #20;
        a <= 5'b11100;
        shift <= 3'b001;
        #20;
        a <= 5'b11100;
        shift <= 3'b010;
        #20;
        a <= 5'b11100;
        shift <= 3'b011;
        #20;
        a <= 5'b11100;
        shift <= 3'b100;
        #20;
        a <= 5'b11100;
        shift <= 3'b101;
        #20;
        a <= 5'b11100;
        shift <= 3'b110;
        #20;
        a <= 5'b11100;
        shift <= 3'b111;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("ror_5bit.vcd");
        $dumpvars(0, ror_5bit_tb);
        $monitor("a=%b shift=%b z=%b\ncf=%b, sf=%b, zf=%b", a, shift, z,cf,sf,zf);
    end
endmodule