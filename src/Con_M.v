`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:09 12/10/2017 
// Design Name: 
// Module Name:    Con_M 
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
module Con_M(
	 input [31:0] instr,
	 output MemWrite,
	 output [31:0] DMin_Src,
	 output [31:0] DMout_Src
    );
	 
	 wire lw,sw,sh,sb,lh,lhu,lb,lbu;
	 
	 assign lw=(instr[`op]==6'b100011)?1'b1:1'b0;
	 assign sw=(instr[`op]==6'b101011)?1'b1:1'b0;
	 assign sh=(instr[`op]==6'b101001)?1'b1:1'b0;
	 assign sb=(instr[`op]==6'b101000)?1'b1:1'b0;
	 assign lh=(instr[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu=(instr[`op]==6'b100101)?1'b1:1'b0;
	 assign lb=(instr[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu=(instr[`op]==6'b100100)?1'b1:1'b0;

	 assign MemWrite=sw|sh|sb;
	 assign DMin_Src=(sh)?1:
						  (sb)?2:0;
	 assign DMout_Src=(lh)?1:
	                  (lhu)?2:
							(lb)?3:
							(lbu)?4:0;

endmodule
