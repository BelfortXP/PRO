`timescale 1ns / 1ps
module counter_2(clk, in, rst_n, out_clk, cnt);
input clk;
input in;
input rst_n;
output reg out_clk;
output reg [3:0] cnt;

//实现累加
always@(posedge clk or negedge rst_n) 
    if(~rst_n)
        cnt <= 0;
    else if(in) 
        begin
            if(cnt == 4'd6)
                cnt <= 4'd0;
            else
                cnt <= cnt + 1'b1;
        end

//实现进位out_clk
always@(posedge clk or negedge rst_n) 
    if(rst_n == 1'b0)
        out_clk <= 1'b0;
    else if(in == 1'b1 && cnt == 4'd6)
        out_clk <= 1'b1;
    else
        out_clk <= 1'b0;
endmodule
