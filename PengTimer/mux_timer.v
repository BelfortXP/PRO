`timescale 1ns / 1ps
//Timer选择器 mux为0选择clk1，为1选择clk2
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
