`timescale 1ns / 1ps
module addressRAM_tb();

parameter picture_size = 28;
parameter convolution_size = 9;

parameter picture_storage_limit = picture_size*picture_size;
parameter convweight = picture_storage_limit + (1*4 + 4*4 + 4*8 + 8*8) * convolution_size;  // all convolution weights [784:1828]

parameter conv1 = picture_storage_limit + 1*4 * convolution_size;
parameter conv2 = picture_storage_limit + (1*4 + 4*4) * convolution_size;
parameter conv3 = picture_storage_limit + (1*4 + 4*4 + 4*8) * convolution_size;
parameter conv4 = picture_storage_limit + (1*4 + 4*4 + 4*8 + 8*8) * convolution_size;
parameter conv5 = picture_storage_limit + (1*4 + 4*4 + 4*8 + 8*8 + 8*16) * convolution_size;
parameter conv6 = picture_storage_limit + (1*4 + 4*4 + 4*8 + 8*8 + 8*16 + 16*16) * convolution_size;
parameter dense = conv6+176;

reg [4:0] step;
wire  re_RAM;
wire [12:0] firstaddr, lastaddr;

addressRAM ADDERESSRAM(
	step,
	re_RAM,
	 firstaddr, lastaddr
);

initial
begin  
step=1;
#10
step=2;
#10
step=3;
#10
step=4;
#10
step=5;
#10;
step=6;
#10
step=7;
#10
step=8;
#10
step=9;
#10
step=10;
#10;
step=11;
#10
step=12;
#10
step=13;
#10
step=14;
#10
step=15;
#10;
step=16;
#10;
end
endmodule

