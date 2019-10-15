`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:56 12/10/2017 
// Design Name: 
// Module Name:    mips 
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
`include "Con_D.v"
`include "Con_E.v"
`include "Con_M.v"
`include "Con_W.v"
`include "D.v"
`include "E.v"
`include "F.v"
`include "M.v"
`include "W.v"
`include "Stall.v"
`include "MOVE.v"
`include "Busy.v"
module mips(
    input clk,
    input reset
    );
	 
	 F F(.clk(clk),.reset(reset),.npc(t_FD_npc),.nPc_sel(t_ConD_nPc_sel),.shall(t_shall),.instr(t_FD_instr),.pc(t_FD_pc),.pc4(t_FD_pc4));
	 
	 wire [31:0] t_FD_npc;
	 wire t_ConD_nPc_sel;
	 wire [31:0] t_FD_instr;
	 wire [31:0] t_FD_pc;
	 wire [31:0] t_FD_pc4;
	 
	 D D(.clk(clk),.reset(reset),.instr(t_FD_instr),.pc4(t_FD_pc4),.pc(t_FD_pc),.WA(t_WD_WA),.WD(t_WD_WD),
		  .RegWrite(t_ConW_RegWrite),.ExtOp(t_ConD_ExtOp),.iflui(t_ConD_iflui),.ifj(t_ConD_ifj),.ifjr(t_ConD_ifjr),
		  .ifb(t_ConD_ifb),.shall(t_shall),.write_pc(t_WD_pc),.RD1(t_DE_RD1),.RD2(t_DE_RD2),.ext(t_DE_ext),.instr_out(t_DE_instr),.pc4_out(t_DE_pc4),
		  .pc_out(t_DE_pc),.npc(t_FD_npc),
		  .AO_M(t_MW_alu),.PC4_M(t_MW_pc4),.mf_CMP_A(mf_CMP_A),.mf_CMP_B(mf_CMP_B),.mf_JR(mf_JR),
		  .CMPOp(t_ConD_CMPOp));
	 
	 Con_D Con_D(.instr(t_DE_instr),.nPc_sel(t_ConD_nPc_sel),.ExtOp(t_ConD_ExtOp),.ifb(t_ConD_ifb),.iflui(t_ConD_iflui),
					.ifj(t_ConD_ifj),.ifjr(t_ConD_ifjr),.CMPOp(t_ConD_CMPOp));
					
	 wire [4:0] t_WD_WA;
	 wire [31:0] t_WD_WD;
	 wire t_ConW_RegWrite;
	 wire t_ConD_ExtOp;
	 wire t_ConD_iflui;
	 wire t_ConD_ifj;
	 wire t_ConD_ifjr;
	 wire t_ConD_ifb;
	 wire [31:0] t_ConD_CMPOp;
	 wire [31:0] t_DE_RD1;
	 wire [31:0] t_DE_RD2;
	 wire [31:0] t_DE_ext;
	 wire [31:0] t_DE_instr;
	 wire [31:0] t_DE_pc4;
	 wire [31:0] t_DE_pc;
	 
	 E E(.reset(reset),.clk(clk),.instr(t_DE_instr),.pc(t_DE_pc),.pc4(t_DE_pc4),.RS(t_DE_RD1),.RT(t_DE_RD2),
	     .ext(t_DE_ext),.ALUOp(t_ConE_ALUOp),.ALUSrc(t_ConE_ALUSrc),.shall(t_shall),
		  .instr_out(t_EM_instr),.pc_out(t_EM_pc),.pc4_out(t_EM_pc4),.aluout(t_EM_alu),.rt_out(t_EM_rt),
		  .AO_M(t_MW_alu),.PC4_M(t_MW_pc4),.WD_W(t_WD_WD),.PC4_W(t_WD_pc4),
		  .mf_ALU_A(mf_ALU_A),.mf_ALU_B(mf_ALU_B),.mf_RTout_E(mf_RTout_E),
		  .MDOp(t_ConE_MDOp),.HIWrite(t_ConE_HIWrite),.LOWrite(t_ConE_LOWrite),.MDSrc(t_ConE_MDSrc),.AluoutSrc(t_ConE_AluoutSrc));
		  
	 Con_E Con_E (.instr(t_EM_instr),.ALUOp(t_ConE_ALUOp),.ALUSrc(t_ConE_ALUSrc),
	              .MDOp(t_ConE_MDOp),.HIWrite(t_ConE_HIWrite),.LOWrite(t_ConE_LOWrite),.MDSrc(t_ConE_MDSrc),.AluoutSrc(t_ConE_AluoutSrc));
		  
	 wire [31:0] t_ConE_ALUOp;
	 wire t_ConE_ALUSrc;
	 wire [1:0] t_ConE_MDOp;
	 wire t_ConE_HIWrite;
	 wire t_ConE_LOWrite;
	 wire t_ConE_MDSrc;
	 wire [1:0] t_ConE_AluoutSrc;
	 wire [31:0] t_EM_instr;
	 wire [31:0] t_EM_pc;
	 wire [31:0] t_EM_pc4;
	 wire [31:0] t_EM_alu;
	 wire [31:0] t_EM_rt;
	 
	 M M(.clk(clk),.reset(reset),.instr(t_EM_instr),.pc(t_EM_pc),.pc4(t_EM_pc4),.aluout(t_EM_alu),.rt(t_EM_rt),
	     .MemWrite(t_ConM_MemWrite),.instr_out(t_MW_instr),.pc_out(t_MW_pc),.pc4_out(t_MW_pc4),.alu_out(t_MW_alu),.dmout(t_MW_dm),
		  .WD_W(t_WD_WD),.PC4_W(t_WD_pc4),.mf_DMin_M(mf_DMin_M),
		  .DMin_Src(t_ConM_DMin_Src),.DMout_Src(t_ConM_DMout_Src));
    
	 Con_M Con_M (.instr(t_MW_instr),.MemWrite(t_ConM_MemWrite),.DMin_Src(t_ConM_DMin_Src),.DMout_Src(t_ConM_DMout_Src));
	 
	 wire t_ConM_MemWrite;
	 wire [31:0] t_ConM_DMin_Src;
	 wire [31:0] t_ConM_DMout_Src;
	 wire [31:0] t_MW_instr;
	 wire [31:0] t_MW_pc;
	 wire [31:0] t_MW_pc4;
	 wire [31:0] t_MW_alu;
	 wire [31:0] t_MW_dm;
	 
	 W W(.clk(clk),.reset(reset),.instr(t_MW_instr),.pc(t_MW_pc),.pc4(t_MW_pc4),.ao(t_MW_alu),.dr(t_MW_dm),
	     .RegDst(t_ConW_RegDst),.ifjal(t_ConW_ifjal),.ifjalr(t_ConW_ifjalr),.MemtoReg(t_ConW_MemtoReg),.WA(t_WD_WA),.WD(t_WD_WD),
		  .instr_out(t_WW_instr),.pc_out(t_WD_pc));
	 
	 Con_W Con_W(.instr(t_WW_instr),.RegDst(t_ConW_RegDst),.ifjal(t_ConW_ifjal),.ifjalr(t_ConW_ifjalr),.MemtoReg(t_ConW_MemtoReg),
	             .RegWrite(t_ConW_RegWrite));
    
    wire [31:0] t_WW_instr;
	 wire t_ConW_RegDst;
	 wire t_ConW_ifjal;
	 wire t_ConW_ifjalr;
	 wire t_ConW_MemtoReg;
	 wire [31:0] t_WD_pc;
	 
	 wire [31:0] t_WD_pc4;
	 assign t_WD_pc4=t_WD_pc+4;
	 
	 /////////////////
	 wire t_shall;
	 wire t_shallmaybe;
	 
	 Stall Stall(.instr_D(t_DE_instr),.instr_E(t_EM_instr),.instr_M(t_MW_instr),.shall(t_shallmaybe));
	 	 
	 ///////////////
	 wire [31:0] mf_ALU_A;
	 wire [31:0] mf_ALU_B;
	 wire [31:0] mf_CMP_A;
	 wire [31:0] mf_CMP_B;
	 wire [31:0] mf_DMin_M;
	 wire [31:0] mf_RTout_E;
	 wire [31:0] mf_JR;
	 
	 MOVE MOVE(.instr_D(t_DE_instr),.instr_E(t_EM_instr),.instr_M(t_MW_instr),.instr_W(t_WW_instr),
				  .mf_ALU_A(mf_ALU_A),.mf_ALU_B(mf_ALU_B),.mf_CMP_A(mf_CMP_A),.mf_CMP_B(mf_CMP_B),
				  .mf_DMin_M(mf_DMin_M),.mf_RTout_E(mf_RTout_E),.mf_JR(mf_JR));
	 	  
	 Busy Busy(.clk(clk),.reset(reset),.instr(t_DE_instr),.busy(t_busy),.shall(t_shallmaybe));
	 wire t_busy;
	 assign t_shall=t_shallmaybe|t_busy;
	 
endmodule
