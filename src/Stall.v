`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:01 12/10/2017 
// Design Name: 
// Module Name:    Stall 
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

module Stall(
	 input [31:0] instr_D,
	 input [31:0] instr_E,
	 input [31:0] instr_M,
	 output shall
    );
	 
	 wire addu_D,subu_D,add_D,sub_D,sll_D,srl_D,sra_D,sllv_D,srlv_D,srav_D,AND_D,OR_D,XOR_D,NOR_D,slt_D,sltu_D;
	 wire ori_D,lui_D,addi_D,addiu_D,andi_D,xori_D,slti_D,sltiu_D;
	 wire lw_D,sw_D,sh_D,sb_D,lh_D,lhu_D,lb_D,lbu_D;
	 wire jr_D,jalr_D;
	 wire beq_D,bne_D,bgez_D,bgtz_D,blez_D,bltz_D;
	 wire mult_D,multu_D,div_D,divu_D,mthi_D,mtlo_D;
	 
	 wire addu_E,subu_E,add_E,sub_E,sll_E,srl_E,sra_E,sllv_E,srlv_E,srav_E,AND_E,OR_E,XOR_E,NOR_E,slt_E,sltu_E;
	 wire ori_E,lui_E,addi_E,addiu_E,andi_E,xori_E,slti_E,sltiu_E;
	 wire lw_E,lh_E,lhu_E,lb_E,lbu_E;
	 wire jal_E,jalr_E;
	 wire mfhi_E,mflo_E;
	
	 wire lw_M,lh_M,lhu_M,lb_M,lbu_M;
	 //大量的译码代码//
	 assign addu_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100001))?1'b1:1'b0;
	 assign subu_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100011))?1'b1:1'b0;
	 assign add_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100000))?1'b1:1'b0;
	 assign sub_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100010))?1'b1:1'b0;
	 assign sll_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b000000))?1'b1:1'b0;
	 assign srl_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b000010))?1'b1:1'b0;
	 assign sra_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b000011))?1'b1:1'b0;
	 assign sllv_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b000100))?1'b1:1'b0;
	 assign srlv_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b000110))?1'b1:1'b0;
	 assign srav_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b000111))?1'b1:1'b0;
	 assign AND_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100100))?1'b1:1'b0;
	 assign OR_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100101))?1'b1:1'b0;
	 assign XOR_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100110))?1'b1:1'b0;
	 assign NOR_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b100111))?1'b1:1'b0;
	 assign slt_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b101010))?1'b1:1'b0;
	 assign sltu_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b101011))?1'b1:1'b0;

	 assign ori_D=(instr_D[`op]==6'b001101)?1'b1:1'b0;
	 assign lui_D=(instr_D[`op]==6'b001111)?1'b1:1'b0;
	 assign addi_D=(instr_D[`op]==6'b001000)?1'b1:1'b0;
	 assign addiu_D=(instr_D[`op]==6'b001001)?1'b1:1'b0;
	 assign andi_D=(instr_D[`op]==6'b001100)?1'b1:1'b0;
	 assign xori_D=(instr_D[`op]==6'b001110)?1'b1:1'b0;
	 assign slti_D=(instr_D[`op]==6'b001010)?1'b1:1'b0;
	 assign sltiu_D=(instr_D[`op]==6'b001011)?1'b1:1'b0;
	 
	 assign jr_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b001000))?1'b1:1'b0;
	 assign jalr_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b001001))?1'b1:1'b0;

	 assign lw_D=(instr_D[`op]==6'b100011)?1'b1:1'b0;
	 assign sw_D=(instr_D[`op]==6'b101011)?1'b1:1'b0;
	 assign sh_D=(instr_D[`op]==6'b101001)?1'b1:1'b0;
	 assign sb_D=(instr_D[`op]==6'b101000)?1'b1:1'b0;
	 assign lh_D=(instr_D[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu_D=(instr_D[`op]==6'b100101)?1'b1:1'b0;
	 assign lb_D=(instr_D[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu_D=(instr_D[`op]==6'b100100)?1'b1:1'b0;
	 
	 assign beq_D=(instr_D[`op]==6'b000100)?1'b1:1'b0;
	 assign bne_D=(instr_D[`op]==6'b000101)?1'b1:1'b0;
	 assign bgez_D=((instr_D[`op]==6'b000001)&&(instr_D[20:16]==5'b00001))?1'b1:1'b0;
	 assign bgtz_D=(instr_D[`op]==6'b000111)?1'b1:1'b0;
	 assign blez_D=(instr_D[`op]==6'b000110)?1'b1:1'b0;
	 assign bltz_D=((instr_D[`op]==6'b000001)&&(instr_D[20:16]==5'b00000))?1'b1:1'b0;

    assign mult_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b011000))?1'b1:1'b0;
	 assign multu_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b011001))?1'b1:1'b0;
	 assign div_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b011010))?1'b1:1'b0;
	 assign divu_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b011011))?1'b1:1'b0;
	 assign mfhi_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b010010))?1'b1:1'b0;
	 assign mthi_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b010001))?1'b1:1'b0;
	 assign mtlo_D=((instr_D[`op]==6'b0)&&(instr_D[`func]==6'b010011))?1'b1:1'b0;	 
////////////////////////////////////////////////////////////////////////////////////	 
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

	 assign jal_E=(instr_E[`op]==6'b000011)?1'b1:1'b0;
	 assign jalr_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b001001))?1'b1:1'b0;

	 assign lw_E=(instr_E[`op]==6'b100011)?1'b1:1'b0;
	 assign lh_E=(instr_E[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu_E=(instr_E[`op]==6'b100101)?1'b1:1'b0;
	 assign lb_E=(instr_E[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu_E=(instr_E[`op]==6'b100100)?1'b1:1'b0;
	 
	 assign mfhi_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b010000))?1'b1:1'b0;
	 assign mflo_E=((instr_E[`op]==6'b0)&&(instr_E[`func]==6'b010010))?1'b1:1'b0;	 
/////////////////////////////////////////////////////////////////////////////////////////
	 assign lw_M=(instr_M[`op]==6'b100011)?1'b1:1'b0;
	 assign lh_M=(instr_M[`op]==6'b100001)?1'b1:1'b0;
	 assign lhu_M=(instr_M[`op]==6'b100101)?1'b1:1'b0;
	 assign lb_M=(instr_M[`op]==6'b100000)?1'b1:1'b0;
	 assign lbu_M=(instr_M[`op]==6'b100100)?1'b1:1'b0;	 
/////////////////////////////////////////////////////
	 wire cal_r_D,cal_i_D,b_D,ld_D,st_D,jr_type_D,sll_type_D,brs_D;
	 wire cal_r_E,cal_i_E,ld_E,jal_type_E;
	 wire ld_M;

	 assign cal_r_D=addu_D|subu_D|add_D|sub_D|AND_D|OR_D|XOR_D|NOR_D|slt_D|sltu_D|sllv_D|srav_D|srlv_D|
	                mult_D|multu_D|div_D|divu_D;
	 assign cal_i_D=ori_D|lui_D|addi_D|addiu_D|andi_D|xori_D|slti_D|sltiu_D;
	 assign b_D=beq_D|bne_D;
	 assign ld_D=lw_D|lh_D|lhu_D|lb_D|lbu_D;
	 assign st_D=sw_D|sh_D|sb_D;
	 assign jr_type_D=jr_D|jalr_D;
	 assign sll_type_D=sll_D|srl_D|sra_D;
	 assign brs_D=bgez_D|bgtz_D|blez_D|bltz_D;
	 
	 assign cal_r_E=addu_E|subu_E|add_E|sub_E|AND_E|OR_E|XOR_E|NOR_E|slt_E|sltu_E|sll_E|srl_E|sra_E|sllv_E|srlv_E|srav_E|
	                mfhi_E|mflo_E;
	 assign cal_i_E=ori_E|lui_E|addi_E|addiu_E|andi_E|xori_E|slti_E|sltiu_E;
	 assign ld_E=lw_E|lh_E|lhu_E|lb_E|lbu_E;
	 assign jal_type_E=jal_E;
	 
	 assign ld_M=lw_M|lh_M|lhu_M|lb_M|lbu_M;
/////////////////////////////////////////////////////////	 
	 wire shall_cal_r_rs;
	 wire shall_cal_r_rt;
	 wire shall_cal_i;
	 wire shall_b_rs;
	 wire shall_b_rt;
	 wire shall_ld;
	 wire shall_st;
	 wire shall_jr_type;
	 
	 
	 assign shall_cal_r_rs=(cal_r_D|mthi_D|mtlo_D)&ld_E&(instr_D[`rs]==instr_E[`rt])&(instr_D[`rs]!=5'b0);
	 assign shall_cal_r_rt=(cal_r_D|sll_type_D)&ld_E&(instr_D[`rt]==instr_E[`rt])&(instr_D[`rt]!=5'b0);
	 assign shall_cal_i=cal_i_D&ld_E&(instr_D[`rs]==instr_E[`rt])&(instr_D[`rs]!=5'b0);
	 assign shall_b_rs=(b_D|brs_D)&(instr_D[`rs]!=5'b0)&((cal_r_E&(instr_D[`rs]==instr_E[`rd]))
															  |(cal_i_E&(instr_D[`rs]==instr_E[`rt]))
															  |(ld_E&(instr_D[`rs]==instr_E[`rt]))
															  |(ld_M&(instr_D[`rs]==instr_M[`rt]))
															  |(jal_type_E&(instr_D[`rs]==5'b11111))
															  |(jalr_E&(instr_D[`rs]==instr_E[`rd])));
	 assign shall_b_rt=b_D&(instr_D[`rt]!=5'b0)&((cal_r_E&(instr_D[`rt]==instr_E[`rd]))
															  |(cal_i_E&(instr_D[`rt]==instr_E[`rt]))
															  |(ld_E&(instr_D[`rt]==instr_E[`rt]))
															  |(ld_M&(instr_D[`rt]==instr_M[`rt]))
															  |(jal_type_E&(instr_D[`rt]==5'b11111))
															  |(jalr_E&(instr_D[`rt]==instr_E[`rd])));
	 assign shall_ld=ld_D&(instr_D[`rs]!=5'b0)&ld_E&(instr_D[`rs]==instr_E[`rt]);
	 assign shall_st=st_D&(instr_D[`rs]!=5'b0)&ld_E&(instr_D[`rs]==instr_E[`rt]);
	 assign shall_jr_type=jr_type_D&(instr_D[`rs]!=5'b0)&((cal_r_E&(instr_D[`rs]==instr_E[`rd]))
																		  |(cal_i_E&(instr_D[`rs]==instr_E[`rt]))
																		  |(ld_E&(instr_D[`rs]==instr_E[`rt]))
																		  |(ld_M&(instr_D[`rs]==instr_M[`rt]))
																		  |(jal_type_E&(instr_D[`rs]==5'b11111))
																		  |(jalr_E&(instr_D[`rs]==instr_E[`rd])));
	 
	 
	 
	 assign shall=shall_cal_r_rs|shall_cal_r_rt|shall_cal_i|shall_b_rs|shall_b_rt|shall_ld|shall_st|shall_jr_type;
	 
	 

endmodule
