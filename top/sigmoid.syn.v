
module sigmoid ( clk, reset, done, sig_ready, sig_in, sig_out );
  input [15:0] sig_in;
  output [15:0] sig_out;
  input clk, reset, done;
  output sig_ready;
  wire   N133, n19, n28, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50;
  assign sig_out[0] = 1'b0;
  assign sig_out[15] = 1'b0;
  assign N133 = sig_in[15];
  assign sig_out[1] = 1'b0;
  assign sig_out[2] = 1'b0;
  assign sig_out[3] = 1'b0;
  assign sig_out[4] = 1'b0;
  assign sig_out[5] = 1'b0;
  assign sig_out[6] = 1'b0;
  assign sig_out[7] = 1'b0;
  assign sig_out[9] = 1'b0;
  assign sig_out[10] = 1'b0;
  assign sig_out[11] = 1'b0;
  assign sig_out[12] = 1'b0;
  assign sig_out[13] = 1'b0;
  assign sig_out[14] = 1'b0;

  dp_1 \y_reg[8]  ( .ip(n28), .ck(clk), .q(sig_out[8]) );
  dp_1 sig_rdy_reg ( .ip(n19), .ck(clk), .q(sig_ready) );
  inv_1 U52 ( .ip(reset), .op(n40) );
  and2_1 U53 ( .ip1(n40), .ip2(done), .op(n19) );
  nor2_1 U54 ( .ip1(sig_in[9]), .ip2(sig_in[10]), .op(n37) );
  nand4_1 U55 ( .ip1(sig_in[11]), .ip2(sig_in[14]), .ip3(sig_in[12]), .ip4(
        sig_in[13]), .op(n36) );
  or2_1 U56 ( .ip1(n37), .ip2(n36), .op(n38) );
  nand3_1 U57 ( .ip1(done), .ip2(N133), .ip3(n38), .op(n39) );
  nand3_1 U58 ( .ip1(n40), .ip2(sig_out[8]), .ip3(n39), .op(n50) );
  inv_1 U59 ( .ip(N133), .op(n48) );
  nor4_1 U60 ( .ip1(sig_in[11]), .ip2(sig_in[14]), .ip3(sig_in[12]), .ip4(
        sig_in[13]), .op(n46) );
  nor3_1 U61 ( .ip1(sig_in[5]), .ip2(sig_in[3]), .ip3(sig_in[4]), .op(n43) );
  nor4_1 U62 ( .ip1(sig_in[1]), .ip2(sig_in[0]), .ip3(sig_in[7]), .ip4(
        sig_in[6]), .op(n42) );
  nor2_1 U63 ( .ip1(sig_in[8]), .ip2(sig_in[2]), .op(n41) );
  nand3_1 U64 ( .ip1(n43), .ip2(n42), .ip3(n41), .op(n44) );
  nand3_1 U65 ( .ip1(n44), .ip2(sig_in[10]), .ip3(sig_in[9]), .op(n45) );
  nand2_1 U66 ( .ip1(n46), .ip2(n45), .op(n47) );
  nand3_1 U67 ( .ip1(n19), .ip2(n48), .ip3(n47), .op(n49) );
  nand2_1 U68 ( .ip1(n50), .ip2(n49), .op(n28) );
endmodule

