module controller (
    input RST,
    input CLK,
    input i_lt_x,
    input start_i,
    output reg ld_i,
    output reg ld_fi,
    output reg ld_o,
    output reg st,
    output reg Done
);
  reg [2:0] state, next_state;
  parameter IDLE = 3'b000, LOAD = 3'b001, COMPARE = 3'b010, ADD = 3'b011, MULT = 3'b100, DONE = 3'b101;

  always @(posedge CLK or posedge RST) begin
    if (RST) 
      state <= IDLE;
    else 
      state <= next_state;
  end

  always @(*) begin
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
        else 
          next_state = DONE;
      end
      ADD: begin
        next_state = MULT;
      end
      MULT: begin
        next_state = LOAD;
      end
      DONE: begin
        ld_o = 1;
        Done = 1;
        if (!start_i) 
          next_state = IDLE;
      end
    endcase
  end
endmodule
