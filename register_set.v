//5 bit register set with 4 registers
`include "decoder_2x4.v"
`include "register_5bit.v"
// `include "mux_4x1_5bit.v"

module register_set (
    input wire [1:0] Ra,
    input wire [1:0] Rb,
    input wire [1:0] Wr,
    input wire [4:0] Wrd,
    input wire reg_en,
    input wire clk,
    output wire [4:0] a,
    output wire [4:0] b
);
    input wire [3:0] _reg_sel;
    input wire [4:0] _R0,_R1,_R2,_R3;
    decoder_2x4 select_register(reg_en,Wr,_reg_sel);
    register_5bit reg0(Wrd,_reg_sel[0],clk,_R0);
    register_5bit reg1(Wrd,_reg_sel[1],clk,_R1);
    register_5bit reg2(Wrd,_reg_sel[2],clk,_R2);
    register_5bit reg3(Wrd,_reg_sel[3],clk,_R3);
    mux_4x1_5bit selected_a(_R0,_R1,_R2,_R3,Ra,a);
    mux_4x1_5bit selected_b(_R0,_R1,_R2,_R3,Rb,b);
    
endmodule