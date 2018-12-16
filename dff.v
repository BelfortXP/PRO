`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 16:50:43
// Design Name: 
// Module Name: dff
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


module dff(//D_Flip_Flop
    input clk,
    input rst_n,
    input D,
    output reg Q,
    output Qn
    );
    assign Qn = ~Q;
    always @(posedge clk, negedge rst_n)
    begin
        if(~rst_n)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule
