`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:07 12/09/2017 
// Design Name: 
// Module Name:    F 
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
`include "PC.v"
`include "IM.v"
module F(
    input clk,
    input reset,
    input [31:0] npc,
    input nPc_sel,
	 input shall,
    output [31:0] instr,
	 output [31:0] pc,
    output [31:0] pc4
    );
	 
	 wire [31:0] in_newpc;
	 wire [31:0] t_pc;
	 wire [31:0] t_pc4;
	 
	 assign t_pc4=t_pc+4;
	 assign pc=t_pc;
	 assign pc4=t_pc4;
	 
	 assign in_newpc=(nPc_sel==1)?npc:t_pc4;
	 
	 
	 PC PC(.reset(reset),.clk(clk),.shall(shall),.newpc(in_newpc),.pc(t_pc));
	 IM IM(.pc(t_pc),.instr(instr));
	 
	 


endmodule
