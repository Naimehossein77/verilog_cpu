module mux_2x1_1bit(
    input wire  in0,
    input wire  in1,
    input wire  sel,
    output wire out
);
reg _out;
always @(*) begin
    if (sel == 1'b0)
        _out = in0;
    else
        _out = in1;
end
assign out = _out;
endmodule