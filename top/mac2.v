module mac2(
	clk,
	reset,
	start,	
	mac_in,
	weight,
	mac_out,
	addr_in,
	reg_read,
	mac_req_addr,
	read,
	write
);

input clk;
input reset;
input start;	//Set start high whenever you enter a new data set
input signed [15:0] mac_in;	//Input from the MUX
input signed [15:0] weight;	//Input from the weight function
output signed [15:0] mac_out;	//Output back to the register file
input [6:0] addr_in;		//Address corresponding to the data entering the pipeline
output reg [6:0] mac_req_addr;	//Address corresponding to the data exiting the pipeline
input signed [15:0] reg_read;	//Data from register file (for psum)

output reg read, write;		//Need to be high to access the register file (SHOULD BE OUTPUTS)

//Define variables
wire signed [15:0] mult_out;
wire mac2_en; 		//enable the MAC to output

//Stages 1-5 correspond to the multiplier module
//Stage 6 corresponds to the accumulate stage
reg stage1, stage2, stage3, stage4, stage5, stage6;
reg [6:0] addr1, addr2, addr3, addr4, addr5, addr6;

//Instantiate a pipelined multiplier
mult mult1(clk, reset, mac_in, weight, mult_out);

//If the address is valid, continue operations 
assign mac2_en= (addr6>=0 && addr6 <=99) ? 1'b1 : 1'b0;

//Keep track of the delay through the pipeline
always @(posedge clk) begin
//Reset if reset is high 
	if(reset==1) begin
		stage1<=0;
		stage2<=0;
		stage3<=0;
		stage4<=0;
		stage5<=0;
		addr1<=0;
		addr2<=0;
		addr3<=0;
		addr4<=0;
		addr5<=0;
		addr6<=0;	
	end
	else begin
		stage1<=start;
		stage2<=stage1;
		stage3<=stage2;
		stage4<=stage3;
		stage5<=stage4;
		stage6<=stage5;
		addr1<=addr_in;
		addr2<=addr1;
		addr3<=addr2;
		addr4<=addr3;
		addr5<=addr4;
		addr6<=addr5;
	end
end

//Request the contents from the register file pointed to by the address in stage 6
//Also used to writeback to the regfile on the same clock cycle
//assign mac_req_addr = (mac2_en==1) ? addr6 : 7'b0000000;
always @ (mac2_en) begin 
	if (mac2_en == 1) begin 
		mac_req_addr <= addr6; 
	end else begin 
		mac_req_addr <= 7'b0000000;
	end
end

//If the pipeline does not have a valid address at the last stage, then the
//read and write signals are set low and the regfile is not modified
initial begin
read<=mac2_en;
write<=mac2_en;
end


//The output of the MAC is added to the multiplier ouptut if the MAC is active
//Otherwise, it just returns the same value that was read from memory
assign mac_out = (mac2_en==1) ? (reg_read + mult_out): (reg_read);

endmodule
