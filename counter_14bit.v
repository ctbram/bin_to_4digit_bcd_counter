`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:52 08/05/2023 
// Design Name: 
// Module Name:    counter_8bit 
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
module counter_14bit(
input wire counter_clk_signal,
input wire switch, 			// enable / disable the counter
input wire button,			// reset the counter to 0
output reg [13:0] counter=0 	// 14 bit counter value (0-16383)
    );

always@(posedge counter_clk_signal)
begin	
	// if switch is off or button0 not pressed count is unchanged
	if (switch == 0 || button == 0) begin
		counter <= counter;
	end
	
	// max 14-bit unsigned value is 16383 but my board has only 4 sseg displays so
	// limit counter to 9999 max
	if (switch == 1) begin
		if (counter == 9999) begin	// reset counter to 0 if counter is 9999
			counter <= 0;
		end else begin
			counter <= counter+1;
		end
	end
	
	// zero the counter if button0 pressed
	if (button == 1) begin
		counter <= 0;
	end
end

endmodule
