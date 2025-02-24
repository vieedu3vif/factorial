`include "datapath.v"
module datapath_tb();
    reg [7:0] X;
    reg CLK, RST, ld_i, ld_fi, ld_o, st;
    wire i_lt_x;
    wire [7:0] fi_out;

    datapath dp (
        .X(X),
        .CLK(CLK),
        .RST(RST),
        .ld_i(ld_i),
        .ld_fi(ld_fi),
        .ld_o(ld_o),
        .st(st),
        .i_lt_x(i_lt_x),
        .fi_out(fi_out)
    );

    initial begin
        $dumpfile("datapath_tb.vcd");
        $dumpvars(0, datapath_tb);
        
        // Khởi tạo tín hiệu
        CLK = 0; RST = 1; ld_i = 0; ld_fi = 0; ld_o = 0; st = 1; X = 8'd3;
        #5 RST = 0; 

        // Bật ld_i để ghi i_out = 1
        #10 ld_i = 1; #10 ld_i = 0;

        // Bật ld_fi để ghi fi = 1
        #10 ld_fi = 1; #10 ld_fi = 0;

        // Bật ld_o để ghi fi_out
        #10 ld_o = 1; #10 ld_o = 0;

        // Bắt đầu chạy vòng lặp factorial
        repeat(3) begin
            #10 st = 0; ld_i = 1; #10 ld_i = 0;
            #10 ld_fi = 1; #10 ld_fi = 0;
        end
        
        #50 $finish;
    end

    always #5 CLK = ~CLK; // Tạo xung clock 10ns
endmodule
