`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:09 12/09/2017 
// Design Name: 
// Module Name:    M 
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
`include "DM.v"
module M(
	 input clk,
	 input reset,
	 input [31:0] instr,
	 input [31:0] pc,
	 input [31:0] pc4,
	 input [31:0] aluout,
	 input [31:0] rt,
	 input MemWrite,
	 output [31:0] instr_out,
	 output [31:0] pc_out,
	 output [31:0] pc4_out,
	 output [31:0] alu_out,
	 output [31:0] dmout,
	 input [31:0] WD_W,
	 input [31:0] PC4_W,
	 input [31:0] mf_DMin_M,
	 input [31:0] DMin_Src,
	 input [31:0] DMout_Src
    );
	 //ÉêÇë¼Ä´æÆ÷//
	 reg [31:0] IR_M;
	 reg [31:0] PC_M;
	 reg [31:0] PC4_M;
	 reg [31:0] AO_M;
	 reg [31:0] RT_M;
	 
	 initial begin
		IR_M=0;
		PC_M=0;
		PC4_M=0;
		AO_M=0;
		RT_M=0;
	 end
	 
	 always@(posedge clk)begin
		if(reset)begin
			IR_M<=0;
			PC_M<=0;
			PC4_M<=0;
			AO_M<=0;
			RT_M<=0;
		end
		else begin
			IR_M<=instr;
			PC_M<=pc;
			PC4_M<=pc4;
			AO_M<=aluout;
			RT_M<=rt;
		end
	 end
	 
	 wire [31:0] Din;
	 assign Din=(mf_DMin_M==1)?WD_W:
					(mf_DMin_M==2)?(PC4_W+4):
					RT_M;
	 
	 DM DM(.clk(clk),.reset(reset),.Address(AO_M),.WD(Din),.MemWrite(MemWrite),.pc(PC_M),.Data(dmout),
	       .DMin_Src(DMin_Src),.DMout_Src(DMout_Src));
	 
	 assign instr_out=IR_M;
	 assign pc_out=PC_M;
	 assign pc4_out=PC4_M;
	 assign alu_out=AO_M;

endmodule
