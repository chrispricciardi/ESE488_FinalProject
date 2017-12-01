
`timescale 1ns / 1ps

module top_tb();
	reg clk;
	reg we; //testing

	reg [17:0] address_1; //testing
	reg [11:0] address_2; //testing
	//reg[9:0] address_3; //testing
	reg reset;

	
    top DUT(
        .clk(clk),
	.we_1(we), 
	.we_2(we),
	.we_3(we),//testing
	.address_2(address_2), //testing
	.address_1(address_1),		
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


		clk = 0;
		reset = 1;
		we = 0; //testing
 
		#20
		reset = 0;

		#20
		address_1 = 0;
		address_2 = 0; 

		#20
		address_1 = 100; 
		address_2 = 100; 


		#100
		$finish;

        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
