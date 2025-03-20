
class Test; 
	randc bit [7:0] x;
	constraint c {
		x inside {[2:8]};
	}
	task run();
		facto_tb.intf.X = x;
	endtask : run
endclass : Test

module facto_tb;
	facto_if intf();
	facto dut (intf.DUT);

	always #5 intf.clk = ~intf.clk;
	Test testfactor = new ();
function automatic logic [15:0] factorial(logic [7:0] n);
    logic [15:0] result = 1;
    for (int i = 1; i <= n; i++) result *= i;
    return result;
endfunction

property factorial_check;
    @(posedge intf.Done) disable iff (!intf.rst_n)
     ##1 (intf.fi_out == factorial(intf.X));
endproperty

assert property (factorial_check)
    else $error("Not success");
	initial begin
		intf.clk = 0;
		intf.rst_n =0;

		intf.X = 0;

		for(int i =0; i< 8; i++) begin
			if(testfactor.randomize()) begin
				#25
				intf.rst_n = 0;
				#10
				intf.rst_n = 1; 
				#10
				intf.start_i = 1;
				testfactor.run();
				@(posedge intf.Done); 
				#5
				$display("X = %d, factorial of x = %d", intf.X, intf.fi_out);
				intf.start_i = 0; 
			end 
			else 
				$display("Failed");
		end

		#20
		$finish;
	end

endmodule : facto_tb