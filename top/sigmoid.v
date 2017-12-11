// sigmoid ready signal needs to be reworked

module sigmoid(
	clk,
	reset,
	done,
	d,
	we,
	sig_ready,
	sig_in,
	address,//BS address
	sig_out
);

//Data is stored as an 8.8 fixed point number
input clk;
input reset;
input done;
input [6:0] address; //address for writing to sigmoid 
input we; //write enable for registers holding Sigmoid values
input signed [15:0] d; //data input to Sigmoid value register
input signed [15:0] sig_in;
output [15:0] sig_out;
output sig_ready;

//HOPEFULLY THIS ISN'T SYNTHESIZED AWWWAYYYYYYYYY!!!!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?!?
reg signed [15:0] x [120:0];	//Create the memory for the input ranges to the sigmoid
reg signed [15:0] LUT [120:0];	//Create the memory for the outputs to the sigmoid
reg signed [15:0] y;		//Store the output of the LUT
reg sig_rdy;

integer i;


//Tie the output of the LUT register to the output of the sigmoid module
assign sig_out = y;

//Tie the sigmoid ready register to its output
assign sig_ready = sig_rdy;
	
//Define the sigmoid lookup table
always @(posedge clk) 
begin

	
	if (we == 1)begin 
	x[address] <= d; 
	LUT[address] <= d;

	end else if(we == 0)begin 

/*
	if(sig_rdy)begin 
	sig_rdy <= 0; 
	end
	*/

	//If reset is held high reset
	if (reset==1) begin
		y<=0;
		sig_rdy<=0;
	end
	//If the MAC output is ready, compare it to the lookup table
	else if (done==1) begin
		sig_rdy<=0; //set sig_ready to low 
		//Implement the lookup table
		//If the input is less than 6
		if (sig_in >= $signed(16'b1111101000000000) && sig_in <= $signed(16'b0000011000000000)) begin
			for (i=0; i<120; i=i+1) begin
				//If the sigmoid input is between two registers, it must be
				//in that bin
				if ((sig_in >= x[i]) && (sig_in < x[i+1])) begin
				//if (sig_in <= x[i] && sig_in > x[i+1]) begin
					//Assign the lower y-value bin to the output register
					y<=LUT[i];
				end
			end
		end
		else if (sig_in < $signed(16'b1111101000000000)) begin
			y<=16'h0000;
		end

		//If the input is more than 6
		else if (sig_in > $signed(16'b0000011000000000)) begin
			y<=16'h0100;
		end
		
	/*
		if (sig_in < $signed(16'b1111101000000000)) begin
			y<=16'h0000;
		end
		//If the input is more than 6
		else if (sig_in > $signed(16'b0000011000000000)) begin
			y<=16'h0100;
		end
		//Otherwise go to the LUT
		else begin
			//Replicate bin comparitor logic
			for (i=0; i<120; i=i+1) begin
				//If the sigmoid input is between two registers, it must be
				//in that bin
				if ((sig_in >= x[i]) && (sig_in < x[i+1])) begin
				//if (sig_in <= x[i] && sig_in > x[i+1]) begin
					//Assign the lower y-value bin to the output register
					y<=LUT[i];
				end
			end
		end
	*/

		
		//The sigmoid function is now ready
		#5 sig_rdy <= 1;
		
		end
	end
end


endmodule
