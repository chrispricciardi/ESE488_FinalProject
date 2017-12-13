module reg_out(
	clk,
	reset,
	data_from_sig,
	data_to_mac,
	data_from_mac,
	data_to_sig,
	mac_addr,
	sig_addr,	
	write_mac,
	read_mac,
	write_sig,
	read_sig
);


input clk;
input reset;
input [15:0] data_from_mac, data_from_sig;
output reg [15:0] data_to_mac, data_to_sig;
input [6:0] mac_addr, sig_addr;	//One unified address 99:0	
input read_mac;
input write_mac;
input read_sig;
input write_sig;


/*
wire read;
assign read= (read_mac | read_sig);
wire write;
assign write=(write_mac | write_sig);
*/

reg [15:0] regs [99:0];
integer i;

always @(posedge clk) begin
	//Reset if high
	if (reset==1) begin
		for (i=0; i<100; i=i+1) begin
			regs[i]<=0;	
		end
	end
	//Normal operation for MAC
	else if (write_mac==1 || read_mac==1) begin
		//If write is high update the target register
		if (write_mac==1)begin
			regs[mac_addr]<=data_from_mac;	
		end
		if (read_mac==1) begin
			data_to_mac<=regs[mac_addr];
		end
		else begin
			data_to_mac<=16'h0000;
		end

	end
	else if (write_sig ==1 || read_sig==1) begin
		if (write_mac==1)begin
			regs[sig_addr]<=data_from_sig;	
		end
		if (read_mac==1) begin
			data_to_sig<=regs[sig_addr];
		end
		else begin
			data_to_sig<=16'h0000;
		end

	end

end




endmodule
