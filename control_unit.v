module control_unit (
    input wire [3:0] opcode,
    input wire cf,
    input wire sf,
    input wire zf,
    output wire imm_sel,
    output wire reg_en,
    output wire [1:0] op,
    output wire jmp_sel
);
wire _jmp,_je,_or;
assign imm_sel = ~opcode[3] & opcode[2];
assign reg_en = ~(opcode[3] & ~opcode[2]);
assign op = {opcode[1],opcode[0]};

assign _jmp = ~opcode[1] & ~opcode[0];
assign _je = ~sf & zf & ~opcode[1] & opcode[0];
assign _or = _jmp | _je;

assign jmp_sel = ~reg_en & _or;
endmodule