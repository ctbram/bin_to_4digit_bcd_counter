`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:49:10 08/05/2023 
// Design Name: 
// Module Name:    BCD_to_cathodes 
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
module BCD_to_cathodes(
input [3:0] digit,
output reg [7:0] cathode=0
    );
always@ (digit)
begin
	case (digit)
		4'd0:
			cathode = 8'b00000011; // zero
		4'd1:
			cathode = 8'b10011111; // one
		4'd2:
			cathode = 8'b00100101; // two
		4'd3:
			cathode = 8'b00001101; // three
		4'd4:
			cathode = 8'b10011001; // four
		4'd5:
			cathode = 8'b01001001; // five
		4'd6:
			cathode = 8'b01000001; // six
		4'd7:
			cathode = 8'b00011111; // seven
		4'd8:
			cathode = 8'b00000001; // eight
		4'd9:
			cathode = 8'b00001001; // nine
		default:
			cathode = 8'b11111111; // blank sseg display if digit not 0-9
	endcase
end

endmodule
