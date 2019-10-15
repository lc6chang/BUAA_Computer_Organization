`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:12 12/09/2017 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [31:0] pc,
    output [31:0] instr
    );
	 integer i;
	 reg [31:0] im [4095:0];
	 initial begin
		for(i=0;i<4096;i=i+1)begin
			im[i]=0;
		end
		$readmemh("code.txt",im);
	 end
	 wire [31:0] addr;
	 assign addr=pc-32'h00003000;
	 assign instr=im[addr[13:2]];
	 

endmodule
