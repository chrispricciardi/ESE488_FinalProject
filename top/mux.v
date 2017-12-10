module mux(
	mux_in_0, 
	mux_in_1 , // First input
	mux_in_2,
	mux_in_3,
	mux_in_4,
	mux_in_5,
	mux_in_6,
	mux_in_7, // Second input
	mux_in_8, 
	mux_in_9, 
	mux_out,
	sel//select signal
);

//---Input Ports ---
input [6:0] sel; 
input [15:0] mux_in_0; 
input [15:0] mux_in_1; 
input [15:0] mux_in_2; 
input [15:0] mux_in_3; 
input [15:0] mux_in_4; 
input [15:0] mux_in_5; 
input [15:0] mux_in_6; 
input [15:0] mux_in_7; 
input [15:0] mux_in_8; 
input [15:0] mux_in_9; 


//---Output Port---
output reg [15:0] mux_out; 

//---Internal Variable---

//---Code Start----
always @ (sel) 
case(sel)
	6'b000000 : mux_out <= mux_in_0;
	6'b000001 : mux_out <= mux_in_1;	
	6'b000010 : mux_out <= mux_in_2;
	6'b000011 : mux_out <= mux_in_3;
	6'b000100 : mux_out <= mux_in_4;
	6'b000101 : mux_out <= mux_in_5;
	6'b000110 : mux_out <= mux_in_6;
	6'b000111 : mux_out <= mux_in_7;
	6'b001000 : mux_out <= mux_in_8;
	6'b001001 : mux_out <= mux_in_9;
	6'b001010 : mux_out <= 16'b0; 

	default : mux_out = 16'b0;
endcase
endmodule
