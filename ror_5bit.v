module ror_5bit(
    input wire [4:0] a,
    input wire [2:0] shift,
    output wire [4:0] z,
    output wire cf,
    output wire sf,
    output wire zf
);
    reg [4:0] _z;
always @(*) begin
    if (shift%5==0) begin
        _z = a;
    end
    else if (shift%5==1) begin
        _z[4] = a[0];
        _z[3] = a[4];
        _z[2] = a[3];
        _z[1] = a[2];
        _z[0] = a[1];
    end
    else if (shift%5==2) begin
        _z[4] = a[1];
        _z[3] = a[0];
        _z[2] = a[4];
        _z[1] = a[3];
        _z[0] = a[2];
    end
    else if (shift%5==3) begin
        _z[4] = a[2];
        _z[3] = a[1];
        _z[2] = a[0];
        _z[1] = a[4];
        _z[0] = a[3];
    end
    else if (shift%5==4) begin
        _z[4] = a[3];
        _z[3] = a[2];
        _z[2] = a[1];
        _z[1] = a[0];
        _z[0] = a[4];
    end
end



    assign z = _z;
    assign cf = 1'b0;
    assign sf = z[4];
    assign zf = ~z[0] & ~z[1] & ~z[2] & ~z[3] & ~z[4];
endmodule