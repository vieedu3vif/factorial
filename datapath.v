`include "add.v"
`include "mul.v"
`include "mux.v"
`include "register.v"
`include "comp.v"
module datapath (
    input [7:0] X,
    input CLK,
    input RST,
    input ld_i,
    input ld_fi,
    input ld_o,
    input st,
    output i_lt_x,
    output [7:0] fi_out
);
wire [7:0] X_src;
wire [7:0] fi_mul;
wire [7:0] fi_src;
wire [7:0] i_add;
wire [7:0] i_out;
wire [7:0] fi;
register regI(
    .RST(RST),
    .CLK(CLK),
    .ld(ld_i),
    .D(X_src),
    .Q(i_out)
);
register regfi(
    .RST(RST),
    .CLK(CLK),
    .ld(ld_fi),
    .D(fi_src),
    .Q(fi)
);
register regout(
    .RST(RST),
    .CLK(CLK),
    .ld(ld_o),
    .D(fi),
    .Q(fi_out)
);
mux muxX (
    .A(8'b00000001),
    .B(i_add),
    .sel(st),
    .Y(X_src)
);
mux muxfi (
    .A(8'b00000001),
    .B(fi_mul),
    .sel(st),
    .Y(fi_src)
);
add add(
    .A(i_out),
    .B(8'b00000001),
    .Y(i_add)
);
mul mul(
    .A(i_add),
    .B(fi),
    .Y(fi_mul)
);
comp comp (
    .A(i_out),
    .B(X),
    .Y(i_lt_x)
);


endmodule