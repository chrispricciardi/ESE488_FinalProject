module sigmoid2(
	clk,
	reset,
	address,//BS input
	read_regs,
	write_regs,
	sig_addr,
	address_2,
	read,
	d,
	we,
	write,
	all_done
);



input clk;
input we;
input reset;
input signed[15:0] d;
input [6:0]address;
input signed [15:0] read_regs;
input [11:0] address_2;
output signed [15:0] write_regs;
output reg [6:0] sig_addr;
output wire read;
output wire write;
output wire all_done;

wire [15:0] sig_in;
reg prev_address2;
reg start_sig;

reg signed [15:0] x [120:0];	//Create the memory for the input ranges to the sigmoid
reg signed [15:0] LUT [120:0];	//Create the memory for the outputs to the sigmoid
reg signed [15:0] y;		//Store the output of the LUT

integer i; 
//Tie the input/output pins to the existing code
assign sig_in=read_regs;
assign write_regs=y;

//Starts the address handler
always @(posedge clk) begin
	prev_address2<=address_2;
	//Reset if high
	if (reset==1) begin
		prev_address2<=0;
		start_sig<=0;
	end
	//If we have reached the last address
	else if (address_2>=1999 && (prev_address2==address_2)) begin
		start_sig<=1;  
	end
end


//Generate the address
always @(posedge clk) begin
	if (reset ==1) begin 
		sig_addr<=0;
	end	
	else if (start_sig==1) begin
		sig_addr<=sig_addr+1;
	end 
end

assign all_done= (sig_addr>=100) ? 1'b1 : 1'b0;
assign read=start_sig;
assign write=start_sig;



	
//Define the sigmoid lookup table
always @(posedge clk) 
begin

	
	if (we == 1)begin 
		x[address] <= d; 
		LUT[address] <= d;
	end else if(we == 0)begin 


		//If reset is held high reset
		if (reset==1) begin
			y<=0;
		end
		//If the MAC output is ready, compare it to the lookup table
		else if (start_sig==1) begin
			//Implement the lookup table
			//If the input is less than 6
			if (sig_in >= $signed(16'b1111101000000000) && sig_in <= $signed(16'b0000011000000000)) begin
				for (i=0; i<120; i=i+1) begin
					//If the sigmoid input is between two registers, it must be
					//in that bin
					if ((sig_in >= x[i]) && (sig_in < x[i+1])) begin
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
		end
	end
end

endmodule 

