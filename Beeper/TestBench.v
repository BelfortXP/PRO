`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/21 22:12:06
// Design Name: 
// Module Name: TestBench
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


module TestBench(
    input clock,
    input rst,
    input open512,
    output beep
    );
    wire clk_512;
    clock_div_512Hz u(clock,rst,clk_512);
    Beeper v(clk_512,0,open512,0,beep);
endmodule
