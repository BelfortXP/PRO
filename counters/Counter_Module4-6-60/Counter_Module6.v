`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 15:05:24
// Design Name: 
// Module Name: Counter_Module6
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


module Counter_Module6(
    input clk,
    input ET, EP,
    input CR_n,
    input LD_n,
    input D2, D1, D0,
    output reg Q2, Q1, Q0,
    output rco
    );
    assign rco = ET&Q2&Q0;
    always@(posedge clk, negedge CR_n)
    begin
        if(~CR_n)
            {Q2, Q1, Q0} <= 3'b000;
        else if(~LD_n)
            {Q2, Q1, Q0} <= {D2, D1, D0};
        else if(ET & EP == 1'b1)
        begin
            if({Q2, Q1, Q0} != 3'b101)
                {Q2, Q1, Q0} <= {Q2, Q1, Q0} + 1;
            else {Q2, Q1, Q0} <= 3'b000;    
        end        
    end
endmodule
