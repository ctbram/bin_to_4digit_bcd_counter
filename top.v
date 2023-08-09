`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:50:15 08/05/2023 
// Design Name: 
// Module Name:    top 
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
module top(
input wire clk,
input switch,
input button,
output wire [3:0] anode,
output wire [7:0] cathode
    );
	 
	 
wire refresh_clk;
wire counter_clk_signal;
wire [1:0] refreshcounter;

wire [13:0] bin;
wire [15:0] bcd;
wire [3:0] digit;

clock_divider #(24999) refreah_clk_generator(clk, refresh_clk); // 1kHz clk 
clock_divider #(2499999) counter_clk_generator(clk, counter_clk_signal); // 10 Hz  div = [f_clk/(f_desired*2)] - 1

counter_14bit counter_14bit_uut (
.counter_clk_signal(counter_clk_signal),
.switch(switch),
.button(button),
.counter(bin)			
 );

bin_to_4dig_BCD bin_to_4dig_BCD_uut(
.bin(bin),
.bcd(bcd)
);

refreshcounter refreshcounter_uut (
.refresh_clk(refresh_clk),
.refreshcounter(refreshcounter)
);

anode_control anode_control_uut (
.refreshcounter(refreshcounter),
.anode(anode)
);

BCD_control BCD_control_uut (
.digit1(bcd[3:0]),
.digit2(bcd[7:4]),
.digit3(bcd[11:8]),
.digit4(bcd[15:12]),
.refreshcounter(refreshcounter),
.digit(digit)
);

BCD_to_cathodes BCD_to_cathode_uut (
.digit(digit),
.cathode(cathode)
);

endmodule
