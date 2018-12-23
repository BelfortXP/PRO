`timescale 1ns / 1ps

module Timer(
    input clk,
    input rst,
    input in,
    
    input sec,
    input min,
    input hour,
    
    input quickset_min,
    input quickset_hour,
    
    input [3:0] set_num1,
    input [3:0] set_num2,
    
    input set_alarm_min,
    input set_alarm_hour,
    input set_alarm_sec,
    
    input alarm_on,
    
    output [3:0] set_light1,
    output [3:0] set_light2,
    
    output [7:0] seg7,
    output [7:0] number,
    
    output beep_out
    );
    
    wire clk1Hz,rst_sec,carry_sec;
    wire [3:0] sec_out1,sec_out2;
    clock_div c1(clk,rst,clk1Hz);
    mux_timer m_sec(sec,rst,0,rst_sec);
    counter_12 csec(clk1Hz,in,rst_sec,carry_sec,sec_out1,sec_out2);
    
    wire carry_min,clk_min,clk4Hz;
    wire [3:0] min_out1,min_out2;
    clock_div_4Hz c4(clk,rst,clk4Hz);
    mux_timer m_min(quickset_min,carry_sec,clk4Hz,clk_min);
    counter_min cmin(clk_min,in,rst,min,set_num1,set_num2,carry_min,min_out1,min_out2); 
    
    wire clk_hour;
    wire [3:0] hour_out1,hour_out2;
    mux_timer m_hour(quickset_hour,carry_min,clk4Hz,clk_hour);
    counter_3 chour(clk_hour,in,rst,min,hour,set_num1,set_num2,hour_out1,hour_out2);
    
    wire clk512Hz;
    wire [3:0] dis_sec1,dis_sec2,dis_min1,dis_min2,dis_hour1,dis_hour2;
    wire [3:0] alarm_sec1,alarm_sec2,alarm_min1,alarm_min2,alarm_hour1,alarm_hour2;
    clock_div_512Hz c512(clk,rst,clk512Hz);
    mux_timer4 alarm_sec(set_alarm_sec,sec_out1,sec_out2,set_num1,set_num2,dis_sec1,dis_sec2,alarm_sec1,alarm_sec2);
    mux_timer4 alarm_min(set_alarm_min,min_out1,min_out2,set_num1,set_num2,dis_min1,dis_min2,alarm_min1,alarm_min2);
    mux_timer4 alarm_hour(set_alarm_hour,hour_out1,hour_out2,set_num1,set_num2,dis_hour1,dis_hour2,alarm_hour1,alarm_hour2);
    scan_seg(clk512Hz,rst,dis_sec1,dis_sec2,dis_min1,dis_min2,dis_hour1,dis_hour2,seg7,number);
    
    wire beep512Hz,beep1kHz,clk1kHz;
    clock_div_1KHz c1k(clk,rst,clk1kHz);
    mux_Beeper m_bee(sec_out1,sec_out2,min_out1,min_out2,hour_out1,hour_out2,
    alarm_sec1,alarm_sec2,alarm_min1,alarm_min2,alarm_hour1,alarm_hour2,alarm_on,beep512Hz,beep1kHz);
    Beeper bep(clk,clk512Hz,clk1kHz,beep512Hz,beep1kHz,beep_out);
    
endmodule