`include "facto.v"
`timescale 1ns/1ns
module facto_tb;
    reg RST;
    reg CLK;
    reg [7:0] X;
    reg start_i;
    wire Done;
    wire [7:0] fi_out;
facto uut (
    .RST(RST),
    .CLK(CLK),
    .X(X),
    .start_i(start_i),
    .Done(Done),
    .fi_out(fi_out)
);
always #5 CLK = ~ CLK;
initial begin
    $dumpfile("facto.vcd");
    $dumpvars(0, facto_tb);
    CLK = 0; RST = 1; start_i = 0;
    
    #10
    RST = 0;
    X = 8'd4;
    start_i = 1;
    #60
    start_i = 0;
    wait(Done==1);
    $display("factorial:%d", fi_out);

    #20;
    $finish;
end

endmodule