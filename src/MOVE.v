`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:11 12/11/2017 
// Design Name: 
// Module Name:    MOVE 
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
`define rs 25:21
`define rt 20:16
`define rd 15:11

module MOVE(
	 input [31:0] instr_D,
	 input [31:0] instr_E,
	 input [31:0] instr_M,
	 input [31:0] instr_W,
	 output [31:0] mf_ALU_A,
	 output [31:0] mf_ALU_B,
	 output [31:0] mf_CMP_A,
	 output [31:0] mf_CMP_B,
	 output [31:0] mf_DMin_M,
	 output [31:0] mf_RTout_E,
	 output [31:0] mf_JR
    );
	 wire beq_D,bne_D,bgez_D,bgtz_D,blez_D,bltz_D;
    wire jr_D,jalr_D;
	 
	 wire addu_E,subu_E,add_E,sub_E,sll_E,srl_E,sra_E,sllv_E,srlv_E,srav_E,AND_E,OR_E,XOR_E,NOR_E,slt_E,sltu_E;
	 wire lw_E,sw_E,sh_E,sb_E,lh_E,lhu_E,lb_E,lbu_E;
	 wire ori_E,addi_E,lui_E,addiu_E,andi_E,xori_E,slti_E,sltiu_E;
	 wire mult_E,multu_E,div_E,divu_E,mthi_E,mtlo_E;
	 
	 wire addu_M,subu_M,add_M,sub_M,sll_M,srl_M,sra_M,sllv_M,srlv_M,srav_M,AND_M,OR_M,XOR_M,NOR_M,slt_M,sltu_M;
	 wire lw_M,sw_M,sh_M,sb_M,lh_M,lhu_M,lb_M,lbu_M;
	 wire ori_M,lui_M,addi_M,addiu_M,andi_M,xori_M,slti_M,sltiu_M;
	 wire mfhi_M,mflo_M;
	 wire jal_M,jalr_M;
	 
	 wire addu_W,subu_W,add_W,sub_W,sll_W,srl_W,sra_W,sllv_W,srlv_W,srav_W,AND_W,OR_W,XOR_W,NOR_W,slt_W,sltu_W;
	 wire ori_W,lui_W,addi_W,addiu_W,andi_W,xori_W,slti_W,sltiu_W;
	 wire lw_W,lh_W,lhu_W,lb_W,lbu_W;
	 wire jal_W,jalr_W;
	 wire mfhi_W,mflo_W;
	 //大量的译码代码//
	 assign beq_D=(instr_D[`op]==6'b000100)?1'b1:1'b0;
	 assign bne_D=(instr_D[`op]==6'b000101)?1'b1:1'b0;
	 assign bgez_D=((instr_D[`op]==6'b000001)&&(instr_D[20:16]==5'b00001))?1'b1:1'b0;
	 assign bgtz_D=(instr_D[`op]==6'b000111)?1'b1:1'b0;
	 assign blez_D=(instr_D[`op]==6'b000110)?1'b1:1'b0;
	 assign bltz_D=((instr_D[`op]==6'b000001)&&(instr_D[20:16]==5'b00000))?1'b1:1'b0;
	 
	 assign jr_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b001000))?1'b1:1'b0;
	 assign jalr_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b001001))?1'b1:1'b0;
////////////////////////////////////////////////////////////////////////////////////////////	 
	 assign addu_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100001))?1'b1:1'b0;
	 assign subu_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100011))?1'b1:1'b0;
	 assign add_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100000))?1'b1:1'b0;
	 assign sub_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100010))?1'b1:1'b0;
	 assign sll_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b000000))?1'b1:1'b0;
	 assign srl_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b000010))?1'b1:1'b0;
	 assign sra_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b000011))?1'b1:1'b0;
	 assign sllv_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b000100))?1'b1:1'b0;
	 assign srlv_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b000110))?1'b1:1'b0;
	 assign srav_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b000111))?1'b1:1'b0;
	 assign AND_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100100))?1'b1:1'b0;
	 assign OR_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100101))?1'b1:1'b0;
	 assign XOR_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100110))?1'b1:1'b0;
	 assign NOR_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b100111))?1'b1:1'b0;
	 assign slt_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b101010))?1'b1:1'b0;
	 assign sltu_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b101011))?1'b1:1'b0;
	 
	 assign ori_E=(instr_E[`op]==6'b001101)?1'b1:1'b0;
	 assign lui_E=(instr_E[`op]==6'b001111)?1'b1:1'b0;
	 assign addi_E=(instr_E[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu_E=(instr_E[`op]==6'b001001)?1'b1:1'b0;
	 assign andi_E=(instr_E[`op]==6'b001100)?1'b1:1'b0;
	 assign xori_E=(instr_E[`op]==6'b001110)?1'b1:1'b0;
	 assign slti_E=(instr_E[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu_E=(instr_E[`op]==6'b001011)?1'b1:1'b0;

	 assign lw_E=(instr_E[`op]==6'b100011)?1'b1:1'b0;
	 assign sw_E=(instr_E[`op]==6'b101011)?1'b1:1'b0;	 
	 assign sh_E=(instr_E[`op]==6'b101001)?1'b1:1'b0;
	 assign sb_E=(instr_E[`op]==6'b101000)?1'b1:1'b0;
	 assign lh_E=(instr_E[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu_E=(instr_E[`op]==6'b100101)?1'b1:1'b0;
	 assign lb_E=(instr_E[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu_E=(instr_E[`op]==6'b100100)?1'b1:1'b0;
	 	 
	 assign mult_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b011000))?1'b1:1'b0;
	 assign multu_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b011001))?1'b1:1'b0;
	 assign div_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b011010))?1'b1:1'b0;
	 assign divu_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b011011))?1'b1:1'b0;
	 assign mthi_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b010001))?1'b1:1'b0;
	 assign mtlo_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b010011))?1'b1:1'b0;
////////////////////////////////////////////////////////////////////////////////////////////////
	 assign addu_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100001))?1'b1:1'b0;
	 assign subu_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100011))?1'b1:1'b0;
	 assign add_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100000))?1'b1:1'b0;
	 assign sub_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100010))?1'b1:1'b0;
	 assign sll_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b000000))?1'b1:1'b0;
	 assign srl_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b000010))?1'b1:1'b0;
	 assign sra_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b000011))?1'b1:1'b0;
	 assign sllv_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b000100))?1'b1:1'b0;
	 assign srlv_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b000110))?1'b1:1'b0;
	 assign srav_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b000111))?1'b1:1'b0;
	 assign AND_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100100))?1'b1:1'b0;
	 assign OR_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100101))?1'b1:1'b0;
	 assign XOR_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100110))?1'b1:1'b0;
	 assign NOR_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b100111))?1'b1:1'b0;
	 assign slt_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b101010))?1'b1:1'b0;
	 assign sltu_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b101011))?1'b1:1'b0;
	 
	 assign ori_M=(instr_M[`op]==6'b001101)?1'b1:1'b0;
	 assign lui_M=(instr_M[`op]==6'b001111)?1'b1:1'b0;
	 assign addi_M=(instr_M[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu_M=(instr_M[`op]==6'b001001)?1'b1:1'b0;
	 assign andi_M=(instr_M[`op]==6'b001100)?1'b1:1'b0;
	 assign xori_M=(instr_M[`op]==6'b001110)?1'b1:1'b0;
	 assign slti_M=(instr_M[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu_M=(instr_M[`op]==6'b001011)?1'b1:1'b0;
	 
	 assign lw_M=(instr_M[`op]==6'b100011)?1'b1:1'b0;
	 assign sw_M=(instr_M[`op]==6'b101011)?1'b1:1'b0;
	 assign sh_M=(instr_M[`op]==6'b101001)?1'b1:1'b0;
	 assign sb_M=(instr_M[`op]==6'b101000)?1'b1:1'b0;
	 assign lh_M=(instr_M[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu_M=(instr_M[`op]==6'b100101)?1'b1:1'b0;
	 assign lb_M=(instr_M[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu_M=(instr_M[`op]==6'b100100)?1'b1:1'b0;

	 assign jal_M=(instr_M[`op]==6'b000011)?1'b1:1'b0;
	 assign jalr_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b001001))?1'b1:1'b0;

	 assign mfhi_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo_M=((instr_M[`op]==6'b0)&&(instr_M[`func]==6'b010010))?1'b1:1'b0;		 
/////////////////////////////////////////////////////////////////////////////////////////////////	 
	 assign addu_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100001))?1'b1:1'b0;
	 assign subu_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100011))?1'b1:1'b0;
	 assign add_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100000))?1'b1:1'b0;
	 assign sub_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100010))?1'b1:1'b0;
	 assign sll_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b000000))?1'b1:1'b0;
	 assign srl_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b000010))?1'b1:1'b0;
	 assign sra_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b000011))?1'b1:1'b0;
	 assign sllv_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b000100))?1'b1:1'b0;
	 assign srlv_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b000110))?1'b1:1'b0;
	 assign srav_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b000111))?1'b1:1'b0;
	 assign AND_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100100))?1'b1:1'b0;
	 assign OR_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100101))?1'b1:1'b0;
	 assign XOR_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100110))?1'b1:1'b0;
	 assign NOR_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b100111))?1'b1:1'b0;	 
	 assign slt_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b101010))?1'b1:1'b0;
	 assign sltu_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b101011))?1'b1:1'b0;
		 
	 assign ori_W=(instr_W[`op]==6'b001101)?1'b1:1'b0;
	 assign lui_W=(instr_W[`op]==6'b001111)?1'b1:1'b0; 
	 assign addi_W=(instr_W[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu_W=(instr_W[`op]==6'b001001)?1'b1:1'b0;
	 assign andi_W=(instr_W[`op]==6'b001100)?1'b1:1'b0;
	 assign xori_W=(instr_W[`op]==6'b001110)?1'b1:1'b0;
	 assign slti_W=(instr_W[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu_W=(instr_W[`op]==6'b001011)?1'b1:1'b0;

	 assign lw_W=(instr_W[`op]==6'b100011)?1'b1:1'b0;
	 assign lh_W=(instr_W[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu_W=(instr_W[`op]==6'b100101)?1'b1:1'b0;
	 assign lb_W=(instr_W[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu_W=(instr_W[`op]==6'b100100)?1'b1:1'b0;
	 
	 assign jal_W=(instr_W[`op]==6'b000011)?1'b1:1'b0;
	 assign jalr_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b001001))?1'b1:1'b0;

	 assign mfhi_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo_W=((instr_W[`op]==6'b0)&&(instr_W[`func]==6'b010010))?1'b1:1'b0;		 
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

	 wire b_type_D,jr_type_D,brs_D;
	 wire cal_r_E,cal_i_E,ld_E,st_E;	 
	 wire cal_r_M,cal_i_M,ld_M,st_M,jal_type_M;
	 wire cal_r_W,cal_i_W,ld_W,jal_type_W;
	 

	 assign b_type_D=beq_D|bne_D;
	 assign jr_type_D=jr_D|jalr_D;
	 assign brs_D=bgez_D|bgtz_D|blez_D|bltz_D;
	 	 
	 assign cal_r_E=addu_E|subu_E|add_E|sub_E|AND_E|OR_E|XOR_E|NOR_E|slt_E|sltu_E|sll_E|srl_E|sra_E|sllv_E|srlv_E|srav_E|
	                mult_E|multu_E|div_E|divu_E|mthi_E|mtlo_E;
	 assign cal_i_E=ori_E|lui_E|addi_E|addiu_E|andi_E|xori_E|slti_E|sltiu_E;
	 assign ld_E=lw_E|lh_E|lhu_E|lb_E|lbu_E;
	 assign st_E=sw_E|sh_E|sb_E;

	 assign cal_r_M=addu_M|subu_M|add_M|sub_M|AND_M|OR_M|XOR_M|NOR_M|slt_M|sltu_M|sll_M|srl_M|sra_M|sllv_M|srlv_M|srav_M|
	                mfhi_M|mflo_M;
	 assign cal_i_M=ori_M|lui_M|addi_M|addiu_M|andi_M|xori_M|slti_M|sltiu_M;
	 assign ld_M=lw_M|lh_M|lhu_M|lb_M|lbu_M;
	 assign st_M=sw_M|sh_M|sb_M;
	 assign jal_type_M=jal_M;

	 assign cal_r_W=addu_W|subu_W|add_W|sub_W|AND_W|OR_W|XOR_W|NOR_W|slt_W|sltu_W|sll_W|srl_W|sra_W|sllv_W|srlv_W|srav_W|
	                mfhi_W|mflo_W;
	 assign cal_i_W=ori_W|lui_W|addi_W|addiu_W|andi_W|xori_W|slti_W|sltiu_W;
	 assign ld_W=lw_W|lh_W|lhu_W|lb_W|lbu_W;
	 assign jal_type_W=jal_W;
/////////////////////////////////////////////////////////////////////////	 
	 assign mf_ALU_A=((cal_r_M&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==instr_M[`rd])&(instr_E[`rs]!=5'b0))|
						  (cal_i_M&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==instr_M[`rt])&(instr_E[`rs]!=5'b0)))?1:
						  ((jal_type_M&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==5'b11111))|
						  (jalr_M&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==instr_M[`rd])&(instr_E[`rs]!=5'b0)))?2:
						  ((cal_r_W&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==instr_W[`rd])&(instr_E[`rs]!=5'b0))|
						  ((cal_i_W|ld_W)&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==instr_W[`rt])&(instr_E[`rs]!=5'b0)))?3:
						  ((jal_type_W&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==5'b11111))|
						  (jalr_W&(cal_r_E|cal_i_E|ld_E|st_E)&(instr_E[`rs]==instr_W[`rd])&(instr_E[`rs]!=5'b0)))?4:0;
	 
	 assign mf_ALU_B=((cal_r_M&cal_r_E&(instr_E[`rt]==instr_M[`rd])&(instr_E[`rt]!=5'b0))|
		              (cal_i_M&cal_r_E&(instr_E[`rt]==instr_M[`rt])&(instr_E[`rt]!=5'b0)))?1:
						  ((jal_type_M&cal_r_E&(instr_E[`rt]==5'b11111))|
						  (jalr_M&cal_r_E&(instr_E[`rt]==instr_M[`rd])&(instr_E[`rt]!=5'b0)))?2:
						  ((cal_r_W&cal_r_E&(instr_E[`rt]==instr_W[`rd])&(instr_E[`rt]!=5'b0))|
		              ((cal_i_W|ld_W)&cal_r_E&(instr_E[`rt]==instr_W[`rt])&(instr_E[`rt]!=5'b0)))?3:
						  ((jal_type_W&cal_r_E&(instr_E[`rt]==5'b11111))|
						  (jalr_W&cal_r_E&(instr_E[`rt]==instr_W[`rd])&(instr_E[`rt]!=5'b0)))?4:0;
	 
	 assign mf_CMP_A=(((b_type_D|brs_D)&cal_r_M&(instr_D[`rs]==instr_M[`rd])&(instr_D[`rs]!=5'b0))|
						  ((b_type_D|brs_D)&cal_i_M&(instr_D[`rs]==instr_M[`rt])&(instr_D[`rs]!=5'b0)))?1:
						  (((b_type_D|brs_D)&jal_type_M&(instr_D[`rs]==5'b11111))|
						  ((b_type_D|brs_D)&jalr_M&(instr_D[`rs]==instr_M[`rd])&(instr_D[`rs]!=5'b0)))?2:0;
	 
	 assign mf_CMP_B=((b_type_D&cal_r_M&(instr_D[`rt]==instr_M[`rd])&(instr_D[`rt]!=5'b0))|
						  (b_type_D&cal_i_M&(instr_D[`rt]==instr_M[`rt])&(instr_D[`rt]!=5'b0)))?1:
						  ((b_type_D&jal_type_M&(instr_D[`rt]==5'b11111))|
						  (b_type_D&jalr_M&(instr_D[`rt]==instr_M[`rd])&(instr_D[`rt]!=5'b0)))?2:0; 
						  
	 assign mf_DMin_M=((st_M&cal_r_W&(instr_M[`rt]==instr_W[`rd])&(instr_M[`rt]!=5'b0))|
		               (st_M&(cal_i_W|ld_W)&(instr_M[`rt]==instr_W[`rt])&(instr_M[`rt]!=5'b0)))?1:
							((st_M&jal_type_W&(instr_M[`rt]==5'b11111))|
							(st_M&jalr_W&(instr_M[`rt]==instr_W[`rd])&(instr_M[`rt]!=5'b0)))?2:0;
	 
	 assign mf_RTout_E=((st_E&cal_r_W&(instr_E[`rt]==instr_W[`rd])&(instr_E[`rt]!=5'b0))|
		               (st_E&(cal_i_W|ld_W)&(instr_E[`rt]==instr_W[`rt])&(instr_E[`rt]!=5'b0)))?1:
							((st_E&jal_type_W&(instr_E[`rt]==5'b11111))|
							(st_E&jalr_W&(instr_E[`rt]==instr_W[`rd])&(instr_E[`rt]!=5'b0)))?2:0;
   
	 assign mf_JR=((jr_type_D&cal_r_M&(instr_D[`rs]==instr_M[`rd])&(instr_D[`rs]!=5'b0))|
						(jr_type_D&cal_i_M&(instr_D[`rs]==instr_M[`rt])&(instr_D[`rs]!=5'b0)))?1:
						((jr_type_D&jal_type_M&(instr_D[`rs]==5'b11111))|
						(jr_type_D&jalr_M&(instr_D[`rs]==instr_M[`rd])&(instr_D[`rs]!=5'b0)))?2:0;
						
	 	 
endmodule
