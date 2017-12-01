
module sigmoid ( clk, reset, done, sig_ready, sig_in, sig_out );
  input [15:0] sig_in;
  output [15:0] sig_out;
  input clk, reset, done;
  output sig_ready;
  wire   n7, n16, n24, n25, n26, n27, n28;
  assign sig_out[0] = 1'b0;
  assign sig_out[15] = 1'b0;
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

  dp_1 \y_reg[8]  ( .ip(n16), .ck(clk), .q(sig_out[8]) );
  dp_1 sig_rdy_reg ( .ip(n7), .ck(clk), .q(sig_ready) );
  and4_1 U41 ( .ip1(sig_in[12]), .ip2(sig_in[11]), .ip3(sig_in[14]), .ip4(
        sig_in[13]), .op(n25) );
  or2_1 U42 ( .ip1(sig_in[9]), .ip2(sig_in[10]), .op(n24) );
  nand3_1 U43 ( .ip1(n25), .ip2(sig_in[15]), .ip3(n24), .op(n27) );
  nor2_1 U44 ( .ip1(sig_out[8]), .ip2(done), .op(n26) );
  not_ab_or_c_or_d U45 ( .ip1(done), .ip2(n27), .ip3(reset), .ip4(n26), .op(
        n16) );
  nor2_1 U46 ( .ip1(done), .ip2(sig_ready), .op(n28) );
  nor2_1 U47 ( .ip1(reset), .ip2(n28), .op(n7) );
endmodule

