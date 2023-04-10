module flag_register (
    input wire cf_in,
    input wire sf_in,
    input wire zf_in,
    input wire clk,
    output wire cf,
    output wire sf,
    output wire zf
);
reg _cf = 0,_sf = 0,_zf = 0;
always @(posedge clk) begin
    _cf <= cf_in;
    _sf <= sf_in;
    _zf <= zf_in;
end
    assign cf = _cf;
    assign sf = _sf;
    assign zf = _zf;
endmodule