`timescale 1ns/1ps
`include "test.v"

module test_tb;

    wire [1:0] out;

    test uut(out);

    initial begin
        #20;
        $finish;
    end
    
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test_tb);
        $monitor("out=%b ", out);
    end
endmodule