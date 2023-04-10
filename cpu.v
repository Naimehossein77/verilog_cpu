`include "mux_2x1_3bit.v"
`include "mux_2x1_5bit.v"
`include "pc_3bit.v"
`include "pc_adder_3bit.v"
`include "sram_7x15.v"
`include "control_unit.v"
`include "register_set.v"
`include "ALU_5bit.v"
`include "flag_register.v"
module cpu (
    input wire [2:0] RA2,
    input wire [2:0] WA,
    input wire [14:0] WD,
    input wire WE,
    input wire clk,
    input wire PC_en,
    input wire sf_in,
    input wire zf_in,
    output wire [14:0] RD2,
    output wire [4:0] Output,
    output wire [2:0] ins_num,
    output wire jump_sel_o,
    output wire cf_o,
    output wire zf_o,
    output wire sf_o
    
);
wire CPU_clk = 1'b0;
assign CPU_clk = PC_en & clk;

//CONTROL UNIT VARIABLES
wire [2:0] _I, _O, _O_adder;

//SRAM VARIABLES
wire [14:0] _RD1,_RD2;

//CONTROL UNIT VARIABLES
wire _imm_sel,_reg_en,_jmp_sel;
wire [1:0] _op;

//REGISTER SET VARIABLES
wire [4:0] _A, _B;

//ALU VARIABLES
wire [4:0] _R,_B_sub;

//FLAG REGISTER VARIALBES
wire cf,sf,zf,_cf,_sf,_zf;


//PROGRAM COUNTER
mux_2x1_3bit pc_mux(_O_adder,{_RD1[2],_RD1[1],_RD1[0]},_jmp_sel,_I);
pc_3bit pc(_I,CPU_clk,_O);
pc_adder_3bit pc_adder(_O,_O_adder);

//RAM
sram_7x15 sram(_O,RA2,WA,WD,WE,clk,_RD1,_RD2);

//CONTROL UNIT
control_unit cu({_RD1[14],_RD1[13],_RD1[12],_RD1[11]},_cf,sf_in,zf_in,_imm_sel,_reg_en,_op,_jmp_sel);

//REGISTER SET
register_set reg_set({_RD1[10],_RD1[9]},{_RD1[8],_RD1[7]},{_RD1[10],_RD1[9]},_R,_reg_en,CPU_clk,_A,_B);

//ALU
mux_2x1_5bit imm(_B,{_RD1[8],_RD1[7],_RD1[6],_RD1[5],_RD1[4]},_imm_sel,_B_sub);
ALU_5bit alu(_A,_B_sub,_op,_R,cf,sf,zf);

//FLAG REGISTER
flag_register flag(cf,sf,zf,clk,_cf,_sf,_zf);

assign RD2 = _RD2;
assign Output = _R;
assign cf_o = cf;
assign jump_sel_o = _jmp_sel;
assign ins_num = _O;
assign cf_o = _cf;
assign sf_o = _sf;
assign zf_o = _zf;
endmodule
