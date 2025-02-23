module register (
    input CLK,
    input RST,
    input [7:0] D,
    output reg [7:0] Q,
    input ld
);
  always @(posedge CLK or posedge RST) begin
    if (RST) Q <= 8'b00000000;
    else if (ld) Q <= D;
  end
endmodule
