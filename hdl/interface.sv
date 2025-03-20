interface facto_if;
	logic clk;
	logic rst_n;
	logic start_i;
	logic [7:0] X;
	logic Done;
	logic [15:0] fi_out;

	modport DUT (
		input clk, rst_n, start_i, X,
		output Done, fi_out
		);

	modport TB (
		output clk, rst_n, start_i, X,
		input Done, fi_out);
endinterface : facto_if