module pc_adder_3bit (
    input wire [2:0] i,
    output wire [2:0] o
);
assign o = i + 1;
endmodule
