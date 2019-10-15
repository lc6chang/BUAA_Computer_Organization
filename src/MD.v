`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:52 12/20/2017 
// Design Name: 
// Module Name:    MD 
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
module MD(
	 input clk,
	 input reset,
	 input [31:0] A,
	 input [31:0] B,
	 input [1:0] MDOp,
	 input HIWrite,
	 input LOWrite,
	 input MDSrc,
	 output reg [31:0] HI,
	 output reg [31:0] LO
    );
/////////////////////////////////////////////
	 reg [31:0] hi;
	 reg [31:0] low;
	 always @* begin
		if(MDOp==2'b00)begin
			{hi,low}=$signed(A)*$signed(B);
		end
		else if(MDOp==2'b01)begin
			{hi,low}=A*B;
		end
		else if(MDOp==2'b10)begin
			low=$signed(A)/$signed(B);
			hi=$signed(A)%$signed(B);
		end
		else if(MDOp==2'b11)begin
			low=A/B;
			hi=A%B;
		end
	 end
/////////////////////////////////////////////
	 initial begin
		HI=0;
		LO=0;
	 end
	 
	 always @(posedge clk)begin
		if(reset)begin
			HI<=0;
		   LO<=0;
		end
		else begin
			if(HIWrite)begin
				if(MDSrc)begin
					HI<=hi;
				end
				else begin
					HI<=A;
				end
			end
			if(LOWrite)begin
				if(MDSrc)begin
					LO<=low;
				end
				else begin
					LO<=A;
				end
			end
		end
	 end
	 

endmodule
