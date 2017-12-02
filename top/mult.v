module mult(
	clk,
	reset,
	in,
	w,
	out
);

//Data is stored as an 8.8 fixed point number
input clk;
input reset;
input [15:0] in;
input [15:0] w;
output [15:0] out;

//Define constants
parameter vecLen=16;

//Define variables
integer i;

reg [31:0] layer1 [15:0];
reg [31:0] layer2 [7:0];
reg [31:0] layer3 [3:0];
reg [31:0] layer4 [1:0];
reg [31:0] layer5;
/***********************************************************************
Because there are 5 layers, this design takes 5 clock cylces to complete
***********************************************************************/


//Tie the output pin to the last register's (layer5) output 
assign out = layer5[23:8];

//Define the pipelined multiplier data path
always @(posedge clk) 
begin
	//If reset is held high, clear the pipelined registers
	if (reset==1) begin
		for (i=0; i<vecLen; i=i+1)begin	
			layer1[i]<=0;
		end	
		for (i=0; i<vecLen/2; i=i+1)begin	
			layer2[i]<=0;
		end
		for (i=0; i<vecLen/4; i=i+1)begin	
			layer3[i]<=0;
		end			
		for (i=0; i<vecLen/8; i=i+1)begin	
			layer4[i]<=0;
		end	
		layer5 <= 0;
		
	end
	//If reset is low, perform normal multiplier operations
	else begin
	/*******************************SIGNED***************************/
		//***************Layer1****************************
		//AND each bit of the weight function with the input	
		layer1[0][16:0]<= {1'b1, ~(w[0] & in[15]), {15{w[0]}} & in[14:0]};
		layer1[1][16:1]<= {~(w[1] & in[15]), {15{w[1]}} & in[14:0]};
		layer1[2][17:2]<= {~(w[2] & in[15]), {15{w[2]}} & in[14:0]};
		layer1[3][18:3]<= {~(w[3] & in[15]), {15{w[3]}} & in[14:0]};
		layer1[4][19:4]<= {~(w[4] & in[15]), {15{w[4]}} & in[14:0]};
		layer1[5][20:5]<= {~(w[5] & in[15]), {15{w[5]}} & in[14:0]};
		layer1[6][21:6]<= {~(w[6] & in[15]), {15{w[6]}} & in[14:0]};
		layer1[7][22:7]<= {~(w[7] & in[15]), {15{w[7]}} & in[14:0]};
		layer1[8][23:8]<= {~(w[8] & in[15]), {15{w[8]}} & in[14:0]};
		layer1[9][24:9]<= {~(w[9] & in[15]), {15{w[9]}} & in[14:0]};
		layer1[10][25:10]<= {~(w[10] & in[15]), {15{w[10]}} & in[14:0]};
		layer1[11][26:11]<= {~(w[11] & in[15]), {15{w[11]}} & in[14:0]};
		layer1[12][27:12]<= {~(w[12] & in[15]), {15{w[12]}} & in[14:0]};
		layer1[13][28:13]<= {~(w[13] & in[15]), {15{w[13]}} & in[14:0]};
		layer1[14][29:14]<= {~(w[14] & in[15]), {15{w[14]}} & in[14:0]};
		layer1[15][31:15]<= {1'b1, (w[15] & in[15]), ~({15{w[15]}} & in[14:0])};

	
		//***************Layer2****************************
		//Start adding the results of the and

		layer2[0] <= layer1[0] + layer1[1];
		layer2[1] <= layer1[2] + layer1[3];
		layer2[2] <= layer1[4] + layer1[5];
		layer2[3] <= layer1[6] + layer1[7];
		layer2[4] <= layer1[8] + layer1[9];
		layer2[5] <= layer1[10] + layer1[11];
		layer2[6] <= layer1[12] + layer1[13];
		layer2[7] <= layer1[14] + layer1[15];
		
		
		//***************Layer3****************************
		//Continue adding outputs
		layer3[0] <= layer2[0] + layer2[1];
		layer3[1] <= layer2[2] + layer2[3];
		layer3[2] <= layer2[4] + layer2[5];
		layer3[3] <= layer2[6] + layer2[7];
		
		//***************Layer4****************************
		//Continue adding outputs
		layer4[0] <= layer3[0] + layer3[1];
		layer4[1] <= layer3[2] + layer3[3];
		
		//***************Layer5****************************
		//Calculate the final result of the multiplier
		layer5 <= layer4[0] + layer4[1];
	/****************************END SIGNED**************************/





	/******************************UNSIGNED***************************
		//***************Layer1****************************
		//AND each bit of the weight function with the input	
		layer1[0][15:0]<= {16{w[0]}} & in;
		layer1[1][16:1]<= {16{w[1]}} & in;
		layer1[2][17:2]<= {16{w[2]}} & in;
		layer1[3][18:3]<= {16{w[3]}} & in;
		layer1[4][19:4]<= {16{w[4]}} & in;
		layer1[5][20:5]<= {16{w[5]}} & in;
		layer1[6][21:6]<= {16{w[6]}} & in;
		layer1[7][22:7]<= {16{w[7]}} & in;
		layer1[8][23:8]<= {16{w[8]}} & in;
		layer1[9][24:9]<= {16{w[9]}} & in;
		layer1[10][25:10]<= {16{w[10]}} & in;
		layer1[11][26:11]<= {16{w[11]}} & in;
		layer1[12][27:12]<= {16{w[12]}} & in;
		layer1[13][28:13]<= {16{w[13]}} & in;
		layer1[14][29:14]<= {16{w[14]}} & in;
		layer1[15][30:15]<= {16{w[15]}} & in;


		//***************Layer2****************************
		//Start adding the results of the and

		layer2[0] <= layer1[0] + layer1[1];
		layer2[1] <= layer1[2] + layer1[3];
		layer2[2] <= layer1[4] + layer1[5];
		layer2[3] <= layer1[6] + layer1[7];
		layer2[4] <= layer1[8] + layer1[9];
		layer2[5] <= layer1[10] + layer1[11];
		layer2[6] <= layer1[12] + layer1[13];
		layer2[7] <= layer1[14] + layer1[15];
		
		
		//***************Layer3****************************
		//Continue adding outputs
		layer3[0] <= layer2[0] + layer2[1];
		layer3[1] <= layer2[2] + layer2[3];
		layer3[2] <= layer2[4] + layer2[5];
		layer3[3] <= layer2[6] + layer2[7];
		
		//***************Layer4****************************
		//Continue adding outputs
		layer4[0] <= layer3[0] + layer3[1];
		layer4[1] <= layer3[2] + layer3[3];
		
		//***************Layer5****************************
		//Calculate the final result of the multiplier
		layer5 <= layer4[0] + layer4[1];
	**************************End Unsigned*****************************/
	end

end


endmodule
