`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:47:24 08/05/2023 
// Design Name: 
// Module Name:    refreshcounter 
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
module refreshcounter(
input refresh_clk,
output reg [1:0] refreshcounter=0
    );

always@ (posedge refresh_clk) refreshcounter <= refreshcounter+1;

endmodule
