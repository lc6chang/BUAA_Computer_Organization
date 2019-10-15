`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:08:05 11/25/2017 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0] imm,
    output [31:0] extout,
    input ExtOp,
    input iflui
    );
	 assign extout=(iflui==1)?{imm,16'b0}
			  :(ExtOp==1)?{{16{imm[15]}},imm}:{16'b0,imm};

endmodule
