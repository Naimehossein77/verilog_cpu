module and_5bit(
    input wire [4:0] a,
    input wire [4:0] b,
    output wire [4:0] z,
    output wire cf,
    output wire sf,
    output wire zf
);
    assign z[0] = a[0] & b[0];
    assign z[1] = a[1] & b[1];
    assign z[2] = a[2] & b[2];
    assign z[3] = a[3] & b[3];
    assign z[4] = a[4] & b[4];
    assign cf = 1'b0;
    assign sf = z[4];
    assign zf = ~z[0] & ~z[1] & ~z[2] & ~z[3] & ~z[4];
endmodule