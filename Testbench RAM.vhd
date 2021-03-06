module DUT_RAM();
parameter picture_size=28;
parameter SIZE_1=11;
parameter SIZE_2=22;
parameter SIZE_4=44;
parameter SIZE_9=99;
parameter SIZE_address_pix=13;
parameter SIZE_address_pix_t=12;
parameter SIZE_address_wei=9;

wire signed [SIZE_1-1:0] qp;       //read data
 wire signed [(SIZE_2)*1-1:0] qtp;       //read data
 wire signed [SIZE_9-1:0] qw;      //read weight
reg signed [SIZE_1-1:0] dp;   //write data
reg signed [(SIZE_2)*1-1:0] dtp;   //write data
reg signed [SIZE_9-1:0] dw;   //write weight
reg [SIZE_address_pix-1:0] write_addressp, read_addressp;
reg [SIZE_address_pix_t-1:0] write_addresstp, read_addresstp;
reg [SIZE_address_wei-1:0] write_addressw, read_addressw;
reg we_p,we_tp,we_w,re_p,re_tp,re_w,clk;

RAM #(28,11,22,44,99,13,12,9) RAM_DUT_TB(qp,qtp,qw,dp,dtp,dw,write_addressp,read_addressp,write_addresstp,read_addresstp,write_addressw,read_addressw,we_p,we_tp,we_w,re_p,re_tp,re_w,clk);
initial
	begin
	clk = 0;
	forever #1 clk = ~clk;
	end

initial
begin
  
repeat(10)@(negedge clk);
  	we_p=1;
  	dp=100;
 	write_addressp=0;
repeat(5) @(negedge clk);
	re_p=1;
	read_addressp=0;
repeat(10) @(negedge clk);
	we_w=1;
  	dw=200;
 	write_addressw=1;
  repeat(5) @(negedge clk);
	re_p=1;
	read_addressp=1;
	repeat(10) @(negedge clk);
	we_tp=1;
  	dtp=50;
 	write_addresstp=2;
   repeat(5)@(negedge clk);
	re_tp=1;
	read_addresstp=2;

end
endmodule
