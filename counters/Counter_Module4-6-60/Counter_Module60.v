`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 15:14:12
// Design Name: 
// Module Name: Counter_Module60
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


module Counter_Module60(
    input clk,
    input ld_n,
    output Q6, Q5, Q4, Q3, Q2, Q1, Q0
    );
    reg rco;
    Counter74160 u1(clk, 1, 1, 1, ld_n, 0, 0, 0, 0, Q3, Q2, Q1, Q0, rco);
    Counter_Module6 u2(clk, rco, rco, ~(Q6&Q5), ld_n, 0, 0, 0, Q6, Q5, Q4);
endmodule
