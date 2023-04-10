`timescale 1ns/1ps
`include "and_5bit.v"
module and_5bit_tb;
    reg [4:0] a, b;
    wire [4:0] z;
    wire cf, sf, zf;
    and_5bit uut(a, b, z,cf, sf, zf);
    initial begin
        a <= 5'b10101;
        b <= 5'b01100;
        #20;
        a <= 5'b11100;
        b <= 5'b00000;
        #20;
        a <= 5'b00000;
        b <= 5'b00000;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("and_5bit.vcd");
        $dumpvars(0, and_5bit_tb);
        $monitor("a=%b b=%b z=%b\ncf=%b, sf=%b, zf=%b", a, b, z,cf,sf,zf);
    end
endmodule