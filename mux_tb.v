`timescale 1ns / 1ps

module mux_tb;
  reg [7:0] A, B;
  reg sel;
  wire [7:0] Y;

  // Instantiate module
  mux uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
  );

  initial begin
    $dumpfile("mux_tb.vcd"); 
    $dumpvars(0, mux_tb);

    // Test case 1: sel = 0 -> Y = B
    A = 8'b00001111;
    B = 8'b11110000;
    sel = 0;
    #10;
    
    // Test case 2: sel = 1 -> Y = A
    sel = 1;
    #10;

    // Test case 3: Change A and B
    A = 8'b10101010;
    B = 8'b01010101;
    sel = 0;
    #10;
    
    // Test case 4: sel = 1 -> Y = A
    sel = 1;
    #10;

    // Kết thúc mô phỏng
    $finish;
  end

  initial begin
    $monitor("Time = %0t | A = %b | B = %b | sel = %b | Y = %b", $time, A, B, sel, Y);
  end

endmodule
