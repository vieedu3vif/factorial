module mux (

    input  logic [15:0] A,

    input  logic [15:0] B,

    input  logic sel,

    output logic [15:0] Y

);

    assign Y = sel ? A : B;

endmodule


