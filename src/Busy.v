`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:31 12/20/2017 
// Design Name: 
// Module Name:    Busy 
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
`define op 31:26
`define func 5:0
module Busy(
    input clk,
	 input reset,
	 input [31:0] instr,
	 output busy,
	 input shall
    );
	 wire mult,multu,div,divu,mfhi,mflo,mthi,mtlo;
	 
	 assign mult=((instr[`op]==6'b0)&&(instr[`func]==6'b011000))?1'b1:1'b0;
	 assign multu=((instr[`op]==6'b0)&&(instr[`func]==6'b011001))?1'b1:1'b0;
	 assign div=((instr[`op]==6'b0)&&(instr[`func]==6'b011010))?1'b1:1'b0;
	 assign divu=((instr[`op]==6'b0)&&(instr[`func]==6'b011011))?1'b1:1'b0;
	 assign mfhi=((instr[`op]==6'b0)&&(instr[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo=((instr[`op]==6'b0)&&(instr[`func]==6'b010010))?1'b1:1'b0;
	 assign mthi=((instr[`op]==6'b0)&&(instr[`func]==6'b010001))?1'b1:1'b0;
	 assign mtlo=((instr[`op]==6'b0)&&(instr[`func]==6'b010011))?1'b1:1'b0;
	 
	 wire m_type;
	 assign m_type=mult|multu|div|divu|mfhi|mflo|mthi|mtlo;
	 
	 reg [31:0] mcount;
	 reg [31:0] dcount;
	 
	 initial begin
		mcount=0;
		dcount=0;
	 end
	 
	 always @(posedge clk) begin
		if(reset)begin
			mcount<=0;
			dcount<=0;
		end
		else begin
			if((mcount==0)&&(mult|multu)&&(dcount==0)&&(!shall))begin
				mcount<=1;
			end
			else if((mcount!=0)&&(mcount!=5))begin
				mcount<=mcount+1;
			end
			else if(mcount==5)begin
				mcount<=0;
			end
			else begin
				mcount<=0;
			end
			///////////////////////////////////////
			if((dcount==0)&&(div|divu)&&(mcount==0)&&(!shall))begin
				dcount<=1;
			end
			else if((dcount!=0)&&(dcount!=10))begin
				dcount<=dcount+1;
			end
			else if(dcount==10)begin
				dcount<=0;
			end
			else begin
				dcount<=0;
			end

		end
	 end
    
	 assign busy=((mcount!=0)|(dcount!=0))&&m_type;

endmodule
