module mux_2x1_5bit(
    input wire [4:0] in0,
    input wire [4:0] in1,
    input wire  sel,
    output wire [4:0] out
);
reg [4:0] _out;
always @(*) begin
    if (sel == 1'b0)
        _out = in0;
    else
        _out = in1;
end
assign out = _out;
endmodule