`timescale 1ns/1ps
`include "register_set.v"
module register_set_tb;
    reg [1:0] Ra;
    reg [1:0] Rb;
    reg [1:0] Wr;
    reg [4:0] Wrd;
    reg reg_en;
    reg clk;
    wire [4:0] a;
    wire [4:0] b;
    register_set uut(Ra,Rb,Wr,Wrd,reg_en,clk,a,b);
    always #10 clk = ~clk;
    initial
    begin
        clk <= 1;
        Wr <= 2'b00;
        Wrd <= 5'b00111;
        reg_en <= 1'b1;
        #20;
        Wr <= 2'b01;
        Wrd <= 5'b00110;
        reg_en <= 1'b1;
        #20;
        Ra <= 2'b00;
        #20;
        Ra <= 2'b10;
        Rb <= 2'b01;
        #20;
        $finish;
    end
    initial begin
        $dumpfile("register_set.vcd");
        $dumpvars(0, register_set_tb);
        $monitor("Ra=%b Rb=%b Wr=%b Wrd=%b reg_en=%b clk=%b a=%b b=%b",Ra,Rb,Wr,Wrd,reg_en,clk,a,b);
    end
endmodule