`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/19 15:11:23
// Design Name: 
// Module Name: mux_timer
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


module mux_timer(
    input mux,
    input clk1,
    input clk2,
    output reg clkout
    );
    always @(mux)
        if(~mux)
            clkout <= clk1;
        else
            clkout <= clk2;
endmodule
