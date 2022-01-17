//Sim11
module dense_tb();
  
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
parameter SIZE_address_wei=9;

reg clk,dense_en;
wire  STOP;
reg [4:0] in;
reg [3:0] out;
wire  we,re_p,re_w;
wire  [SIZE_address_pix-1:0] read_addressp;
wire  [SIZE_address_wei-1:0] read_addressw;
wire  [SIZE_address_pix-1:0] write_addressp;
reg [SIZE_address_pix-1:0] memstartp,memstartzap;
reg signed [SIZE_1-1:0] qp;
reg signed [SIZE_9-1:0] qw;
wire  signed [SIZE_1-1:0] res;
reg signed [SIZE_1+SIZE_1-2:0] Y1;
wire  signed [SIZE_1-1:0] w11, w12, w13, w14, w15, w16, w17, w18, w19;
wire  signed [SIZE_1-1:0] p11, p12, p13, p14, p15, p16, p17, p18, p19;
wire go;
reg [4:0] in_dense;
reg nozero;
dense #(1,11,22,33,44,55,66,77,88,99,13,9) DENSE(clk, dense_en, STOP, in, out, we, re_p, re_w, read_addressp, read_addressw, write_addressp, memstartp, memstartzap, qp, qw, res, Y1, w11, w12, w13, w14, w15, w16, w17, w18, w19, p11, p12, p13, p14, p15, p16, p17, p18, p19, go, nozero, in_dense);
initial
begin
clk = 0;
forever #1 clk = ~clk;
end
initial
begin
Y1=100;
dense_en=1;
in=100;
in_dense=8;
memstartzap=100;
memstartp=120;
nozero=1;
out=4;
qp=123;
qw=12;
   end
endmodule

