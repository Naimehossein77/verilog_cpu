`include "and_5bit.v"
`include "adder_5bit.v"
`include "ror_5bit.v"
`include "mux_4x1_5bit.v"
`include "mux_4x1_3bit.v"


module ALU_5bit(
    input wire [4:0] a,
    input wire [4:0] b,
    input wire [1:0] op,
    output wire [4:0] R,
    output wire cf,
    output wire sf,
    output wire zf
);

    wire [4:0]_R0,_R1,_R2,_R3;
    wire [2:0] _cf,_sf,_zf;

    adder_5bit add(a,b,1'b0,_R0, _cf[0],_cf[0],_sf[0],_zf[0]);

    and_5bit andd(a,b,_R1,   _cf[1],_sf[1],_zf[1]);
    ror_5bit ror(a,{b[2],b[1],b[0]},_R2,  _cf[2],_sf[2],_zf[2]);
    mux_4x1_5bit result(_R0,_R1,_R2,5'b00000,op,R);
    mux_4x1_3bit flags({_cf[0],_sf[0],_zf[0]},{_cf[1],_sf[1],_zf[1]},{_cf[2],_sf[2],_zf[2]},3'b000,op,{cf,sf,zf});

    
    

endmodule