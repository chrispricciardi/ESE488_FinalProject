//TOP
module top(
clk,
input_address,			// address to input SRAM
write,				// write signal to input SRAM
wdata1,wdata2,wdata3,wdata4,wdata5,wdata6,wdata7,wdata8,wdata9,wdata10,	// input SRAM data in for SRAM(1-10)		
reset
);

//---Inputs---
input clk;
input reset;
input address_2; 
input write; //write signal for testing SRAM	
input [15:0] wdata1,wdata2,wdata3,wdata4,wdata5,wdata6,wdata7,wdata8,wdata9,wdata10; //input of input SRAM	

//wire write; //write signal for SRAM (write = 0 implies read)
wire [15:0] in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10; //output of input SRAM	 		
wire [15:0] input_address;
//wire [15:0] wdata; 		//data to SRAM



sram_input SRAM1(.clk(clk),
	.wdata(wdata1), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM2(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM3(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM4(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM5(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM6(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM7(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM8(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM9(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 
sram_input SRAM10(.clk(clk),
	.wdata(wdata), 
	.write(write),  
	.address(address_2), 
	.rdata(A)); 

/*
control CONTROL(.clk(clk), 
	.reset(reset), 
	.done(done),
	.ps_in(ps_in), 
	.fs_in(fs_in), 
	.address(address),
	.write(write),
	.multiply_enable(multiply_enable),
	.add_enable(add_enable),
	.fs_out(fs_out));

mult MULT(.clk(clk), 
	.product(product),
	.reset(reset),
	.done(done), 
	.multiply_enable(multiply_enable),
	.A(A),  //multiplier from srama
	.B(B));  //multiplier from sramb
	//.PRODUCT(PRODUCT)); //truncated floating point product 
*/

	




endmodule
