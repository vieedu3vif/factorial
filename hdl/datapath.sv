module datapath (

    input  logic [7:0] X,

    input  logic clk,

    input  logic rst_n,   

    input  logic ld_i,

    input  logic ld_fi,

    input  logic ld_o,

    input  logic st,

    output logic i_lt_x,

    output logic [15:0] fi_out

);



    logic [15:0] X_src;

    logic [15:0] fi_mul;

    logic [15:0] fi_src;

    logic [15:0] i_add;

    logic [15:0] i_out;

    logic [15:0] fi;



    register regI (

        .rst_n(rst_n),

        .clk(clk),

        .ld(ld_i),

        .D(X_src),

        .Q(i_out)

    );



    register regfi (

        .rst_n(rst_n),

        .clk(clk),

        .ld(ld_fi),

        .D(fi_src),

        .Q(fi)

    );



    register regout (

        .rst_n(rst_n),

        .clk(clk),

        .ld(ld_o),

        .D(fi),

        .Q(fi_out)

    );



    mux muxX (

        .A(16'b00000001),

        .B(i_add),

        .sel(st),

        .Y(X_src)

    );



    mux muxfi (

        .A(16'b00000001),

        .B(fi_mul),

        .sel(st),

        .Y(fi_src)

    );



    add add_inst (

        .A(i_out),

        .B(16'b00000001),

        .Y(i_add)

    );



    mul mul_inst (

        .A(i_add),

        .B(fi),

        .Y(fi_mul)

    );



    comp comp_inst (

        .A(i_out),

        .B(X),

        .Y(i_lt_x)

    );



endmodule
