`timescale 1ns/1ps
`include "flag_register.v"


module flag_register_tb;
    reg cf,sf,zf,clk;
    wire cf_out;
    wire sf_out;
    wire zf_out;

    always begin
        #10;
        clk = ~clk;
    end

    flag_register uut(cf,sf,zf,clk,cf_out,sf_out,zf_out);

    initial begin
        cf <= 0;
        sf <= 0;
        zf <= 0;
        #20;
        cf <= 1;
        #20;
        zf <= 1;
        #20;
        
        cf <= 1;
        sf <= 1;
        zf <= 1;
        #20;
        
        $finish;
    end
    initial begin
        $dumpfile("flag_register.vcd");
        $dumpvars(0, flag_register_tb);
        $monitor("cf=%b, sf=%b, zf=%b", cf,sf,zf);
    end
endmodule