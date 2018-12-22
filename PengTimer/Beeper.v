`timescale 1ns / 1ps

module Beeper(
    input clk,
    input clk_512,
    input clk_1k,
    input open512,
    input open1k,
    output reg beep
    );
    reg [3:0] count = 4'b0000;
    
    always@(posedge clk)
        if(open512&&clk_512)
            count <= count + 1;
        else if(open1k&&clk_1k)
            count <= count + 1;    
    
    always@(posedge clk)
    begin
        if(open512&&clk_512&&count<=1)
            beep <= 1;
        else if(open1k&&clk_1k&&count<=1000)
            beep <= 1;
        else beep <= 0;        
    end
endmodule