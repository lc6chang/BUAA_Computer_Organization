`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:23 12/09/2017 
// Design Name: 
// Module Name:    E 
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
`include "ALU.v"
`include "MD.v"
module E(
	 input reset,
	 input clk,
	 input [31:0] instr,
	 input [31:0] pc,
	 input [31:0] pc4,
	 input [31:0] RS,
	 input [31:0] RT,
	 input [31:0] ext,
	 input [31:0] ALUOp,
	 input ALUSrc,
	 input shall,
	 output [31:0] instr_out,
	 output [31:0] pc_out,
	 output [31:0] pc4_out,
	 output [31:0] aluout,
	 output [31:0] rt_out,
	 input [31:0] AO_M,
	 input [31:0] PC4_M,
	 input [31:0] WD_W,
	 input [31:0] PC4_W,
	 input [31:0] mf_ALU_A,
	 input [31:0] mf_ALU_B,
	 input [31:0] mf_RTout_E,
	 input [1:0] MDOp,
	 input HIWrite,
	 input LOWrite,
	 input MDSrc,
	 input [1:0] AluoutSrc
    );
	 //ÉêÇë¼Ä´æÆ÷//
	 reg [31:0] IR_E;
	 reg [31:0] PC4_E;
	 reg [31:0] PC_E;
	 reg [31:0] RS_E;
	 reg [31:0] RT_E;
	 reg [31:0] EXT_E;
	 
	 initial begin
		IR_E=0;
		PC4_E=0;
		PC_E=0;
		RS_E=0;
		RT_E=0;
		EXT_E=0;
	 end
	 always @(posedge clk) begin
		if(reset)begin
			IR_E<=0;
			PC4_E<=0;
			PC_E<=0;
			RS_E<=0;
			RT_E<=0;
			EXT_E<=0;
		end
		else if(shall)begin
			IR_E<=32'b0;
		end
		else begin
			IR_E<=instr;
			PC4_E<=pc4;
			PC_E<=pc;
			RS_E<=RS;
			RT_E<=RT;
			EXT_E<=ext;
		end
	end
	
	wire [31:0] t_rs;
	wire [31:0] in_B;
	
	assign t_rs=(mf_ALU_A==1)?AO_M:
					(mf_ALU_A==2)?(PC4_M+4):
					(mf_ALU_A==3)?WD_W:
					(mf_ALU_A==4)?(PC4_W+4):RS_E;
	assign in_B=(mf_ALU_B==1)?AO_M:
					(mf_ALU_B==2)?(PC4_M+4):
					(mf_ALU_B==3)?WD_W:
					(mf_ALU_B==4)?(PC4_W+4):
					(ALUSrc==1)?EXT_E:RT_E;
	
	assign instr_out=IR_E;
	assign pc4_out=PC4_E;
	assign pc_out=PC_E;
	assign rt_out=(mf_RTout_E==1)?WD_W:
					  (mf_RTout_E==2)?(PC4_W+4):RT_E;
	
	wire [31:0] t_result;
	wire [31:0] t_HI;
	wire [31:0] t_LO;
	assign aluout=(AluoutSrc==2'b00)?t_result:
					  (AluoutSrc==2'b01)?t_HI:
					  (AluoutSrc==2'b10)?t_LO:0;
	
	ALU ALU(.A(t_rs),.B(in_B),.ALUOp(ALUOp),.s(instr_out[10:6]),.result(t_result));
	MD MD(.clk(clk),.reset(reset),.A(t_rs),.B(in_B),.MDOp(MDOp),.HIWrite(HIWrite),.LOWrite(LOWrite),.MDSrc(MDSrc),.HI(t_HI),.LO(t_LO));
	 
	 
	 

endmodule
