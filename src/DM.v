`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:31 11/25/2017 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,
	 input reset,
    input [31:0] Address,
    input [31:0] WD,
    input MemWrite,
	 input [31:0] pc,
	 output [31:0] Data,
	 input [31:0] DMin_Src,
	 input [31:0] DMout_Src
    );
	 
	 reg [31:0] dm [4095:0];
	 integer i;
	 initial begin
		for(i=0;i<4096;i=i+1)begin
			dm[i]=0;
		end
	 end
	 
	 wire [31:0]din;
	 wire [31:0]dout;
	 assign Data=dout;
	 
	 wire [31:0] Memdata;
	 assign Memdata=dm[Address[13:2]];
	 
	 
	 assign din=(DMin_Src==0)?WD:
	            ((DMin_Src==1)&&(Address[1]==1'b0))?{Memdata[31:16],WD[15:0]}:
				   ((DMin_Src==1)&&(Address[1]==1'b1))?{WD[15:0],Memdata[15:0]}:
					((DMin_Src==2)&&(Address[1:0]==2'b00))?{Memdata[31:8],WD[7:0]}:
					((DMin_Src==2)&&(Address[1:0]==2'b01))?{Memdata[31:16],WD[7:0],Memdata[7:0]}:
					((DMin_Src==2)&&(Address[1:0]==2'b10))?{Memdata[31:24],WD[7:0],Memdata[15:0]}:
					((DMin_Src==2)&&(Address[1:0]==2'b11))?{WD[7:0],dout[23:0]}:0;
					 
	 assign dout=(DMout_Src==0)?dm[Address[13:2]]:
	             ((DMout_Src==1)&&(Address[1]==1'b0))?{{16{Memdata[15]}},Memdata[15:0]}:
					 ((DMout_Src==1)&&(Address[1]==1'b1))?{{16{Memdata[31]}},Memdata[31:16]}:
					 ((DMout_Src==2)&&(Address[1]==1'b0))?{16'b0,Memdata[15:0]}:
					 ((DMout_Src==2)&&(Address[1]==1'b1))?{16'b0,Memdata[31:16]}:
					 ((DMout_Src==3)&&(Address[1:0]==2'b00))?{{24{Memdata[7]}},Memdata[7:0]}:
					 ((DMout_Src==3)&&(Address[1:0]==2'b01))?{{24{Memdata[15]}},Memdata[15:8]}:
					 ((DMout_Src==3)&&(Address[1:0]==2'b10))?{{24{Memdata[23]}},Memdata[23:16]}:
					 ((DMout_Src==3)&&(Address[1:0]==2'b11))?{{24{Memdata[31]}},Memdata[31:24]}:
					 ((DMout_Src==4)&&(Address[1:0]==2'b00))?{24'b0,Memdata[7:0]}:
					 ((DMout_Src==4)&&(Address[1:0]==2'b01))?{24'b0,Memdata[15:8]}:
					 ((DMout_Src==4)&&(Address[1:0]==2'b10))?{24'b0,Memdata[23:16]}:
					 ((DMout_Src==4)&&(Address[1:0]==2'b11))?{24'b0,Memdata[31:24]}:0;

	 always @(posedge clk) begin
		if(reset)begin
			for(i=0;i<4096;i=i+1)begin
				dm[i]<=0;
			end
		end
		else if(MemWrite)begin
			dm[Address[13:2]]<=din;
			$display("%d@%h: *%h <= %h", $time, pc,{Address[31:2],2'b0},din);
		end
	 end
	 
endmodule
