`timescale 1ns / 1ps
module Timer(clk,in,rst_n,seg_en,seg_out);
input clk;
input in;
input rst_n;
output [7:0] seg_en;
output [7:0] seg_out;

wire [3:0] out_s1;
wire [3:0] out_s2;
wire [3:0] out_m2;
wire [3:0] out_m1;
wire [3:0] out_h1;
wire [3:0] out_h2;

wire tmp1,tmp2,tmp3,tmp4;

wire clkout;
clock_div c1(clk,rst_n,clkout);

counter_1 s2(clkout, in, rst_n, tmp1, out_s2);
counter_2 s1(clkout, tmp1, rst_n, tmp2, out_s1);
counter_1 m2(clkout, tmp2, rst_n, tmp3, out_m2);
counter_1 m1(clkout, tmp3, rst_n, tmp4, out_m1);
counter_3 h0(clkout, tmp4, rst_n, out_h1, out_h2);

scan_seg seg1(rst_n,clk,out_s2,out_s1,out_m2,out_m1,out_h2,out_h1,seg_en,seg_out);

endmodule
