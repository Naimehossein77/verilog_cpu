`timescale 1ns/1ps
`include "pc_adder_3bit.v"
module pc_adder_3bit_tb;
    reg [2:0] i;
    wire [2:0] o;
    pc_adder_3bit uut(i,o);
    initial begin
        i <= 3'b000;
        #20;
        i <= 3'b101;
        #20;
        i <= 3'b111;
        $finish;
    end   
    initial begin
        $dumpfile("pc_adder_3bit.vcd");
        $dumpvars(0, pc_adder_3bit_tb);
        $monitor("i=%b o=%b", i,o);
    end
endmodule