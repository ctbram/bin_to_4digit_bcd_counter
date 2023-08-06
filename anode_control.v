`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:48:00 08/05/2023 
// Design Name: 
// Module Name:    anode_control 
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
module anode_control(
input [1:0] refreshcounter,
output reg [3:0] anode=0
    );

always@ (refreshcounter)
begin
	case (refreshcounter)
		2'b00:
			anode = 4'b1110;  // sseg 1 (right most sseg display)
		2'b01:
			anode = 4'b1101;  // sseg 2
		2'b10:
			anode = 4'b1011;  // sseg 3
		2'b11:
			anode = 4'b0111;  // sseg 4 (left most sseg display)
	endcase
end
endmodule
