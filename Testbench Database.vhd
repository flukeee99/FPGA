module database_tb();
reg clk;
wire signed [10:0] datata;
reg re,we;
reg [12:0] address;
reg signed [10:0] dp;
reg [12:0] address_p;
initial
	begin
	clk = 0;
	forever #1 clk = ~clk;
	end



database#(11) DATA_BASE_TB(clk,datata,re,address,we,dp,address_p);
initial
begin
  we=1;
  address=100;
dp=123;	
@(negedge clk);
  re=1;
address_p=100;
 @(negedge clk);
 
end
endmodule
