//SRAMA
module sram_input(
clk,
we,
d,
address,
q
);

input clk;	
input we;		//if(we) > [write enable] else > [read enable]
input signed [15:0] d; 	//data input (high impedance for this design)
input [9:0] address;	//memory address
output reg signed [15:0] q; 	//output

reg signed [15:0] mem [0:783];  

always @(posedge clk)
begin 
	if (we == 1)begin 
	mem[address] <= d; 

	end else if(we == 0)begin 
	q <= mem[address]; 
	end 
end

endmodule
