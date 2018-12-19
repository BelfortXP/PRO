`timescale 1ns / 1ps
module Timer(clk,in,rst_n,sec,min,hour,seg_en,seg_out);
input clk;
input in;
input rst_n;
input sec;
input min;
input hour;
output [7:0] seg_en;
output [7:0] seg_out;

wire [3:0] out_s1;
wire [3:0] out_s2;
wire [3:0] out_m2;
wire [3:0] out_m1;
wire [3:0] out_h1;
wire [3:0] out_h2;

wire tmp1,tmp2,tmp3,tmp4;

wire clkout,clkout2,rst_sec,in_min,in_hour,clk_min,clk_hour;
clock_div c1(clk,rst_n,clkout);
clock_div_4Hz c2(clk,rst_n,clkout2);
wire rst2 = 1'b0;
wire in2 = 1'b1;
wire in3 = 1'b0;
mux_timer m1(sec,rst_n,rst2,rst_sec);
mux_timerXY m2(min,hour,tmp1,tmp4,in2,in3,clkout,clkout2,in_min,in_hour,clk_min,clk_hour);

counter_12 s(clkout, in, rst_sec, tmp1, out_s1, out_s2);
counter_12 m(clk_min, in_min, rst_n, tmp4, out_m1, out_m2);
counter_3 h0(clk_hour, in_hour, rst_n, out_h1, out_h2);

scan_seg seg1(rst_n,clk,out_s2,out_s1,out_m2,out_m1,out_h2,out_h1,seg_en,seg_out);

endmodule
