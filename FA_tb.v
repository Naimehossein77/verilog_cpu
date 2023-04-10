`timescale 1ns/1ps
`include "FA.v"
module FA_tb;
    reg  a, b, cin;
    wire s,cout;
    FA uut(a, b, cin, s, cout);
    initial begin
        a <= 1'b1;
        b <= 1'b0;
        cin <= 1'b0;
        #20;
        a <= 1'b1;
        b <= 1'b1;
        cin <= 1'b0;
        #20;
        a <= 1'b1;
        b <= 1'b1;
        cin <= 1'b1;
        #20;
        a <= 1'b1;
        b <= 1'b0;
        cin <= 1'b1;
        #20;
        a <= 1'b1;
        b <= 1'b1;
        cin <= 1'b0;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("FA.vcd");
        $dumpvars(0, FA_tb);
        $monitor("a=%b b=%b cin=%b s=%b cout=%b", a, b, cin, s, cout);
    end
endmodule