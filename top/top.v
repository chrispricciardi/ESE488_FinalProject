//TOP
module top(
clk,
we,
address_1,
address_2, 
address_3,
address_4,
address_5,//address for sigmoid BS
mac1_start,
mac2_start,
mac1_done, 
mac2_done,	
reset
);

//---Inputs---
input clk;
input reset;

//---Wires---

//--write enables and addresses set to INPUT for testing. Change to wires from control
input we; // SRAM write enable

input [17:0] address_1; //sram_weight1 address
input [11:0] address_2; //sram_weight2 address
input [9:0]  address_3; //sram_input address
input [5:0] address_4; //sram_output address
input [6:0] address_5; //BS sig address

wire signed [15:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10; //data to sram_input
wire signed [15:0] in1_0, in2_0, in3_0, in4_0, in5_0, in6_0, in7_0, in8_0, in9_0, in10_0; //output of input SRAM	
wire signed [15:0] in1_1, in2_1, in3_1, in4_1, in5_1, in6_1, in7_1, in8_1, in9_1, in10_1; //output of 1st MAC
wire signed [15:0] hid1_0, hid2_0, hid3_0, hid4_0, hid5_0, hid6_0, hid7_0, hid8_0, hid9_0, hid10_0; //output of 1st Sigmoid 
wire signed [15:0] hid1_1, hid2_1, hid3_1, hid4_1, hid5_1, hid6_1, hid7_1, hid8_1, hid9_1, hid10_1; //output of 2nd MAC
wire signed [15:0] out1,out2,out3,out4,out5,out6,out7,out8,out9,out10; //output of 2nd Sigmoid
wire signed [15:0] alan1,alan2,alan3,alan4,alan5,alan6,alan7,alan8,alan9,alan10; //Final Output
wire signed [15:0] dw1, dw2; //data to sram_weight1(2)
wire signed [15:0] weight_1, weight_2; //output of sram_weight1(2)
input mac1_start, mac2_start; // mac signal set to input for testing
output  mac1_done, mac2_done; // control signal from MAC


wire sig1_ready1,sig1_ready2,sig1_ready3,sig1_ready4,sig1_ready5,sig1_ready6, sig1_ready7,sig1_ready8, sig1_ready9, sig1_ready10; //sigmoid ready signal (as if it wasn't obvious enough... Alan)
wire sig2_ready1,sig2_ready2,sig2_ready3,sig2_ready4,sig2_ready5,sig2_ready6, sig2_ready7,sig2_ready8, sig2_ready9, sig2_ready10; //sigmoid ready signal (as if it wasn't obvious enough... Alan)
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
	.we(we),  
	.address(address_3), 
	.q(in1_0)); 
sram_input SRAM_INPUT2(.clk(clk),
	.d(d2), 
	.we(we),  
	.address(address_3), 
	.q(in2_0)); 
sram_input SRAM_INPUT3(.clk(clk),
	.d(d3), 
	.we(we),  
	.address(address_3), 
	.q(in3_0)); 
sram_input SRAM_INPUT4(.clk(clk),
	.d(d4), 
	.we(we),  
	.address(address_3), 
	.q(in4_0)); 
sram_input SRAM_INPUT5(.clk(clk),
	.d(d5), 
	.we(we),  
	.address(address_3), 
	.q(in5_0)); 
sram_input SRAM_INPUT6(.clk(clk),
	.d(d6), 
	.we(we),  
	.address(address_3), 
	.q(in6_0)); 
sram_input SRAM_INPUT7(.clk(clk),
	.d(d7), 
	.we(we),  
	.address(address_3), 
	.q(in7_0)); 
sram_input SRAM_INPUT8(.clk(clk),
	.d(d8), 
	.we(we),  
	.address(address_3), 
	.q(in8_0)); 
sram_input SRAM_INPUT9(.clk(clk),
	.d(d9), 
	.we(we),  
	.address(address_3), 
	.q(in9_0)); 
sram_input SRAM_INPUT10(.clk(clk),
	.d(d10), 
	.we(we),  
	.address(address_3), 
	.q(in10_0)); 

//---WEIGHT SRAMS---
sram_weight1 SRAM_WEIGHT1(.clk(clk),
	.d(dw1), 
	.we(we),  
	.address(address_1), 
	.q(weight_1)); 

sram_weight2 SRAM_WEIGHT2(.clk(clk),
	.d(dw2), 
	.we(we),  
	.address(address_2), 
	.q(weight_2)); 

//---MAC---
mac MAC1(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in1_0),
	.weight(weight_1),
	.mac_out(in1_1));
mac MAC2(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in2_0),
	.weight(weight_1),
	.mac_out(in2_1));
mac MAC3(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in3_0),
	.weight(weight_1),
	.mac_out(in3_1));
mac MAC4(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in4_0),
	.weight(weight_1),
	.mac_out(in4_1));
mac MAC5(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in5_0),
	.weight(weight_1),
	.mac_out(in5_1));
mac MAC6(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in6_0),
	.weight(weight_1),
	.mac_out(in6_1));
mac MAC7(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in7_0),
	.weight(weight_1),
	.mac_out(in7_1));
mac MAC8(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in8_0),
	.weight(weight_1),
	.mac_out(in8_1));
mac MAC9(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in9_0),
	.weight(weight_1),
	.mac_out(in9_1));
mac MAC10(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in10_0),
	.weight(weight_1),
	.mac_out(in10_1));

//---SIGMOID 1---

sigmoid SIGMOID1_1(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we),
		.reset(reset),
		.done(mac1_done),
		.sig_ready(sig1_ready1), 
		.sig_in(in1_1),
		.sig_out(hid1_0)); 
sigmoid SIGMOID1_2(.clk(clk),
		.address(address_5), 
		.d(d1), 
		.we(we),
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready2), 
		.sig_in(in2_1),
		.sig_out(hid2_0)); 
sigmoid SIGMOID1_3(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready3), 
		.sig_in(in3_1),
		.sig_out(hid3_0)); 
sigmoid SIGMOID1_4(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready4), 
		.sig_in(in4_1),
		.sig_out(hid4_0)); 
sigmoid SIGMOID1_5(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready5), 
		.sig_in(in5_1),
		.sig_out(hid5_0)); 
sigmoid SIGMOID1_6(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready6), 
		.sig_in(in6_1),
		.sig_out(hid6_0)); 
sigmoid SIGMOID1_7(.clk(clk),
		.address(address_5), 
		.d(d1), 
		.we(we),  
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready7), 
		.sig_in(in7_1),
		.sig_out(hid7_0));  
sigmoid SIGMOID1_8(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready8), 
		.sig_in(in8_1),
		.sig_out(hid8_0)); 
sigmoid SIGMOID1_9(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready9), 
		.sig_in(in9_1),
		.sig_out(hid9_0)); 
sigmoid SIGMOID1_10(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready10), 
		.sig_in(in10_1),
		.sig_out(hid10_0)); 

//---MAC2---
mac2 MAC2_1(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready1),
	.mac_in(hid1_0),
	.weight(weight_2),
	.mac_out(hid1_1));
mac2 MAC2_2(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready2),
	.mac_in(hid2_0),
	.weight(weight_2),
	.mac_out(hid2_1));
mac2 MAC2_3(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready3),
	.mac_in(hid3_0),
	.weight(weight_2),
	.mac_out(hid3_1));
mac2 MAC2_4(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready4),
	.mac_in(hid4_0),
	.weight(weight_2),
	.mac_out(hid4_1));
mac2 MAC2_5(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready5),
	.mac_in(hid5_0),
	.weight(weight_2),
	.mac_out(hid5_1));
mac2 MAC2_6(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready6),
	.mac_in(hid6_0),
	.weight(weight_2),
	.mac_out(hid6_1));
mac2 MAC2_7(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready7),
	.mac_in(hid7_0),
	.weight(weight_2),
	.mac_out(hid7_1));
mac2 MAC2_8(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready8),
	.mac_in(hid8_0),
	.weight(weight_2),
	.mac_out(hid8_1));
mac2 MAC2_9(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready9),
	.mac_in(hid9_0),
	.weight(weight_2),
	.mac_out(hid9_1));
mac2 MAC2_10(.clk(clk), 
	.reset(reset),
	.start(mac2_start), 
	.done(mac2_done),
	.sig_rdy(sig1_ready10),
	.mac_in(hid10_0),
	.weight(weight_2),
	.mac_out(hid10_1));

//---SIGMOID 2---

sigmoid SIGMOID2_1(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we),
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready1), 
		.sig_in(hid1_1),
		.sig_out(out1)); 
sigmoid SIGMOID2_2(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready2), 
		.sig_in(hid2_1),
		.sig_out(out2)); 
sigmoid SIGMOID2_3(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready3), 
		.sig_in(hid3_1),
		.sig_out(out3)); 
sigmoid SIGMOID2_4(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready4), 
		.sig_in(hid4_1),
		.sig_out(out4)); 
sigmoid SIGMOID2_5(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready5), 
		.sig_in(hid5_1),
		.sig_out(out5)); 
sigmoid SIGMOID2_6(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready6), 
		.sig_in(hid6_1),
		.sig_out(out6)); 
sigmoid SIGMOID2_7(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready7), 
		.sig_in(hid7_1),
		.sig_out(out7));  
sigmoid SIGMOID2_8(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready8), 
		.sig_in(hid8_1),
		.sig_out(out8)); 
sigmoid SIGMOID2_9(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready9), 
		.sig_in(hid9_1),
		.sig_out(out9)); 
sigmoid SIGMOID2_10(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac2_done),
		.sig_ready(sig2_ready10), 
		.sig_in(hid10_1),
		.sig_out(out10)); 

//---Output SRAM---
sram_output SRAM_OUTPUT1(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan1)); 
sram_output SRAM_OUTPUT2(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan2)); 
sram_output SRAM_OUTPUT3(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan3)); 
sram_output SRAM_OUTPUT4(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan4));
sram_output SRAM_OUTPUT5(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan5));
sram_output SRAM_OUTPUT6(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan6));
sram_output SRAM_OUTPUT7(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan7));
sram_output SRAM_OUTPUT8(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan8));
sram_output SRAM_OUTPUT9(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan9));
sram_output SRAM_OUTPUT10(.clk(clk),
		.d(out1), 
		.we(we),  
		.address(address_4), 
		.q(alan10));
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
*/

	




endmodule
