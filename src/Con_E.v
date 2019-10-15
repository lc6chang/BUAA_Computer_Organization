`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:44 12/10/2017 
// Design Name: 
// Module Name:    Con_E 
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
module Con_E(
	 input [31:0] instr,
	 output [31:0] ALUOp,
	 output ALUSrc,
	 output [1:0] MDOp,
	 output HIWrite,
	 output LOWrite,
	 output MDSrc,
	 output [1:0] AluoutSrc
    );
	 
	 
	 wire addu,subu,add,sub,sll,srl,sra,sllv,srlv,srav,AND,OR,XOR,NOR,slt,sltu;
	 wire lui,ori,addi,addiu,andi,xori,slti,sltiu;
	 wire mult,multu,div,divu,mfhi,mflo,mthi,mtlo;
	 wire sw,sh,sb,lw,lh,luh,lb,lbu;
	
	 assign addu=((instr[`op]==6'b0)&&(instr[`func]==6'b100001))?1'b1:1'b0;
	 assign subu=((instr[`op]==6'b0)&&(instr[`func]==6'b100011))?1'b1:1'b0;
	 assign add=((instr[`op]==6'b0)&&(instr[`func]==6'b100000))?1'b1:1'b0;
	 assign sub=((instr[`op]==6'b0)&&(instr[`func]==6'b100010))?1'b1:1'b0;
	 assign sll=((instr[`op]==6'b0)&&(instr[`func]==6'b000000))?1'b1:1'b0;
	 assign srl=((instr[`op]==6'b0)&&(instr[`func]==6'b000010))?1'b1:1'b0;
	 assign sra=((instr[`op]==6'b0)&&(instr[`func]==6'b000011))?1'b1:1'b0;
	 assign sllv=((instr[`op]==6'b0)&&(instr[`func]==6'b000100))?1'b1:1'b0;
	 assign srlv=((instr[`op]==6'b0)&&(instr[`func]==6'b000110))?1'b1:1'b0;
	 assign srav=((instr[`op]==6'b0)&&(instr[`func]==6'b000111))?1'b1:1'b0;
	 assign AND=((instr[`op]==6'b0)&&(instr[`func]==6'b100100))?1'b1:1'b0;
	 assign OR=((instr[`op]==6'b0)&&(instr[`func]==6'b100101))?1'b1:1'b0;
	 assign XOR=((instr[`op]==6'b0)&&(instr[`func]==6'b100110))?1'b1:1'b0;
	 assign NOR=((instr[`op]==6'b0)&&(instr[`func]==6'b100111))?1'b1:1'b0;
	 assign slt=((instr[`op]==6'b0)&&(instr[`func]==6'b101010))?1'b1:1'b0;
	 assign sltu=((instr[`op]==6'b0)&&(instr[`func]==6'b101011))?1'b1:1'b0;
	 assign lw=(instr[`op]==6'b100011)?1'b1:1'b0;
	 assign sw=(instr[`op]==6'b101011)?1'b1:1'b0;
	 assign sh=(instr[`op]==6'b101001)?1'b1:1'b0;
	 assign sb=(instr[`op]==6'b101000)?1'b1:1'b0;
	 assign lh=(instr[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu=(instr[`op]==6'b100101)?1'b1:1'b0;
	 assign lb=(instr[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu=(instr[`op]==6'b100100)?1'b1:1'b0;	 
	 
	 assign ori=(instr[`op]==6'b001101)?1'b1:1'b0;
	 assign lui=(instr[`op]==6'b001111)?1'b1:1'b0;
	 assign addi=(instr[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu=(instr[`op]==6'b001001)?1'b1:1'b0;
	 assign andi=(instr[`op]==6'b001100)?1'b1:1'b0;
	 assign xori=(instr[`op]==6'b001110)?1'b1:1'b0;
	 assign slti=(instr[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu=(instr[`op]==6'b001011)?1'b1:1'b0;

    assign mult=((instr[`op]==6'b0)&&(instr[`func]==6'b011000))?1'b1:1'b0;
	 assign multu=((instr[`op]==6'b0)&&(instr[`func]==6'b011001))?1'b1:1'b0;
	 assign div=((instr[`op]==6'b0)&&(instr[`func]==6'b011010))?1'b1:1'b0;
	 assign divu=((instr[`op]==6'b0)&&(instr[`func]==6'b011011))?1'b1:1'b0;
	 assign mfhi=((instr[`op]==6'b0)&&(instr[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo=((instr[`op]==6'b0)&&(instr[`func]==6'b010010))?1'b1:1'b0;
	 assign mthi=((instr[`op]==6'b0)&&(instr[`func]==6'b010001))?1'b1:1'b0;
	 assign mtlo=((instr[`op]==6'b0)&&(instr[`func]==6'b010011))?1'b1:1'b0;

	 assign ALUSrc=ori|sw|lw|lui|sh|sb|lh|lhu|lb|lbu|
	               addi|addiu|andi|xori|slti|sltiu;
	 assign ALUOp=(sub|subu)?1:
	               (sll)?2:
						(srl)?3:
						(sra)?4:
						(sllv)?5:
						(srlv)?6:
						(srav)?7:
						(AND|andi)?8:
						(OR|ori)?9:
						(XOR|xori)?10:
						(NOR)?11:
						(slt|slti)?12:
						(sltu|sltiu)?13:0;
	 assign MDOp[0]=multu|divu;
	 assign MDOp[1]=div|divu;
	 assign HIWrite=mult|multu|div|divu|mthi;
	 assign LOWrite=mult|multu|div|divu|mtlo;
	 assign MDSrc=mult|multu|div|divu;
	 assign AluoutSrc[0]=mfhi;
	 assign AluoutSrc[1]=mflo;
	 


endmodule
