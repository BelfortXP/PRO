`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 14:55:26
// Design Name: 
// Module Name: Counter74160
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


module Counter74160(
    input clk,
    input ET, EP,
    input CR_n,
    input LD_n,
    input D3, D2, D1, D0,
    output reg Q3, Q2, Q1, Q0,
    output rco
    );
    assign rco = ET&Q3&Q0;
    always@(posedge clk, negedge CR_n)
    begin
        if(~CR_n)
            {Q3, Q2, Q1, Q0} <= 4'b0000;
        else if(~LD_n)
            {Q3, Q2, Q1, Q0} <= {D3, D2, D1, D0};
        else if(ET & EP == 1'b1)
        begin
            if({Q3, Q2, Q1, Q0} != 4'b1001)
                {Q3, Q2, Q1, Q0} <= {Q3, Q2, Q1, Q0} + 1;
            else {Q3, Q2, Q1, Q0} <= 4'b0000;    
        end        
    end
endmodule
