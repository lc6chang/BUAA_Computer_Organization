`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:02 12/10/2017 
// Design Name: 
// Module Name:    Con_W 
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
module Con_W(
	 input [31:0] instr,
	 output RegDst,
	 output ifjal,
	 output ifjalr,
	 output MemtoReg,
	 output RegWrite
    );
	 

	 wire addu,subu,ori,lw,sw,beq,lui,j,jal,jr,jalr,sh,sb,lh,lhu,lb,lbu;
	 wire add,sub,sll,srl,sra,sllv,srlv,srav,AND,OR,XOR,NOR,addi,addiu,andi,
	      xori,slt,slti,sltiu,sltu;
	 wire mfhi,mflo;
	
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
	 
	 assign ori=(instr[`op]==6'b001101)?1'b1:1'b0;
	 assign lui=(instr[`op]==6'b001111)?1'b1:1'b0;
	 assign addi=(instr[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu=(instr[`op]==6'b001001)?1'b1:1'b0;
	 assign andi=(instr[`op]==6'b001100)?1'b1:1'b0;
	 assign xori=(instr[`op]==6'b001110)?1'b1:1'b0;
	 assign slti=(instr[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu=(instr[`op]==6'b001011)?1'b1:1'b0;	 

	 assign jal=(instr[`op]==6'b000011)?1'b1:1'b0;
	 assign jalr=((instr[`op]==6'b0)&&(instr[`func]==6'b001001))?1'b1:1'b0;

	 assign lw=(instr[`op]==6'b100011)?1'b1:1'b0;
	 assign lh=(instr[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu=(instr[`op]==6'b100101)?1'b1:1'b0;
	 assign lb=(instr[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu=(instr[`op]==6'b100100)?1'b1:1'b0;
	  
	 assign mfhi=((instr[`op]==6'b0)&&(instr[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo=((instr[`op]==6'b0)&&(instr[`func]==6'b010010))?1'b1:1'b0;


	 assign RegDst=addu|subu|jalr|add|sub|sll|srl|sra|sllv|srlv|srav
	                             |AND|OR|XOR|NOR|slt|sltu|mfhi|mflo;
	 assign ifjal=jal;
	 assign ifjalr=jalr;
	 assign MemtoReg=lw|lh|lhu|lb|lbu;
	 assign RegWrite=addu|subu|add|sub|sll|srl|sra|sllv|srlv|srav|AND|OR|XOR|NOR|slt|sltu|
	                 ori|addi|addiu|andi|xori|lw|lui|slti|sltiu|
						  jal|jalr|lh|lhu|lb|lbu|mfhi|mflo;
	                

	 

endmodule
