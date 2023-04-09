`include "register_1bit.v"

module register_5bit(
    input wire [4:0] Din,
    input wire sel,
    input wire clk,
    output wire [4:0] Dout
);

register_1bit reg0(Din[0],sel,clk,Dout[0]); 
register_1bit reg1(Din[1],sel,clk,Dout[1]); 
register_1bit reg2(Din[2],sel,clk,Dout[2]); 
register_1bit reg3(Din[3],sel,clk,Dout[3]); 
register_1bit reg4(Din[4],sel,clk,Dout[4]); 

endmodule