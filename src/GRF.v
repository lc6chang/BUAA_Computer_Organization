`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:17 12/09/2017 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
	 input reset,
	 input clk,
    input [4:0] RA1,
    input [4:0] RA2,
    input [4:0] WA,
    input [31:0] WD,
    input RegWrite,
	 input [31:0] pc,
    output [31:0] RD1,
    output [31:0] RD2
    );
	 reg [31:0] _reg [31:0];
	 integer i;
	 initial begin
		for(i=0;i<32;i=i+1)begin
			_reg[i]=0;
		end
	 end
	 
	 assign RD1=_reg[RA1];
	 assign RD2=_reg[RA2];
	 
	 always @(posedge clk)begin
		if(reset)begin
			for(i=0;i<32;i=i+1)begin
				_reg[i]<=0;
			end
		end
		else begin
			if(RegWrite==1)begin
				if(WA!=5'b0)begin
					_reg[WA]<=WD;
					$display("%d@%h: $%d <= %h", $time, pc, WA,WD);
				end
			end
		end
	 end 
	 
endmodule
