`timescale 1ns / 1ps
//Timerѡ���� muxΪ0ѡ��clk1��Ϊ1ѡ��clk2
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
