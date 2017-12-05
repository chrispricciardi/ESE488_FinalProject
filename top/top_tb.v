
`timescale 1ns / 1ps

module top_tb();
	reg clk;
	reg we; //testing
	reg [17:0] address_1; //testing
	reg [11:0] address_2; //testing
	reg [9:0] address_3; //testing
	reg reset;
	reg mac_start;

	integer i; 
	integer j; 

	
    top DUT(
        .clk(clk),
	.we_1(we), 
	.we_2(we),
	.we_3(we),//testing
	.address_2(address_2), //testing
	.address_1(address_1),	
	.address_3(address_3),	
	.mac_start(mac_start), 
        .reset(reset)
        );

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top_tb);

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

	$readmemb("layer1_weight.txt", DUT.SRAM_WEIGHT1.mem);
	$readmemb("layer2_weight.txt", DUT.SRAM_WEIGHT2.mem);

	$readmemb("x_fix.txt", DUT.SIGMOID1.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID2.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID3.x);
	$readmemb("y_fix.txt", DUT.SIGMOID3.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID4.x);
	$readmemb("y_fix.txt", DUT.SIGMOID4.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID5.x);
	$readmemb("y_fix.txt", DUT.SIGMOID5.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID6.x);
	$readmemb("y_fix.txt", DUT.SIGMOID6.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID7.x);
	$readmemb("y_fix.txt", DUT.SIGMOID7.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID8.x);
	$readmemb("y_fix.txt", DUT.SIGMOID8.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID9.x);
	$readmemb("y_fix.txt", DUT.SIGMOID9.LUT);
	$readmemb("x_fix.txt", DUT.SIGMOID10.x);
	$readmemb("y_fix.txt", DUT.SIGMOID10.LUT);




		clk = 0;
		reset = 1;
		we = 0; //testing
		address_3 = 0; 
		mac_start = 0; 
		address_2 = 0; 

		#20		
		reset = 0; 


		for(i = 0; i< 200; i=i+1)begin 
			for (j = 0; j < 784; j=j+1)begin 
				#20
				address_3 = j; 
				address_1 = i*784+j;
				if (j == 783) begin 
					mac_start = 1;  
				end
				else begin 
					mac_start = 0; 
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
