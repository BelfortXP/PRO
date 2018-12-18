`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 15:23:54
// Design Name: 
// Module Name: Counter_Module4
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


module Counter_Module4(
    input clk,
    output Q2, Q1, Q0
    );
    Counter_Module6 u(clk, 1, 1, ~Q2, 1, 0, 0, 0, Q2, Q1, Q0);
endmodule
