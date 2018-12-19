`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 19:33:51
// Design Name: 
// Module Name: scan_seg
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


module scan_seg(
    input rst,
    input clk,
    input [3:0] sec0,
    input [3:0] sec1,
    input [3:0] min0,
    input [3:0] min1,
    input [3:0] hour0,
    input [3:0] hour1,
    output [7:0] DIG,
    output [7:0] Y
    );
    wire clkout;
    reg [2:0] scan_cnt;
    reg [3:0] show;
    reg [6:0] Y_r;
    reg [7:0] DIG_r;
    assign Y = {1'b1, (~Y_r[6:0])};
    assign DIG = ~DIG_r;
    clock_div c1(clk,rst,clkout);
    
//    always @(posedge clkout or negedge rst)
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            scan_cnt <= 0;
        else begin
            scan_cnt <= scan_cnt + 1;
            if(scan_cnt == 3'd5)    scan_cnt <= 0;
        end
    end
    
    always @(scan_cnt)
    begin
        case(scan_cnt)
            3'b000 : DIG_r = 8'b0000_0001;
            3'b001 : DIG_r = 8'b0000_0010;
            3'b010 : DIG_r = 8'b0000_1000;
            3'b011 : DIG_r = 8'b0001_0000;
            3'b100 : DIG_r = 8'b0100_0000;
            3'b101 : DIG_r = 8'b1000_0000;
//            3'b110 : DIG_r = 8'b0100_0000;
//            3'b111 : DIG_r = 8'b1000_0000;
            default : DIG_r = 8'b0000_0000;
        endcase
    end
    
    always @(scan_cnt)
    begin
        case(scan_cnt)
            0 : show = sec0;
            1 : show = sec1;
            2 : show = min0;
            3 : show = min1;
            4 : show = hour0;
            5 : show = hour1;
        endcase
    end
    
    always @(show)
    begin
        case(show)
            0 : Y_r = 7'b0111111;
            1 : Y_r = 7'b0000110;
            2 : Y_r = 7'b1011011;
            3 : Y_r = 7'b1001111;
            4 : Y_r = 7'b1100110;
            5 : Y_r = 7'b1101101;
            6 : Y_r = 7'b1111101;
            7 : Y_r = 7'b0100111;
            8 : Y_r = 7'b1111111;
            9 : Y_r = 7'b1100111;
            default : Y_r = 7'b0000000;
        endcase
    end
endmodule
