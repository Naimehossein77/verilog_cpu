`timescale 1ns/1ps
`include "FA.v"
module adder_5bit(
    input wire [4:0] a,
    input wire [4:0] b,
    input wire cin,
    output wire [4:0] s,
    output wire cout,
    output wire cf,
    output wire sf,
    output wire zf
);
    wire [4:0] c;
    FA sum0(a[0],b[0],cin,s[0],c[0]);
    FA sum1(a[1],b[1],c[0],s[1],c[1]);
    FA sum2(a[2],b[2],c[1],s[2],c[2]);
    FA sum3(a[3],b[3],c[2],s[3],c[3]);
    FA sum4(a[4],b[4],c[3],s[4],c[4]);
    assign cout = c[4];    
    assign cf = c[4];
    assign sf = s[4];
    assign zf = ~s[0] & ~s[1] & ~s[2] & ~s[3] & ~s[4];

endmodule