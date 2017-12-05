//TOP
module top(
clk,
we_1,
we_2,
we_3,
address_1,
address_2, 
address_3,
mac_start,	
reset
);

//---Inputs---
input clk;
input reset;

//---Wires---

//--write enables and addresses set to INPUT for testing. Change to wires from control
input we_1; // sram_weight1 write enable
input we_2; // sram_weight2 write enable
input we_3; // sram_input write enable


input [17:0] address_1; //sram_weight1 address
input [11:0] address_2; //sram_weight2 address
input [9:0]  address_3; //sram_input address

wire signed [15:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10; //data to sram_input
wire signed [15:0] in1_0, in2_0, in3_0, in4_0, in5_0, in6_0, in7_0, in8_0, in9_0, in10_0; //output of input SRAM	
wire signed [15:0] in1_1, in2_1, in3_1, in4_1, in5_1, in6_1, in7_1, in8_1, in9_1, in10_1; //output of 1st MAC
wire signed [15:0] in1_2, in2_2, in3_2, in4_2, in5_2, in6_2, in7_2, in8_2, in9_2, in10_2; //output of Sigmoid
wire signed [15:0] dw1, dw2; //data to sram_weight1(2)
wire signed [15:0] weight_1, weight_2; //output of sram_weight1(2)
input mac_start; // mac signal set to input for testing
wire  mac_done; // control signal from MAC
wire sig_ready1,sig_ready2,sig_ready3,sig_ready4,sig_ready5,sig_ready6, sig_ready7,sig_ready8, sig_ready9,sig_ready10; //sigmoid ready signal (as if it wasn't obvious enough... Alan)

reg signed [15:0] data = 0; 

assign d1 = data; 
assign d2 = data;
assign d3 = data; 
assign d4 = data;
assign d5 = data; 
assign d6 = data;
assign d7 = data; 
assign d8 = data;
assign d9 = data; 
assign d10 = data;
assign dw1 = data; 
assign dw2 = data; 


//---INPUT SRAM---
sram_input SRAM_INPUT1(.clk(clk),
	.d(d1), 
	.we(we_3),  
	.address(address_3), 
	.q(in1_0)); 
sram_input SRAM_INPUT2(.clk(clk),
	.d(d2), 
	.we(we_3),  
	.address(address_3), 
	.q(in2_0)); 
sram_input SRAM_INPUT3(.clk(clk),
	.d(d3), 
	.we(we_3),  
	.address(address_3), 
	.q(in3_0)); 
sram_input SRAM_INPUT4(.clk(clk),
	.d(d4), 
	.we(we_3),  
	.address(address_3), 
	.q(in4_0)); 
sram_input SRAM_INPUT5(.clk(clk),
	.d(d5), 
	.we(we_3),  
	.address(address_3), 
	.q(in5_0)); 
sram_input SRAM_INPUT6(.clk(clk),
	.d(d6), 
	.we(we_3),  
	.address(address_3), 
	.q(in6_0)); 
sram_input SRAM_INPUT7(.clk(clk),
	.d(d7), 
	.we(we_3),  
	.address(address_3), 
	.q(in7_0)); 
sram_input SRAM_INPUT8(.clk(clk),
	.d(d8), 
	.we(we_3),  
	.address(address_3), 
	.q(in8_0)); 
sram_input SRAM_INPUT9(.clk(clk),
	.d(d9), 
	.we(we_3),  
	.address(address_3), 
	.q(in9_0)); 
sram_input SRAM_INPUT10(.clk(clk),
	.d(d10), 
	.we(we_3),  
	.address(address_3), 
	.q(in10_0)); 

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

//---MAC---
mac MAC1(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in1_0),
	.weight(weight_1),
	.mac_out(in1_1));
mac MAC2(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in2_0),
	.weight(weight_1),
	.mac_out(in2_1));
mac MAC3(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in3_0),
	.weight(weight_1),
	.mac_out(in3_1));
mac MAC4(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in4_0),
	.weight(weight_1),
	.mac_out(in4_1));
mac MAC5(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in5_0),
	.weight(weight_1),
	.mac_out(in5_1));
mac MAC6(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in6_0),
	.weight(weight_1),
	.mac_out(in6_1));
mac MAC7(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in7_0),
	.weight(weight_1),
	.mac_out(in7_1));
mac MAC8(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in8_0),
	.weight(weight_1),
	.mac_out(in8_1));
mac MAC9(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in9_0),
	.weight(weight_1),
	.mac_out(in9_1));
mac MAC10(.clk(clk), 
	.reset(reset),
	.start(mac_start), 
	.done(mac_done),
	.mac_in(in10_0),
	.weight(weight_1),
	.mac_out(in10_1));

//---SIGMOID---

sigmoid SIGMOID1(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready1), 
		.sig_in(in1_1),
		.sig_out(in1_2)); 
sigmoid SIGMOID2(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready2), 
		.sig_in(in2_1),
		.sig_out(in2_2)); 
sigmoid SIGMOID3(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready3), 
		.sig_in(in3_1),
		.sig_out(in3_2)); 
sigmoid SIGMOID4(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready4), 
		.sig_in(in4_1),
		.sig_out(in4_2)); 
sigmoid SIGMOID5(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready5), 
		.sig_in(in5_1),
		.sig_out(in5_2)); 
sigmoid SIGMOID6(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready6), 
		.sig_in(in6_1),
		.sig_out(in6_2)); 
sigmoid SIGMOID7(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready7), 
		.sig_in(in7_1),
		.sig_out(in7_2));  
sigmoid SIGMOID8(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready8), 
		.sig_in(in8_1),
		.sig_out(in8_2)); 
sigmoid SIGMOID9(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready9), 
		.sig_in(in9_1),
		.sig_out(in9_2)); 
sigmoid SIGMOID10(.clk(clk), 
		.reset(reset), 
		.done(mac_done),
		.sig_ready(sig_ready10), 
		.sig_in(in10_1),
		.sig_out(in10_2)); 

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
