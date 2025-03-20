module comp (

    input logic [15:0] A,

    input logic [7:0] B,

    output logic Y

);

always_comb begin

    Y = (A < B) ? 1'b1 : 1'b0;

end

endmodule


