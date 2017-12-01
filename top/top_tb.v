
`timescale 1ns / 1ps

module top_tb();
	reg clk;
	reg reset;
	reg write;
	reg[15:0] rdata1,rdata2,rdata3,rdata4,rdata5,rdata6,rdata7,rdata8,rdata9,rdata10;// for SRAM testing
	reg[15:0] input_address;	
	reg[15:0] wdata1,wdata2,wdata3,wdata4,wdata5,wdata6,wdata7,wdata8,wdata9,wdata10;//for SRAM testing
	reg[15:0] mem1 [0:783];
	reg[15:0] mem2 [0:783];
	reg[15:0] mem3 [0:783];
	reg[15:0] mem4 [0:783];
	reg[15:0] mem5 [0:783];
	reg[15:0] mem6 [0:783];
	reg[15:0] mem7 [0:783];
	reg[15:0] mem8 [0:783];
	reg[15:0] mem9 [0:783];
	reg[15:0] mem10 [0:783];
	integer j; 
	

    top DUT(
        .clk(clk),
	.address(address),		//testing SRAM
	.write(write),
	.wdata(wdata),			//testing SRAM
        .reset(reset)
        );

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top_tb);

	$readmemb("test_image1_fix.txt", mem1);

	clk = 0;
	reset = 0;
	write = 1;
 
	for(j=0; j<784; j=j+1) begin
		#20
		input_address = j; 		//increment address to input SRAM
		wdata1 = mem1[j];	//write txt file to input SRAM
		wdata2 = mem2[j];
		wdata3 = mem3[j];
		wdata4 = mem4[j];
		wdata5 = mem5[j];
		wdata6 = mem6[j];
		wdata7 = mem7[j];
		wdata8 = mem8[j];
		wdata9 = mem9[j];
		wdata10 = mem10[j];

	end	

		#20
		write = 0; 

		#20
		reset = 0;
		
		#20
		address = 0; 

		#20
		address = 93;

		#20
		address = 783;

		#20 
		address = 784;
		

	
		#100
		$finish;

        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
