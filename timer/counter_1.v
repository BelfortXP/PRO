`timescale 1ns / 1ps
module counter_1(clk,in,rst_n,out_in,cnt);
input clk;
input in;
input rst_n;
output reg out_in;
output reg [3:0] cnt;

always@(posedge clk or negedge rst_n) 
    if(~rst_n)
        cnt <= 0;
    else if(in)
        begin
            if(cnt == 4'd9)
                cnt <= 4'd0;
            else
                cnt <= cnt + 1'b1;
        end

always@(posedge clk or negedge rst_n) 
    if(~rst_n)
        out_in <= 1'b0;
    else if(in && cnt == 4'd9)
        out_in <= 1'b1;
    else
        out_in <= 1'b0;
endmodule
