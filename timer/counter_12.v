`timescale 1ns / 1ps
module counter_12(clk,in,rst_n,out_in,out_q1,out_q2);
input clk;
input in;
input rst_n;
output reg out_in;
output reg [3:0] out_q1;
output reg [3:0] out_q2;
always@(posedge clk or negedge rst_n) 
    if(~rst_n)
        {out_q1,out_q2} <= 0;
    else if(in)
        begin
            if(10*out_q1 + out_q2 == 59)
                {out_q1,out_q2} <= 0;
            else
                begin
                if (out_q2 == 9)
                    begin
                        out_q1 <= out_q1 + 1;
                        out_q2 <= 0;
                    end
                else 
                    out_q2 <= out_q2 + 1;                
                end
        end
        
always@(posedge clk or negedge rst_n) 
            if(~rst_n)
                out_in <= 1'b0;
            else if(in && 10*out_q1 + out_q2 == 58)
                out_in <= 1'b1;
            else
                out_in <= 1'b0;
endmodule
