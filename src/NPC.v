`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:05 12/09/2017 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
	 input [31:0] pc,
    input [31:0] pc4,
    input [31:0] instr,
	 input [31:0] offset32,
    input ifj,
	 input ifjr,
	 input ifb,
	 input branch,
    output [31:0] npc
    );
	 assign npc=(ifjr)?offset32:
					(ifj)?{pc[31:28],instr[25:0],2'b0}:
					(ifb&&branch)?({{14{instr[15]}},instr[15:0],2'b0}+pc4):
					(pc4+4);

endmodule
