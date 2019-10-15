`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:56 12/10/2017 
// Design Name: 
// Module Name:    Con_D 
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
module Con_D(
    input [31:0] instr,
	 output nPc_sel,
	 output ExtOp,
	 output ifb,
	 output iflui,
	 output ifj,
	 output ifjr,
	 output [31:0] CMPOp
    );
	 wire ori,lui,addi,addiu,andi,xori,slti,sltiu;
	 wire lw,sw,sh,sb,lh,lhu,lb,lbu;
	 wire j,jal,jr,jalr;
	 wire beq,bne,bgez,bgtz,blez,bltz;
	 
	 assign j=(instr[`op]==6'b000010)?1'b1:1'b0;
	 assign jal=(instr[`op]==6'b000011)?1'b1:1'b0;
	 assign jr=((instr[`op]==6'b0)&&(instr[`func]==6'b001000))?1'b1:1'b0;
	 assign jalr=((instr[`op]==6'b0)&&(instr[`func]==6'b001001))?1'b1:1'b0;

	 assign lw=(instr[`op]==6'b100011)?1'b1:1'b0;
	 assign sw=(instr[`op]==6'b101011)?1'b1:1'b0;	 
    assign sh=(instr[`op]==6'b101001)?1'b1:1'b0;
	 assign sb=(instr[`op]==6'b101000)?1'b1:1'b0;
	 assign lh=(instr[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu=(instr[`op]==6'b100101)?1'b1:1'b0;
	 assign lb=(instr[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu=(instr[`op]==6'b100100)?1'b1:1'b0;

	 assign lui=(instr[`op]==6'b001111)?1'b1:1'b0;	 
	 assign ori=(instr[`op]==6'b001101)?1'b1:1'b0;
	 assign addi=(instr[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu=(instr[`op]==6'b001001)?1'b1:1'b0;
	 assign andi=(instr[`op]==6'b001100)?1'b1:1'b0;
	 assign xori=(instr[`op]==6'b001110)?1'b1:1'b0;
	 assign slt=((instr[`op]==6'b0)&&(instr[`func]==6'b101010))?1'b1:1'b0;
	 assign slti=(instr[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu=(instr[`op]==6'b001011)?1'b1:1'b0;
	 assign sltu=((instr[`op]==6'b0)&&(instr[`func]==6'b101011))?1'b1:1'b0;
	 
	 assign beq=(instr[`op]==6'b000100)?1'b1:1'b0;
	 assign bne=(instr[`op]==6'b000101)?1'b1:1'b0;
	 assign bgez=((instr[`op]==6'b000001)&&(instr[20:16]==5'b00001))?1'b1:1'b0;
	 assign bgtz=(instr[`op]==6'b000111)?1'b1:1'b0;
	 assign blez=(instr[`op]==6'b000110)?1'b1:1'b0;
	 assign bltz=((instr[`op]==6'b000001)&&(instr[20:16]==5'b00000))?1'b1:1'b0;
	 
	 assign nPc_sel=beq|j|jal|jr|jalr|bne|bgez|bgtz|blez|bltz;
	 assign ExtOp=sw|lw|sh|sb|lh|lhu|lb|lbu|addi|addiu|slti|sltiu;
	 assign ifb=beq|bne|bgez|bgtz|blez|bltz;
	 assign iflui=lui;
	 assign ifj=j|jal;
	 assign ifjr=jr|jalr;
	 assign CMPOp=(beq)?1:
					  (bne)?2:
					  (bgez)?3:
					  (bgtz)?4:
					  (blez)?5:
					  (bltz)?6:0;
	 


endmodule
