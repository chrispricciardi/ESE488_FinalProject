//TOP
module top(
clk,
we_1,
we_2,
we_3,
address_1,
address_2, 	
reset
);

//---Inputs---
input clk;
input reset;

//---Wires---
//wire we;  			//write signal for SRAM (write = 0 implies read)

//--write enables set to INPUT for testing. Change to wires from control
input we_1; // sram_weight1 write enable
input we_2; // sram_weight2 write enable
input we_3; // sram_input write enable


input [17:0] address_1; //sram_weight1 address
input [11:0] address_2; //sram_weight2 address
wire [9:0]  address_3; //sram_input address

wire [15:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10; //data to sram_input
wire [15:0] in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10; //output of input SRAM	
wire [15:0] dw1, dw2; //data to sram_weight1(2)
wire [15:0] weight_1, weight_2; //output of sram_weight


//---INPUT SRAM---
sram_input SRAM_INPUT1(.clk(clk),
	.d(d1), 
	.we(we_3),  
	.address(address_3), 
	.q(in_1)); 
sram_input SRAM_INPUT2(.clk(clk),
	.d(d2), 
	.we(we_3),  
	.address(address_3), 
	.q(in_2)); 
sram_input SRAM_INPUT3(.clk(clk),
	.d(d3), 
	.we(we_3),  
	.address(address_3), 
	.q(in_3)); 
sram_input SRAM_INPUT4(.clk(clk),
	.d(d4), 
	.we(we_3),  
	.address(address_3), 
	.q(in_4)); 
sram_input SRAM_INPUT5(.clk(clk),
	.d(d5), 
	.we(we_3),  
	.address(address_3), 
	.q(in_5)); 
sram_input SRAM_INPUT6(.clk(clk),
	.d(d6), 
	.we(we_3),  
	.address(address_3), 
	.q(in_6)); 
sram_input SRAM_INPUT7(.clk(clk),
	.d(d7), 
	.we(we_3),  
	.address(address_3), 
	.q(in_7)); 
sram_input SRAM_INPUT8(.clk(clk),
	.d(d8), 
	.we(we_3),  
	.address(address_3), 
	.q(in_8)); 
sram_input SRAM_INPUT9(.clk(clk),
	.d(d9), 
	.we(we_3),  
	.address(address_3), 
	.q(in_9)); 
sram_input SRAM_INPUT10(.clk(clk),
	.d(d10), 
	.we(we_3),  
	.address(address_3), 
	.q(in_10)); 

//---WEIGHT SRAMS---
sram_weight1 SRAM_WEIGHT1(.clk(clk),
	.d(dw1), 
	.we(we_1),  
	.address(address_1), 
	.q(weight_1)); 

sram_weight2 SRAM_WEIGHT2(.clk(clk),
	.d(dw2), 
	.we(we_2),  
	.address(address_2), 
	.q(weight_2)); 



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
