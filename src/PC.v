`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:55 12/09/2017 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input reset,
    input clk,
	 input shall,
    input [31:0] newpc,
    output [31:0] pc
    );
	 reg [31:0]_pc;
	 assign pc=_pc;
	 initial begin
		_pc=32'h00003000;
	 end
	 always@(posedge clk)begin
		if(reset)begin
			_pc<=32'h00003000;
		end
		else begin
			if(!shall)begin
				_pc<=newpc;
			end
		end
	 end
	 
	

endmodule
