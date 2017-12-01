`timescale 1ns / 1ps

module sigmoid_tb();

    reg  clk;
    reg  reset;
    reg  done;
    reg  [15:0] sig_in;
    reg [15:0] x [120:0];	//Create the memory for the input ranges to the sigmoid
    reg [15:0] LUT [120:0];	//Create the memory for the outputs to the sigmoid
    reg [15:0] y;		//Store the output of the LUT

    wire [15:0] sig_out;
    wire sig_ready;

    integer j;

  

    sigmoid DUT(
        .clk(clk),
        .reset(reset),
	.done(done),
	.sig_ready(sig_ready),
	.sig_in(sig_in),
	.sig_out(sig_out)
        );

    initial
    begin
        $dumpfile("sigmoid.vcd");
        $dumpvars(0, sigmoid_tb);

        reset = 1;
        clk = 0;
	done=1;
	
	$readmemb("x_fix.txt", x);
	$readmemb("y_fix.txt", LUT);

        // 1
        #16
        reset = 0;

	//For troubleshooting
	//Print the contents of the x and LUT rams to the terminal
	for(j=0; j<121; j=j+1) begin
		$display("index: %d		x: %h		LUT: %h", j, x[j], LUT[j]);
		
	end	
	
	#20 
	//0.512
	sig_in=16'h0083;

	#20
	//3.43
	sig_in=16'h036E;

	#20
	//6.5
	sig_in=16'h0680;
	
	#20
	//-6.xxxxxx
	sig_in=16'hfd00;

	#20
	//-128
	sig_in=16'h8000;
	

        #100
	//Let it run
	
        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
