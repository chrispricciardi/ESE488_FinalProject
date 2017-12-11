
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
	reg [6:0] sel; //select signal to MUX
	reg mac1_start;
	reg mac2_start;
	wire mac1_done; 
	wire mac2_done;

	integer i,j,a,b,count,count_1, count_2; 
	

	
    top DUT(
        .clk(clk),
	.we(we), 
	.address_1(address_1),
	.address_2(address_2), //testing
	.address_3(address_3),
	//.address_4(address_4),
	.address_5(address_5),
	.mac1_start(mac1_start),
	.mac2_start(mac2_start), 
	.mac1_done(mac1_done), 
	.mac2_done(mac2_done),
	.sel(sel),
        .reset(reset)
        );

    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, top_tb);

//---Read input data input SRAM---
	$readmemb("test_image10_fix.txt", DUT.SRAM_INPUT0.mem);
	$readmemb("test_image1_fix.txt", DUT.SRAM_INPUT1.mem);
	$readmemb("test_image2_fix.txt", DUT.SRAM_INPUT2.mem);
	$readmemb("test_image3_fix.txt", DUT.SRAM_INPUT3.mem);
	$readmemb("test_image4_fix.txt", DUT.SRAM_INPUT4.mem);
	$readmemb("test_image5_fix.txt", DUT.SRAM_INPUT5.mem);
	$readmemb("test_image6_fix.txt", DUT.SRAM_INPUT6.mem);
	$readmemb("test_image7_fix.txt", DUT.SRAM_INPUT7.mem);
	$readmemb("test_image8_fix.txt", DUT.SRAM_INPUT8.mem);
	$readmemb("test_image9_fix.txt", DUT.SRAM_INPUT9.mem);

//---Read weights into weight SRAMS---
	$readmemb("layer1_weight.txt", DUT.SRAM_WEIGHT1.mem);
	$readmemb("layer2_weight.txt", DUT.SRAM_WEIGHT2.mem);
//---Read Sigmoid values into 1st sigmoids---
	$readmemb("x_fix.txt", DUT.SIGMOID1_0.x);
	$readmemb("y_fix.txt", DUT.SIGMOID1_0.LUT);
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

//---Reading Sigmoid values into 2nd Sigmoids
/*
	$readmemb("x_fix.txt", DUT.SIGMOID2_1.x);
	$readmemb("y_fix.txt", DUT.SIGMOID2_1.LUT);
*/
		clk = 0;
		reset = 1;
		we = 0; //testing
	    	address_2 = 0; 
		address_3 = 0;
		//address_4 = 0; 
		address_5 = 0; 
		mac1_start = 0; 
		mac2_start = 0; 
		sel = 4'b1010; 

		#20		
		reset = 0; 

	    //---Cycle through input data and weights
	    always@(posedge clk) begin 
		    count_1 = count_1 + 1; 
		    if(count_1 < 784*200)begin 
		   	 address_1 <= count_1; //weight file is incremented from top to bottom
		    
		    for(i=0;i<200;i=i+1)begin 
			    if(count_1 == i*784)begin //at the start of a new weight column, restart the input counter
				    count_2 <= 0; 
				    address_3 <= count_2;
			    end else begin //increment the input counter
				    count_2 <= count_2 + 1;
				    address_3 <= count_2;
			    end
		    end 
		    end 
	   end		    
	
	/*	    
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
			end
		end	
	*/
	    //--when the sigmoid completes a data set, send select signal and addresses for second layer weights---
	    //--this might have to be moved to a separate DMA file to avoid conflicting timing with the for loops above
	    always @ (sig_ready) begin 
		    if(sig_ready==1)begin
			    for(a=0;a<10;a=a+1)begin
				    sel <= i; //index through multiplexer inputs (0-9)
				    for(b=0;b<10;b=b+1)begin 
					    #20
					    address_2 <= b + count*10; //index through weight_2 SRAM. after 10 iterations, count increments to select the next weight column
					    address_6 <= sel*10+address_2; 
				    end 
				    count = count + 1;
			     end
		#300
		$finish;

        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
