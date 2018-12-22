`timescale 1ns / 1ps

/**
* this module is used to select the clk frequency
* @parameter min & hour
* the input "min" and "hour" determines whether the minute or hour signal run faster than usual
* if "min" and "hour" are turned on simutaneously, the priority would be min > hour
*
* @parameter clk1 & clk2
* clk1 is the clock frequency that runs at the normal level while clk2 at the fast level
*
* @parameter s1,s2,m1,m2
* the screen of clock would be in this way: {HHmmss} <= {h1,h2,m1,m2,s1,s2}
* 
* @parameter tmp1,tmp4
* @output in_min,in_hour,clkout_min,clkout_hour
*/
module mux_timerXY(
    input min,
    input hour,
    input tmp1,
    input tmp4,
    input in2,
    input in3,
    input clk1,
    input clk2,
    input clk3,
    input [3:0]s1,
    input [3:0]s2,
    input [3:0]m1,
    input [3:0]m2,
    input [3:0]h1,
    input [3:0]h2,
    input clock_on,
    input [3:0] clock_min1,
    input [3:0] clock_min2,
    input [3:0] clock_hour1,
    input [3:0] clock_hour2,
    output reg in_min,
    output reg in_hour,
    output reg clkout_min,
    output reg clkout_hour,
    output reg [1:0] bee_in
    );
    always @(clk3 or min or hour or s2)
        if(min)
        begin
            clkout_min <= clk2;
            clkout_hour <= clk1;
            in_min <= in2;
            in_hour <= in3;
        end
        else if(hour)
        begin
             clkout_min <= clk1;
             clkout_hour <= clk2;
             in_min <= tmp1;
             in_hour <= in2;
         end
        else if(~min & ~hour)
        begin
        if(10*m1 + m2 == 59 && 10*s1 + s2 == 59)
        begin  
            clkout_min <= clk1;
            clkout_hour <= clk1;
            in_min <= tmp1;
            in_hour <= in2;
        end
        else begin
            clkout_min <= clk1;
            clkout_hour <= clk1;
            in_min <= tmp1;
            in_hour <= in3;
        end
        
        if((10*m1 + m2 == 59 && 10*s1 + s2 == 50) || (10*m1 + m2 == 59 && 10*s1 + s2 == 52) || (10*m1 + m2 == 59 && 10*s1 + s2 == 54) || (10*m1 + m2 == 59 && 10*s1 + s2 == 58))
            bee_in <= 2'b01;
        else if(10*m1 + m2 == 00 && 10*s1 + s2 == 00)
            bee_in <= 2'b10;
        else if(clock_on) 
        begin
            if((m1 == clock_min1) && (m2 == clock_min2) && (h1 == clock_hour1) && (h2 == clock_hour2))
//            if(m2 == clock_min2)
//              if(1'b0)
                bee_in <= 2'b10;
        end
        else
            bee_in <= 2'b00;
        end
               
endmodule
