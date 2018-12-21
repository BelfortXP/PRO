`timescale 1ns / 1ps
/**
* function description:
* artix-7 fgg484 chip are 100M system clock embeded
* so here we want to achieve the clock of 512Hz, as 1e8(100M)/512 = 195312
* using a cnts signal, when cnt == cnt, then we reverse the clk signal
* since we want to finish a circle when 1s pass, so clk must reverse when cnt == cnts/2
*/

module clock_div_512Hz(   // 512.0013Hz
    input clk,
    input rst_n,
    output reg clk_out
    );
    reg [25:0]cnt;
    parameter cnts = 195312;
    always@(posedge clk,negedge rst_n)
    begin
        if(~rst_n)
        begin
            cnt <= 0;
            clk_out <= 0;
        end
        else if(cnt == (cnts>>1)-1)
        begin
            cnt <= 0;
            clk_out <= ~clk_out;
        end
        else
            cnt <= cnt + 1;
    end
endmodule
