`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:57 11/25/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [31:0] ALUOp,
	 input [4:0] s,
    output reg [31:0] result
    );

	 always @* begin
		if(ALUOp==0)begin
			result=A+B;
		end
		else if(ALUOp==1)begin
			result=A-B;
		end
		else if(ALUOp==2)begin
			result=B<<s;
		end
		else if(ALUOp==3)begin
			result=B>>s;
		end
		else if(ALUOp==4)begin
			result=$signed(B)>>>s;
		end
		else if(ALUOp==5)begin
			result=B<<A[4:0];
		end
		else if(ALUOp==6)begin
			result=B>>A[4:0];
		end
		else if(ALUOp==7)begin
			result=$signed(B)>>>A[4:0];
		end
		else if(ALUOp==8)begin
			result=A&B;
		end
		else if(ALUOp==9)begin
			result=A|B;
		end
		else if(ALUOp==10)begin
			result=A^B;
		end
		else if(ALUOp==11)begin
			result=~(A|B);
		end
		else if(ALUOp==12)begin
			if($signed(A)<$signed(B))begin
				result=1;
			end
			else begin
				result=0;
			end
		end
		else if(ALUOp==13)begin
			if(A<B)begin
				result=1;
			end
			else begin
				result=0;
			end
		end
	 end

endmodule
