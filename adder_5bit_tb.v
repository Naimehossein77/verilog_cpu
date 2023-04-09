`timescale 1ns/1ps
`include "adder_5bit.v"

module adder_5bit_tb;
    reg [4:0] a, b;
    reg cin;
    wire [4:0] s;
    wire cout;
    wire cf, sf, zf;

    adder_5bit uut(a, b, cin, s, cout,cf,sf,zf);

    initial begin
        a <= 5'b10101;
        b <= 5'b01100;
        cin <= 1'b0;
        #20;
        a <= 5'b11100;
        b <= 5'b00000;
        cin <= 1'b1;
        #20;
        a <= 5'b00001;
        b <= 5'b00111;
        cin <= 1'b0;
        #20;
        $finish;
    end
    
    initial begin
        $dumpfile("adder_5bit.vcd");
        $dumpvars(0, adder_5bit_tb);
        $monitor("a=%b b=%b c=%b s=%b cout=%b\ncf=%b, sf=%b, zf=%b", a, b,cin, s, cout, cf,sf,zf);
    end
endmodule