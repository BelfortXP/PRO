`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/19 16:49:37
// Design Name: 
// Module Name: mux_timerXY
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_timerXY(
    input min,
    input hour,
    input tmp1,
    input tmp4,
    input in2,
    input in3,
    input clk1,
    input clk2,
    output reg in_min,
    output reg in_hour,
    output reg clkout_min,
    output reg clkout_hour
    );
    always @(min or hour)
        if(min)
        begin
            clkout_min <= clk2;
            clkout_hour <= clk1;
            in_min <= in2;
            in_hour <= in3;
        end
        else if(hour)
        begin
             clkout_min <= clk1;
             clkout_hour <= clk2;
             in_min <= tmp1;
             in_hour <= in2;
         end
        else if(~min & ~hour)
        begin
            clkout_min <= clk1;
            clkout_hour <= clk1;
            in_min <= tmp1;
            in_hour <= tmp4;
        end
               
endmodule
