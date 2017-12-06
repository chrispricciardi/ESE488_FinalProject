
`timescale 1ns / 1ps

module top_tb();
	reg clk;
	reg we; //testing
	reg [17:0] address_1; //testing
	reg [11:0] address_2; //testing
	reg [9:0] address_3; //testing
	reg [5:0] address_4;
	reg [6:0] address_5; //BS sigmoid address
	reg reset;
	reg mac1_start;
	reg mac2_start;
	wire mac1_done; 
	wire mac2_done;

	integer i; 
	integer j; 

	
    top DUT(
        .clk(clk),
	.we(we), 
	.address_1(address_1),
	.address_2(address_2), //testing
	.address_3(address_3),
	.address_4(address_4),
	.address_5(address_5),
	.mac1_start(mac1_start),
	.mac2_start(mac2_start), 
	.mac1_done(mac1_done), 
	.mac2_done(mac2_done),
        .reset(reset)
        );

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top_tb);

//---Read input data input SRAM---
	$readmemb("test_image1_fix.txt", DUT.SRAM_INPUT1.mem);
	$readmemb("test_image2_fix.txt", DUT.SRAM_INPUT2.mem);
	$readmemb("test_image3_fix.txt", DUT.SRAM_INPUT3.mem);
	$readmemb("test_image4_fix.txt", DUT.SRAM_INPUT4.mem);
	$readmemb("test_image5_fix.txt", DUT.SRAM_INPUT5.mem);
	$readmemb("test_image6_fix.txt", DUT.SRAM_INPUT6.mem);
	$readmemb("test_image7_fix.txt", DUT.SRAM_INPUT7.mem);
	$readmemb("test_image8_fix.txt", DUT.SRAM_INPUT8.mem);
	$readmemb("test_image9_fix.txt", DUT.SRAM_INPUT9.mem);
	$readmemb("test_image10_fix.txt", DUT.SRAM_INPUT10.mem);
//---Read weights into weight SRAMS---
	$readmemb("layer1_weight.txt", DUT.SRAM_WEIGHT1.mem);
	$readmemb("layer2_weight.txt", DUT.SRAM_WEIGHT2.mem);
//---Read Sigmoid values into 1st sigmoids---
	$readmemb("x_fix.txt", DUT.SIGMOID1_1.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_1.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_2.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_2.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_3.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_3.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_4.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_4.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_5.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_5.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_6.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_6.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_7.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_7.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_8.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_8.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_9.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_9.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID1_10.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_10.LUT);
//---Reading Sigmoid values into 2nd Sigmoids
	$readmemb("x_fix.txt", DUT.SIGMOID2_1.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_1.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_2.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_2.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_3.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_3.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_4.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_4.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_5.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_5.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_6.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_6.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_7.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_7.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_8.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_8.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_9.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_9.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2_10.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_10.LUT);

		clk = 0;
		reset = 1;
		we = 0; //testing
		address_3 = 0; 
		mac1_start = 0; 
		mac2_start = 0; 
		address_2 = 0; 
		address_4 = 0; 
		address_5 = 0; 

		#20		
		reset = 0; 

		for(i = 0; i< 200; i=i+1)begin 
			for (j = 0; j < 784; j=j+1)begin 
				#20
				address_3 = j; 
				address_1 = i*784+j;
				if (j == 783) begin 
					mac1_start = 1;  
				end
				else begin 
					mac1_start = 0; 
				end
				if(mac1_done == 1) begin 
					address_2=address_2+1;
				end 			
			end
		end	

		
		#300
		$finish;

        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
