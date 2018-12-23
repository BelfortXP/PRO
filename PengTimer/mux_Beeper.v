`timescale 1ns / 1ps

module mux_Beeper(
    input [3:0] sec1,sec2,min1,min2,hour1,hour2,
    input [3:0] asec1,asec2,amin1,amin2,ahour1,ahour2,
    input alarm_on,
    output reg beep512Hz,
    output reg beep1kHz
    );
    always@(sec1 or min1)
    begin
    
        if(10*min1+min2==59)
        begin
            if(10*sec1+sec2==50||10*sec1+sec2==52||10*sec1+sec2==54||10*sec1+sec2==58)
            begin
                beep512Hz <= 1;
                beep1kHz  <= 0;
            end
            else
            begin
                beep512Hz <= 0;
                beep1kHz  <= 0;
            end
        end
        
        else if(10*min1+min2==0)
        begin
            if(10*sec1+sec2==0)
            begin
                beep512Hz <= 0;
                beep1kHz  <= 1;
            end
            else 
            begin
                beep512Hz <= 0;
                beep1kHz  <= 0;
            end
        end
        
        else if(alarm_on)
        begin
            if(sec1==asec1&&sec2==asec2&&min1==amin1&&min2==amin2&&hour1==ahour1&&hour2==ahour2)
            begin
                beep512Hz <= 0;
                beep1kHz  <= 1;
            end
        end
        
        else
        begin
            beep512Hz <= 0;
            beep1kHz  <= 0;
        end
        
    end
    
endmodule