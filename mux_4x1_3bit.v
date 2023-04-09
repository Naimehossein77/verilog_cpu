module mux_4x1_3bit(
    input wire [2:0] in0,
    input wire [2:0] in1,
    input wire [2:0] in2,
    input wire [2:0] in3,
    input wire [1:0] sel,
    output [2:0] out
);

reg [2:0] _out;

always @(*) begin

    if (sel == 2'b00)
        _out = in0;
    else if (sel == 2'b01)
        _out = in1;
    else if (sel == 2'b10)
        _out = in2;
    else if (sel == 2'b11)
        _out = in3;
end

assign out = _out;
endmodule