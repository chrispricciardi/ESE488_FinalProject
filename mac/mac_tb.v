`timescale 1ns / 1ps

module mac_tb();

    reg  clk;
    reg  reset;
    reg start;
    //reg  done;
    reg [15:0] mac_in;
    reg [15:0] weight;
    wire [15:0] mac_out;

  

    mac DUT(
        .clk(clk),
        .reset(reset),
	.start(start),
	.done(done),
	.mac_in(mac_in),
	.weight(weight),
	.mac_out(mac_out)
        );

    initial
    begin
        $dumpfile("mac.vcd");
        $dumpvars(0, mac_tb);

        reset = 1;
        clk = 0;
	start=0;
	
	mac_in= 16'h0100;
	weight= 16'h0100;

        // 1
        #16
        reset = 0;
	start=1;
	
	#20
	start=0;
	mac_in= 16'hffff;
	weight= 16'h0200;

	#200
	mac_in= 16'h0100;
	weight= 16'h0100;


	#20
	start=1;
	mac_in= 16'h0100;
	weight= 16'h0100;


	#20
	start=0;
	mac_in= 16'h0100;
	weight= 16'h0100;

	#20
	mac_in= 16'h0100;
	weight= 16'h0100;

        #300
	//Let it run
	
        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
