module sram_1x1(
    input wire WD,
    input wire WS,
    input wire RS1,
    input wire RS2,
    input wire clk,
    output wire RD1,
    output wire RD2
);
    reg _reg = 1'b0;
always @(posedge clk) begin
    if(WS)
        _reg <= WD;
end
assign RD1 = RS1 & _reg;
assign RD2 = RS2 & _reg;
endmodule