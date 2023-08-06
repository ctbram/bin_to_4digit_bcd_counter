`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:43:37 08/06/2023
// Design Name:   top
// Module Name:   C:/Users/ctbram/Desktop/FPGA/00 Work/nexsys2/00 workspace/bin_to_4digit_bcd_counter/test.v
// Project Name:  bin_to_4digit_bcd_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg switch;

	// Outputs
	wire [3:0] anode;
	wire [7:0] cathode;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.switch(switch), 
		.anode(anode), 
		.cathode(cathode)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		switch = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		switch = 1;

	end
      
endmodule

