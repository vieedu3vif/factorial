module register (

    input  logic clk,

    input  logic rst_n,   // Reset tích cực mức thấp

    input  logic [15:0] D,

    output logic [15:0] Q,

    input  logic ld

);

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) 

            Q <= 16'b00000000;

        else if (ld) 

            Q <= D;

    end

endmodule


