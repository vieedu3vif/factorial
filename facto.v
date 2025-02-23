`include "datapath.v"
`include "controller.v"
module facto(
    input RST,
    input CLK,
    input [7:0] X,
    input start_i,
    output Done,
    output [7:0] fi_out
);
wire ld_i;
wire ld_fi;
wire ld_o;
wire st;
wire i_lt_x;
datapath dp (
    .RST(RST),
    .CLK(CLK),
    .ld_fi(ld_fi),
    .ld_i(ld_i),
    .ld_o(ld_o),
    .X(X),
    .fi_out(fi_out),
    .st(st),
    .i_lt_x(i_lt_x)
);
controller ct(
    .RST(RST),
    .CLK(CLK),
    .i_lt_x(i_lt_x),
    .start_i(start_i),
    .ld_fi(ld_fi),
    .ld_i(ld_i),
    .ld_o(ld_o),
    .st(st),
    .Done(Done)
);

endmodule