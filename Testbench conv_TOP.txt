module conv_TOP_tb();

parameter num_conv=1;
parameter SIZE_1=11;
parameter SIZE_2=22;
parameter SIZE_3=33;
parameter SIZE_4=44;
parameter SIZE_5=55;
parameter SIZE_6=66;
parameter SIZE_7=77;
parameter SIZE_8=88;
parameter SIZE_9=99;
parameter SIZE_address_pix=13;
parameter SIZE_address_pix_t=12;
parameter SIZE_address_wei=9;

reg clk,conv_en,globmaxp_en;
reg [1:0] prov;
reg [4:0] matrix;
reg [9:0] matrix2;
reg [SIZE_address_pix-1:0] memstartp; 
reg [SIZE_address_wei-1:0] memstartw;
reg [SIZE_address_pix-1:0] memstartzap;                  																	
reg [4:0] lvl;
reg [1:0] slvl;
reg signed [SIZE_1-1:0] qp;
reg signed [SIZE_2*1-1:0] qtp;
reg signed [SIZE_9-1:0] qw;
reg signed [SIZE_1+SIZE_1-2:0] Y1;
reg [2:0] num;
reg [4:0] filt;
reg bias;


wire  [SIZE_address_pix-1:0] read_addressp;
wire  [SIZE_address_pix_t-1:0] read_addresstp;
wire  [SIZE_address_wei-1:0] read_addressw;
wire  [SIZE_address_pix-1:0] write_addressp;
wire  [SIZE_address_pix_t-1:0] write_addresstp;
wire we,re,re_wb;
wire  we_t,re_t;
wire  signed [SIZE_1-1:0] w15,w14,w16,w13,w17,w12,w18,w11,w19;
wire  signed [SIZE_1-1:0]p1,p2,p3,p4,p5,p6,p7,p8,p9;
wire  go;
wire signed [SIZE_1-1:0] dp;
wire signed [SIZE_2*1-1:0] dtp;
wire STOP;
wire [9:0] i_2;

conv_TOP #(1,11,22,33,44,55,66,77,88,99, 13,12,9) CONV_TOP_DUT(clk,conv_en,STOP,memstartp,memstartw,memstartzap,read_addressp,write_addressp,read_addresstp,write_addresstp,read_addressw,we,re_wb,re,we_t,re_t,qp,qtp,qw,dp,dtp,prov,matrix,matrix2,i_2,lvl,slvl,Y1,w15,w14,w16,w13,w17,w12,w18,w11,w19,p1,p2,p3,p8,p7,p4,p5,p9,p6,go,num,filt,bias,globmaxp_en);
initial
	begin
	clk = 0;
	forever #1 clk = ~clk;
end

initial
	begin
@(negedge clk);
clk=1;
conv_en=1;
globmaxp_en=1;
 prov=01;
matrix=15;
 matrix2=100;
 memstartp=10110;
memstartw=101011;
 memstartzap=101011;               																	
lvl=1;
slvl=1;
qp=6;
 qtp=9;
qw=1;
Y1=1001;
 num=3;
filt=2;
bias=1;
	repeat (2)@(negedge clk);
@(negedge clk);
clk=1;
conv_en=1;
globmaxp_en=1;
 prov=11;
matrix=15;
 matrix2=100;
 memstartp=10110;
memstartw=101011;
 memstartzap=101011;               																	
lvl=1;
slvl=1;
qp=6;
 qtp=9;
qw=1;
Y1=1001;
 num=3;
filt=2;
bias=1;
repeat (2)@(negedge clk);
@(negedge clk);
clk=1;
conv_en=1;
globmaxp_en=1;
 prov=00;
matrix=15;
 matrix2=100;
 memstartp=10110;
memstartw=101011;
 memstartzap=101011;               											
lvl=1;
slvl=1;
qp=6;
 qtp=9;
qw=1;
Y1=1001;
 num=3;
filt=2;
bias=1;
	end
endmodule
