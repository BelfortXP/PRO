`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 19:10:05
// Design Name: 
// Module Name: clock_div
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


module clock_div(   // 1Hz
    input clk,
    input rst_n,
    output reg clk_out
    );
    reg [25:0]cnt;
    parameter cnts = 100_000_000;
    always@(posedge clk,negedge rst_n)
    begin
        if(~rst_n)
        begin
            cnt <= 0;
            clk_out <= 0;
        end
        else if(cnt == (cnts>>1)-1)
        begin
            cnt <= 0;
            clk_out <= ~clk_out;
        end
        else
            cnt <= cnt + 1;
    end
endmodule
