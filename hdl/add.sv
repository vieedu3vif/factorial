module add (

    input logic [15:0] A,

    input logic [15:0] B,

    output logic [15:0] Y

);

always_comb begin

    Y = A + B;

end

endmodule


