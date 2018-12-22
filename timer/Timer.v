`timescale 1ns / 1ps
module Timer(clk,in,rst_n,sec,min,hour,clock_on,set_min,set_hour,clock1,clock2,clock_set1,clock_set2,seg_en,seg_out,bee_out);
input clk;
input in;
input rst_n;
input sec;
input min;
input hour;
input clock_on;
input set_min;
input set_hour;
input [3:0] clock1;
input [3:0] clock2;
output [3:0] clock_set1;
output [3:0] clock_set2;
output [7:0] seg_en;
output [7:0] seg_out;
output bee_out;

assign clock_set1 = clock1;
assign clock_set2 = clock2;

wire [3:0] out_s1;
wire [3:0] out_s2;
wire [3:0] out_m2;
wire [3:0] out_m1;
wire [3:0] out_h1;
wire [3:0] out_h2;

wire tmp1,tmp2,tmp3,tmp4;
wire [1:0] bee_in;
wire clkout_512, clkout_1000;

wire [3:0] clock_min1 = 4'b0000;
wire [3:0] clock_min2 = 4'b0000;
wire [3:0] clock_hour1 = 4'b0000;
wire [3:0] clock_hour2 = 4'b0000;
clock_set(set_min,set_hour,clock1,clock2,clock_min1,clock_min2,clock_hour1,clock_hour2);

wire clkout,clkout2,rst_sec,in_min,in_hour,clk_min,clk_hour;
clock_div c1(clk,rst_n,clkout);
clock_div_4Hz c2(clk,rst_n,clkout2);
clock_div_512Hz c3(clk,rst_n,clkout_512);
clock_div_1KHz c4(clk,rst_n,clkout_1000);
wire rst2 = 1'b0;
wire in2 = 1'b1;
wire in3 = 1'b0;
mux_timer m1(sec,rst_n,rst2,rst_sec);
//mux_timer m2(min,tmp1,in2,in_min);
//mux_timer m3(hour,tmp4,in2,in_hour);
//mux_timer m4(min,clkout,clkout2,clk_min);
//mux_timer m5(hour,clkout,clkout2,clk_hour);
mux_timerXY m2(min,hour,tmp1,tmp4,in2,in3,clkout,clkout2,out_s1,out_s2,out_m1,out_m2,out_h1,out_h2,clock_on,clock_min1,clock_min2,clock_hour1,clock_hour2,in_min,in_hour,clk_min,clk_hour,bee_in);

//counter_1 s2(clkout, in, rst_n, tmp1, out_s2);
//counter_2 s1(clkout, tmp1, rst_n, tmp2, out_s1);
//counter_1 m2(clkout, tmp2, rst_n, tmp3, out_m2);
//counter_2 m1(clkout, tmp3, rst_n, tmp4, out_m1);
counter_12 s(clkout, in, rst_sec, tmp1, out_s1, out_s2);
counter_12 m(clk_min, in_min, rst_n, tmp4, out_m1, out_m2);
counter_3 h0(clk_hour, in_hour, rst_n, out_h1, out_h2);

Beeper b1(clk,clkout_512,clkout_1000,bee_in[0],bee_in[1],bee_out);
scan_seg seg1(rst_n,clk,out_s2,out_s1,out_m2,out_m1,out_h2,out_h1,seg_en,seg_out);

endmodule
