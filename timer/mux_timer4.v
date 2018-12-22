`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/22 18:07:54
// Design Name: 
// Module Name: mux_timer4
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


module mux_timer4(
    input mux,
    input [3:0]clk1,
    input [3:0]clk2,
    output reg [3:0] clkout
    );
    always @(mux)
        if(~mux)
            clkout <= clk1;
        else
            clkout <= clk2;
endmodule
