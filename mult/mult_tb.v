`timescale 1ns / 1ps

module mult_tb();

    reg  clk;
    reg  reset;
    reg [15:0] in;
    reg [15:0] w;
    wire [15:0] out;

  

    mult DUT(
        .clk(clk),
        .reset(reset),
	.in(in),
	.w(w),
	.out(out)
        );

    initial
    begin
        $dumpfile("mult.vcd");
        $dumpvars(0, mult_tb);

        reset = 1;
        clk = 0;
	
	in= 16'h1100;
	w = 16'h1100;

        // 1
        #16
        reset = 0;

	#20
	in= 16'h0100;
	w = 16'h0100;

	#20
	in= 16'h1100;
	w = 16'h0100;	

	#20
	in= 16'h0100;
	w = 16'h01ff;

        #300
	//Let it run
	
        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
