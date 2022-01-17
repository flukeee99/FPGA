`timescale 1ns / 1ps
module result_tb();
parameter SIZE_1=11;
parameter SIZE_2=22;
parameter SIZE_3=33;
parameter SIZE_4=44;
parameter SIZE_address_pix=13;

reg clk,enable;
wire STOP;
reg [SIZE_address_pix-1:0] memstartp;
reg [SIZE_1-1:0] qp;
wire  re;
wire  [SIZE_address_pix-1:0] read_addressp;
wire  [3:0] RESULT;

initial
	begin
	clk = 0;
	forever #1 clk = ~clk;
	end
result #(11,22,33,44,13) RESULT_TB(clk,enable,STOP,memstartp,read_addressp,qp,re,RESULT);
initial

	begin
@(negedge clk);
	enable=1;
	memstartp=100;
	qp=123;
	
@(negedge clk);

enable=0;
	memstartp=100;
	qp=123;
	end
endmodule
