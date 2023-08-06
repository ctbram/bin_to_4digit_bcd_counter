`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:11 08/04/2023 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: counter based clock divider
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider #(parameter div_val = 24999)( // make div_val global
input wire clk, 				// 50Mhz clk
output reg divided_clk = 0	// 1hz => 0.5 sec on 0.5 sec off
    );
	 
// f = 50Mhz T=1/50Mhz 
// I want a 1ms - 4ms period to display each sseg display. 4ms per anode starts to show flicking so I use 1ms
// so for 1ms take 1ms/T == div_val == 0.001/0.00000002 == 50000 - 1 (because counting is zero based)
//localparam div_val = 49999;  

// counter
integer counter_value = 0;  // 32bit wide register bus
always@ (posedge clk)
begin
	if(counter_value == div_val)
		counter_value <= 0; // reset the counter
	else
		counter_value <= counter_value + 1;
end

// dividee the clk
always@ (posedge clk)
begin
	if(counter_value == div_val)
		divided_clk <= ~divided_clk;	// flip the divided_clk
	else
		divided_clk <= divided_clk;	// don't flip the divided clk
end

endmodule
