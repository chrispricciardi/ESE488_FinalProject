module mac2(
	clk,
	reset,
	start,	
	done,
	sig_rdy,	
	mac_in,
	weight,
	mac_out	
);

input clk;
input reset;
input sig_rdy;
input start;	//Set start high whenever you enter a new data set
output done;	//Done is output when the MAC is done and restarting calculations with a new set
input signed [15:0] mac_in;
input signed [15:0] weight;
output signed [15:0] mac_out;

//Define variables
reg signed [15:0] psum;
wire signed [15:0] mult_out;

//Stages 1-5 correspond to the multiplier module
//Stage 6 corresponds to the accumulate stage
reg stage1, stage2, stage3, stage4, stage5, stage6;

mult mult1(clk, reset, sig_mux, weight, mult_out);

assign mac_out = psum;
assign done = stage6;
assign sig_mux = (sig_rdy == 1)? mac_in : 16'h0000; //"mux the sigmoid output DONE" -ALAN




always @(posedge clk) 
begin
	//Reset if reset is high 
	if(reset==1) begin
		psum<=0;
		stage1<=0;
		stage2<=0;
		stage3<=0;
		stage4<=0;
		stage5<=0;
	end
	
	//If stage6==1, the next input to psum must be from a new data set
	else if(stage6==1) begin
		#3 psum<=mult_out;

		//Keep track of the delay of data through the pipeline
		stage1<=start;
		stage2<=stage1;
		stage3<=stage2;
		stage4<=stage3;
		stage5<=stage4;
		stage6<=stage5;

	end
	else begin
		//Update the psum
		#3 psum<= psum + mult_out;

		//Keep track of the delay of data through the pipeline
		stage1<=start;
		stage2<=stage1;
		stage3<=stage2;
		stage4<=stage3;
		stage5<=stage4;
		stage6<=stage5;

	end
end

endmodule
