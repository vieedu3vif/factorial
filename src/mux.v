module mux (
    input [7:0] A,
    input [7:0] B,
    input sel,
    output [7:0] Y
);
  assign Y = sel ? A : B;
endmodule
