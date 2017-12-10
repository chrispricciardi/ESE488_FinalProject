module reg_out(
	clk,
	reset,
	write_regs,
	regs_out,
	addr,	
	write,
	read
);


input clk;
input reset;
input [15:0] write_regs;
output reg [15:0] regs_out;
input [6:0] addr;	//One unified address 99:0	
input read;
input write;



reg [15:0] regs [99:0];
integer i;




always @(posedge clk) begin
	//Reset if high
	if (reset==1) begin
		for (i=0; i<100; i=i+1) begin
			regs[i]<=0;	
		end
	end
	//Normal operation
	else begin
		//If write is high update the target register
		if (write==1)begin
			regs[addr]<=write_regs;	
		end
		if (read==1) begin
			regs_out<=regs[addr];
		end
		else begin
			regs_out<=16'h0000;
		end

	end

end




endmodule
