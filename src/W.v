`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:14 12/09/2017 
// Design Name: 
// Module Name:    W 
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
module W(
    input clk,
	 input reset,
	 input [31:0] instr,
	 input [31:0] pc,
	 input [31:0] pc4,
	 input [31:0] ao,
	 input [31:0] dr,
	 input RegDst,
	 input ifjal,
	 input ifjalr,
	 input MemtoReg,
	 output [4:0] WA,
	 output [31:0] WD,
	 output [31:0] instr_out,
	 output [31:0] pc_out
    );
	 //ÉêÇë¼Ä´æÆ÷//
	 reg [31:0] IR_W;
	 reg [31:0] PC_W;
	 reg [31:0] PC4_W;
	 reg [31:0] AO_W;
	 reg [31:0] DR_W;
	 
	 initial begin
		IR_W=0;
		PC_W=0;
		PC4_W=0;
		AO_W=0;
		DR_W=0;
	 end
	 always @(posedge clk)begin
		if(reset)begin
			IR_W<=0;
			PC_W<=0;
			PC4_W<=0;
			AO_W<=0;
			DR_W<=0;
		end
		else begin
			IR_W<=instr;
			PC_W<=pc;
			PC4_W<=pc4;
			AO_W<=ao;
			DR_W<=dr;
		end
	 end
	 
	 assign instr_out=IR_W;
	 assign pc_out=PC_W;
	 
	 
	 assign WA=(ifjal)?5'b11111:
				  (RegDst==1)?IR_W[15:11]:
				  IR_W[20:16];
	 assign WD=(ifjal|ifjalr)?(PC4_W+4):
				  (MemtoReg==1)?DR_W:AO_W;

endmodule
