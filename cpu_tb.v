`timescale 1ns/1ps
`include "cpu.v"
module cpu_tb;
    reg [2:0] RA2;
    reg [2:0] WA;
    reg [14:0] WD;
    reg WE;
    reg clk;
    reg PC_en;
    // These in flags are not similar to out flags. in flags are for testing jump. out flag is for ALU output
    reg sf_in,zf_in; 
    wire cf_o,sf_o,zf_o;
    wire [14:0] RD2;
    wire [4:0] Output;
    wire [2:0] ins_num;
    wire jump_sel_o;
    cpu uut(RA2,WA,WD,WE,clk,PC_en,sf_in,zf_in,RD2,Output,ins_num,jump_sel_o,cf_o,sf_o,zf_o);
    always begin
        #10;
        clk = ~clk;
    end
    initial begin
        clk <= 1'b0;
        PC_en <= 1'b0;
        WA <=3'b000;
        RA2 <= 3'b010;
        WE <= 1'b1;
        WD <= 15'b010000011110000;
        WE <= 1'b1;
        sf_in <= 1'b1;
        zf_in <= 1'b1;
        #20;
        WA <= 3'b001;
        WD <= 15'b010100000110000;
        #20;
        WA <= 3'b010;
        WD <= 15'b100100000000000;
        #20;
        WE <= 1'b0;
        PC_en <= 1'b1;
        sf_in <= 1'b0;
        zf_in <=1'b1;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;
        sf_in <= 1'b0;
        zf_in <= 1'b0;
        WE <= 1'b1;
        WA <= 3'b011;
        WD <= 15'b100000000000000;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;
        #20;
        $finish;
    end  
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, cpu_tb);
        $monitor("RA2=%b WA=%b WD=%b WE=%b clk=%b PC_en=%b RD2=%b Output=%b ins=%b jump_sel=%b\ncf=%b, sf=%b, zf=%b", RA2,WA,WD,WE,clk,PC_en,RD2,Output,ins_num,jump_sel_o,cf_o,sf_o,zf_o,);
    end
endmodule