`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/22 13:38:07
// Design Name: 
// Module Name: clock_set
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


module clock_set(
    input set_min,
    input set_hour,
    input [3:0] clock1,
    input [3:0] clock2,
    output reg [3:0] clock_min1,
    output reg [3:0] clock_min2,
    output reg [3:0] clock_hour1,
    output reg [3:0] clock_hour2
    );
    always @(set_min or set_hour)
        if(set_hour)
        begin
            clock_hour1 <= clock1;
            clock_hour2 <= clock2;
        end    
        else if(set_min)
        begin
            clock_min1 <= clock1;
            clock_min2 <= clock2;
        end
endmodule
