module register_1bit(
    input wire Din,
    input wire sel,
    input wire clk,
    output wire Dout
);
    reg _reg = 1'b0;
always @(posedge clk) begin
    if(sel)
        _reg <= Din;
end

assign Dout = _reg;
    
endmodule