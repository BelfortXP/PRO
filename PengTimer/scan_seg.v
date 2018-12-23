`timescale 1ns / 1ps

module scan_seg(
    input clk,
    input rst,
    input [3:0] sec0,
    input [3:0] sec1,
    input [3:0] min0,
    input [3:0] min1,
    input [3:0] hour0,
    input [3:0] hour1,
    output [7:0] seg7,
    output [7:0] number
    );
    reg [2:0] scan_cnt;
    reg [3:0] show;
    reg [6:0] number_r;
    reg [7:0] seg7_r;
    assign number = {1'b1, (~number_r[6:0])};
    assign seg7 = ~seg7_r;
    
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
            3'b000 : seg7_r = 8'b0000_0001;
            3'b001 : seg7_r = 8'b0000_0010;
            3'b010 : seg7_r = 8'b0000_1000;
            3'b011 : seg7_r = 8'b0001_0000;
            3'b100 : seg7_r = 8'b0100_0000;
            3'b101 : seg7_r = 8'b1000_0000;
            default : seg7_r = 8'b0000_0000;
        endcase
    end
    
    always @(scan_cnt)
    begin
        case(scan_cnt)
            0 : show = sec1;
            1 : show = sec0;
            2 : show = min1;
            3 : show = min0;
            4 : show = hour1;
            5 : show = hour0;
        endcase
    end
    
    always @(show)
    begin
        case(show)
            0 : number_r = 7'b0111111;
            1 : number_r = 7'b0000110;
            2 : number_r = 7'b1011011;
            3 : number_r = 7'b1001111;
            4 : number_r = 7'b1100110;
            5 : number_r = 7'b1101101;
            6 : number_r = 7'b1111101;
            7 : number_r = 7'b0100111;
            8 : number_r = 7'b1111111;
            9 : number_r = 7'b1100111;
            default : number_r = 7'b0000000;
        endcase
    end
endmodule