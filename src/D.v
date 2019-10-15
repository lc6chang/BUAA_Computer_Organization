`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:21 12/09/2017 
// Design Name: 
// Module Name:    D 
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
`include "GRF.v"
`include "EXT.v"
`include "CMP.v"
`include "NPC.v"
module D(
	 input clk,
	 input reset,
	 input [31:0]instr,
	 input [31:0]pc4,
	 input [31:0]pc,
	 input [4:0]WA,
	 input [31:0]WD,
	 input RegWrite,
	 input ExtOp,
	 input iflui,
	 input ifj,
	 input ifjr,
	 input ifb,
	 input shall,
	 input [31:0] write_pc,
	 output [31:0] RD1,
	 output [31:0] RD2,
	 output [31:0] ext,
	 output [31:0] instr_out,
	 output [31:0] pc4_out,
	 output [31:0] pc_out,
	 output [31:0] npc,
	 input [31:0] AO_M,
	 input [31:0] PC4_M,
	 input [31:0] mf_CMP_A,
	 input [31:0] mf_CMP_B,
	 input [31:0] mf_JR,
	 input [31:0] CMPOp
	 
    );
	 //ÉêÇëÁ÷Ë®Ïß¼Ä´æÆ÷//
	 reg [31:0] IR_D;
	 reg [31:0] PC4_D;
	 reg [31:0] PC_D;
	 
	 initial begin
		IR_D=0;
		PC4_D=0;
		PC_D=0;
	 end
	 
	 always@(posedge clk)begin
		if(reset)begin
			IR_D<=0;
			PC4_D<=0;
			PC_D<=0;
		end
		else if(!shall)begin
			IR_D<=instr;
			PC4_D<=pc4;
			PC_D<=pc;
		end
	 end
	 
	 wire [31:0] t_instr;
	 wire [31:0] t_pc4;
	 wire [31:0] t_pc;
	 wire [31:0] maybe_rd1;
	 wire [31:0] maybe_rd2;
	 wire [31:0] t_rd1;
	 wire [31:0] t_rd2;
	 wire t_branch;
	 
	 assign t_instr=IR_D;
	 assign t_pc4=PC4_D;
	 assign t_pc=PC_D;

	 assign instr_out=IR_D;
	 assign pc4_out=PC4_D;
	 assign pc_out=PC_D;
	 assign RD1=t_rd1;
	 assign RD2=t_rd2;
	 
	 
	 assign t_rd1=(RegWrite&(t_instr[25:21]==WA)&(WA!=5'b0))?WD:maybe_rd1;
	 assign t_rd2=(RegWrite&(t_instr[20:16]==WA)&(WA!=5'b0))?WD:maybe_rd2;
	 
	 wire [31:0] t_jr;
	 assign t_jr=(mf_JR==1)?AO_M:
					 (mf_JR==2)?(PC4_M+4):
					 t_rd1;
	
	 wire [31:0] t_cmpa;
	 wire [31:0] t_cmpb;
	 
	 assign t_cmpa=(mf_CMP_A==1)?AO_M:
						(mf_CMP_A==2)?(PC4_M+4):t_rd1;
	 assign t_cmpb=(mf_CMP_B==1)?AO_M:
						(mf_CMP_B==2)?(PC4_M+4):t_rd2;
						
	 GRF GRF(.reset(reset),.clk(clk),.RA1(t_instr[25:21]),.RA2(t_instr[20:16]),
	         .WA(WA),.WD(WD),.RegWrite(RegWrite),.pc(write_pc),.RD1(maybe_rd1),.RD2(maybe_rd2));
	 EXT EXT(.imm(t_instr[15:0]),.extout(ext),.ExtOp(ExtOp),.iflui(iflui));
	 CMP CMP(.D1(t_cmpa),.D2(t_cmpb),.result(t_branch),.CMPOp(CMPOp));
	 NPC NPC(.pc(t_pc),.pc4(t_pc4),.instr(t_instr),.offset32(t_jr),.ifj(ifj),.ifjr(ifjr),.ifb(ifb),.branch(t_branch),.npc(npc));
	 
	 
	 
	 
	 


endmodule
