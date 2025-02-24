`timescale 1ns / 1ps

module comp_tb;
  reg [7:0] A, B;  // Định nghĩa các tín hiệu đầu vào
  wire Y;          // Định nghĩa tín hiệu đầu ra

  // Khởi tạo module comp để test
  comp uut (
    .A(A),
    .B(B),
    .Y(Y)
  );

  initial begin
    // Mở file để ghi kết quả mô phỏng (tùy simulator)
    $dumpfile("comp_tb.vcd");
    $dumpvars(0, comp_tb);
    
    // Test case 1: A < B (Y phải bằng 1)
    A = 8'd1; B = 8'd2; #10;
    $display("A = %d, B = %d, Y = %b (Expected: 1)", A, B, Y);
    
    // Test case 2: A > B (Y phải bằng 0)
    A = 8'd3; B = 8'd2; #10;
    $display("A = %d, B = %d, Y = %b (Expected: 0)", A, B, Y);
    
    // Test case 3: A = B (Y phải bằng 0)
    A = 8'd8; B = 8'd8; #10;
    $display("A = %d, B = %d, Y = %b (Expected: 0)", A, B, Y);
    
    // Test case 4: A lớn nhất, B nhỏ nhất (Y phải bằng 0)
    A = 8'd255; B = 8'd1; #10;
    $display("A = %d, B = %d, Y = %b (Expected: 0)", A, B, Y);
    
    // Test case 5: A nhỏ nhất, B lớn nhất (Y phải bằng 1)
    A = 8'd0; B = 8'd255; #10;
    $display("A = %d, B = %d, Y = %b (Expected: 1)", A, B, Y);
    
    $finish; // Kết thúc mô phỏng
  end
endmodule
