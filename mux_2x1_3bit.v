module mux_2x1_3bit(
    input wire [2:0] in0,
    input wire [2:0] in1,
    input wire  sel,
    output wire [2:0] out
);

reg [2:0] _out;

always @(*) begin

    if (sel == 1'b0)
        _out = in0;
    else
        _out = in1;
end

assign out = _out;
endmodule