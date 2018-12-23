`timescale 1ns / 1ps

module button_control(
    input clk,
    input rst,
    input button,
    output signal
    );
    reg delay1,delay2,delay3;
    always@(posedge clk)
    begin
        if(~rst)
        begin
            delay1 <= 0;
            delay2 <= 0;
            delay3 <= 0;
        end
        else
        begin
            delay1 <= button;
            delay2 <= delay1;
            delay3 <= delay2;
        end
    end
    
    assign signal = delay1&delay2&delay3;
    
endmodule
