`timescale 1ns/1ps
`include "control_unit.v"

module control_unit_tb;
    reg [3:0] opcode;
    reg cf,sf,zf;
    wire [1:0] op;
    wire imm_sel,reg_en,jmp_sel;
    

    control_unit uut(opcode,cf,sf,zf,imm_sel,reg_en,op,jmp_sel);

    initial begin
        opcode <= 4'b0000;
        cf <= 1'b0;
        sf <= 1'b0;
        zf <= 1'b0;
        #20;
        opcode <= 4'b0000;
        #20;
        opcode <= 4'b0001;
        #20;
        opcode <= 4'b0100;
        #20;
        opcode <= 4'b0101;
        #20;
        opcode <= 4'b1000;
        #20;
        opcode <= 4'b1001;
        #20;
        opcode <= 4'b1001;
        zf <= 1'b1;
        #20;
        sf <= 1'b1;
        #20;
        zf <= 1'b0;
        $finish;
    end
    
    initial begin
        $dumpfile("control_unit.vcd");
        $dumpvars(0, control_unit_tb);
        $monitor("opcode=%b op=%b imm_sel=%b reg_en=%b jmp_sel=%b\ncf=%b sf=%b zf=%b",opcode,op,imm_sel,reg_en,jmp_sel,cf,sf,zf);
    end
endmodule