`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:48:23 08/05/2023 
// Design Name: 
// Module Name:    BCD_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BCD_control(
input [3:0] digit1, // ones
input [3:0] digit2, // tens
input [3:0] digit3, // hundreds
input [3:0] digit4, // thousands
input [1:0] refreshcounter,
output reg [3:0] digit=0 // chose which input digit is to be displayed
    );
	 
always@ (*) // if any input changes.  really we only care about refreshcounter but ise complains about
				// digit1, digit2, digit3, and digit4 being missing from the sensitivity list and will add
				// them on its own if nt specified
begin
	case (refreshcounter)
		2'd0:
			digit = digit1;  // digit 1 value (right most)
		2'd1:
			digit = digit2;  // digit 2 value
		2'd2:
			digit = digit3;  // digit 3 value
		2'd3:
			digit = digit4;  // digit 4 value (left most)
	endcase
end
endmodule
