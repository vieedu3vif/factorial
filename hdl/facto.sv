module facto (
    facto_if.DUT intf
);



    wire ld_i;

    wire ld_fi;

    wire ld_o;

    wire st;

    wire i_lt_x;



    datapath dp (

        .rst_n(intf.rst_n),

        .clk(intf.clk),

        .ld_fi(ld_fi),

        .ld_i(ld_i),

        .ld_o(ld_o),

        .X(intf.X),

        .fi_out(intf.fi_out),

        .st(st),

        .i_lt_x(i_lt_x)

    );



    controller ct (

        .rst_n(intf.rst_n),

        .clk(intf.clk),

        .i_lt_x(i_lt_x),

        .start_i(intf.start_i),

        .ld_fi(ld_fi),

        .ld_i(ld_i),

        .ld_o(ld_o),

        .st(st),

        .Done(intf.Done)

    );



endmodule


