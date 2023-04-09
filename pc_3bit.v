module pc_3bit (
    input wire [2:0] i,
    input wire clk,
    output wire [2:0] o
);
    reg [2:0] _reg = 3'b000;
    always @(posedge clk) begin
        _reg <= i;
    end
assign o = _reg;
endmodule