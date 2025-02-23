module comp (
    input [7:0] A,
    input [7:0] B,
    output reg  Y
);
always @(*) begin
    if (A < B) Y = 1'b1;
    else Y = 1'b0;
end
endmodule