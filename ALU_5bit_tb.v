`timescale 1ns/1ps
`include "ALU_5bit.v"
module ALU_5bit_tb;
    reg [4:0] a, b;
    reg [1:0] op;
    wire [4:0] R;
    wire cf, sf, zf;
    ALU_5bit uut(a, b,op,R,cf,sf,zf);
    initial begin
        a <= 5'b10101;
        b <= 5'b10001;
        op <= 2'b00;
        #20;
        op <= 2'b01;
        #20;
        op <= 2'b10;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("ALU_5bit.vcd");
        $dumpvars(0, ALU_5bit_tb);
        $monitor("a=%b b=%b op=%b R=%b\ncf=%b, sf=%b, zf=%b", a, b,op, R, cf,sf,zf);
    end
endmodule