module controller (

    input  logic rst_n,   

    input  logic clk,

    input  logic i_lt_x,

    input  logic start_i,

    output logic ld_i,

    output logic ld_fi,

    output logic ld_o,

    output logic st,

    output logic Done

);

    logic [2:0] state, next_state;

    parameter IDLE = 3'b000, LOAD = 3'b001, COMPARE = 3'b010, 

              ADD = 3'b011, MULT = 3'b100, DONE = 3'b101;



    // Cập nhật reset mức thấp

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) 

            state <= IDLE;

        else 

            state <= next_state;

    end



    always_comb begin

        ld_i = 0;

        ld_fi = 0;

        ld_o = 0;

        st = 0;

        Done = 0;

        next_state = state; 



        case (state)

            IDLE: begin

                if (start_i) begin

                    next_state = LOAD;

                    st = 1; 

                    ld_i = 1;

                    ld_fi = 1;

                end

            end

            LOAD: begin

                ld_i = 1;

                ld_fi = 1;

                next_state = COMPARE;

            end

            COMPARE: begin

                if (i_lt_x) 

                    next_state = ADD;

                else begin
                    ld_o = 1;
                    next_state = DONE;
                end
            end

            ADD: begin

                next_state = MULT;

            end

            MULT: begin

                next_state = LOAD;

            end

            DONE: begin

                Done = 1;

                if (!start_i) 

                    next_state = IDLE;

            end

        endcase

    end

endmodule


