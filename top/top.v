//TOP
module top(
clk,
we,
address_1, //weight 1 SRAM address
address_2, 
address_3, //input SRAM address
//address_4,
address_5,//address for sigmoid BS
mac1_start,
mac2_start,
mac1_done, 
mac2_done,
sel,	
sig_ready,
reset
);

//---Inputs---
input clk;
input reset;

//--write enables and addresses set to INPUT for testing. Change to wires from control
input we; // SRAM write enable
input [17:0] address_1; //sram_weight1 address
input [11:0] address_2; //sram_weight2 address
input [9:0]  address_3; //sram_input address
//input [5:0] address_4; //sram_output address
input [6:0] address_5; //BS sig address
input [6:0] sel; //select signal for hidden layer mux to output layer
input mac1_start, mac2_start; // mac signal set to input for testing


//---WIRES---
wire signed [15:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9; //data to sram_input
wire signed [15:0] in0_0,in1_0, in2_0, in3_0, in4_0, in5_0, in6_0, in7_0, in8_0, in9_0; //output of input SRAM	
wire signed [15:0] in0_1,in1_1,in2_1,in3_1,in4_1,in5_1,in6_1,in7_1,in8_1,in9_1; //output of 1st MAC
wire signed [15:0] hid0,hid1,hid2,hid3,hid4,hid5,hid6,hid7,hid8,hid9; //output of 1st Sigmoid 

wire signed [15:0] dw1,dw2; //data to sram_weight1(2)
wire signed [15:0] weight_1,weight_2; //output of sram_weight1(2)
wire signed [15:0] mux_in_0,mux_in_1,mux_in_2,mux_in_3,mux_in_4,mux_in_5,mux_in_6,mux_in_7,mux_in_8,mux_in_9; //wire from hidden layer sigmoid to mux input
wire signed [15:0] mux_out; //output of mux to output layer MAC
wire sig1_ready0,sig1_ready1,sig1_ready2,sig1_ready3,sig1_ready4,sig1_ready5,sig1_ready6, sig1_ready7,sig1_ready8, sig1_ready9; //sigmoid ready signal 
wire signed [15:0] mac_out; 
wire read, write;//signals from mac2 to reg_out
wire [6:0] mac_req_addr;
wire signed [15:0] reg_read; 

//---OUTPUTS---
output  mac1_done, mac2_done; // control signal from MAC
output wire sig_ready;
assign sig_ready = sig1_ready0;

reg signed [15:0] data = 0; 

assign d0 = data;
assign d1 = data; 
assign d2 = data;
assign d3 = data; 
assign d4 = data;
assign d5 = data; 
assign d6 = data;
assign d7 = data; 
assign d8 = data;
assign d9 = data; 
assign dw1 = data; 
assign dw2 = data; 


//---INPUT SRAM---
sram_input SRAM_INPUT0(.clk(clk),
	.d(d0), 
	.we(we),  
	.address(address_3), 
	.q(in0_0)); 
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
mac MAC0(.clk(clk), 
	.reset(reset),
	.start(mac1_start), 
	.done(mac1_done),
	.mac_in(in0_0),
	.weight(weight_1),
	.mac_out(in0_1));
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


//---SIGMOID 1---
sigmoid SIGMOID1_0(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready0), 
		.sig_in(in0_1),
		.sig_out(hid0)); 
sigmoid SIGMOID1_1(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we),
		.reset(reset),
		.done(mac1_done),
		.sig_ready(sig1_ready1), 
		.sig_in(in1_1),
		.sig_out(hid1)); 
sigmoid SIGMOID1_2(.clk(clk),
		.address(address_5), 
		.d(d1), 
		.we(we),
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready2), 
		.sig_in(in2_1),
		.sig_out(hid2)); 
sigmoid SIGMOID1_3(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready3), 
		.sig_in(in3_1),
		.sig_out(hid3)); 
sigmoid SIGMOID1_4(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready4), 
		.sig_in(in4_1),
		.sig_out(hid4)); 
sigmoid SIGMOID1_5(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready5), 
		.sig_in(in5_1),
		.sig_out(hid5)); 
sigmoid SIGMOID1_6(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready6), 
		.sig_in(in6_1),
		.sig_out(hid6)); 
sigmoid SIGMOID1_7(.clk(clk),
		.address(address_5), 
		.d(d1), 
		.we(we),  
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready7), 
		.sig_in(in7_1),
		.sig_out(hid7));  
sigmoid SIGMOID1_8(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready8), 
		.sig_in(in8_1),
		.sig_out(hid8)); 
sigmoid SIGMOID1_9(.clk(clk), 
		.address(address_5), 
		.d(d1), 
		.we(we), 
		.reset(reset), 
		.done(mac1_done),
		.sig_ready(sig1_ready9), 
		.sig_in(in9_1),
		.sig_out(hid9)); 

//---MUX--- 
//multiplex output of hidden layer sigmoids and feed values to a single output layer MAC
mux MUX(.mux_in_0(hid0), 
	.mux_in_1(hid1), 
	.mux_in_2(hid2),
	.mux_in_3(hid3),
	.mux_in_4(hid4),
	.mux_in_5(hid5),
	.mux_in_6(hid6),
	.mux_in_7(hid7), 
	.mux_in_8(hid8), 
	.mux_in_9(hid9), 
	.mux_out(mux_out),
	.sel(sel));

//---MAC2---
mac2 MAC_OUT(.clk(clk), 
	.reset(reset),
	.start(mac2_start),
	.mac_in(mux_out),
	.weight(weight_2), 
	.mac_out(mac_out),
	.addr_in(sel),
	.reg_read(reg_read), //Data from register file (for psum)
	.mac_req_addr(mac_req_addr),//Address corresponding to the data exiting the pipeline
	.read(read), 
	.write(write));

//---REG_out---
reg_out REG_OUT(.clk(clk),  
	.reset(reset), 
	.write_regs(mac_out), 
	.regs_out(reg_read), 
	.addr(mac_req_addr), 
	.write(write), 
	.read(read));

endmodule
