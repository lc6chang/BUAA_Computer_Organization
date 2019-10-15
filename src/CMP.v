`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:52 12/09/2017 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0] D1,
    input [31:0] D2,
    output reg result,
	 input [31:0] CMPOp
    );
	 always @* begin
		if(CMPOp==0)begin
			result=1'b0;
		end
		else if(CMPOp==1)begin
			if(D1==D2)begin
				result=1'b1;
			end
			else begin
				result=1'b0;
			end
		end
		else if(CMPOp==2)begin
			if(D1!=D2)begin
				result=1'b1;
			end
			else begin
				result=1'b0;
			end
		end
		else if(CMPOp==3)begin
			if($signed(D1)>=$signed(0))begin
				result=1'b1;
			end
			else begin
				result=1'b0;
			end
		end
		else if(CMPOp==4)begin
			if($signed(D1)>$signed(0))begin
				result=1'b1;
			end
			else begin
				result=1'b0;
			end
		end		
		else if(CMPOp==5)begin
			if($signed(D1)<=$signed(0))begin
				result=1'b1;
			end
			else begin
				result=1'b0;
			end
		end
		else if(CMPOp==6)begin
			if($signed(D1)<$signed(0))begin
				result=1'b1;
			end
			else begin
				result=1'b0;
			end
		end
	 end

endmodule
