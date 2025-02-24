module add (
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] Y
);
always @(*) begin
    Y = A +B;
end
endmodule