`timescale 1ns / 1ps
//��mux_timer�������Ƶ�ѡ������Ψһ��ͬ����clk1��clk2Ϊ4bit
module mux_timer4(
    input mux,
    input [3:0]num1,
    input [3:0]num2,
    input [3:0]ber1,
    input [3:0]ber2,
    output reg [3:0] out1,
    output reg [3:0] out2,
    output reg [3:0] save1,
    output reg [3:0] save2
    );
    always @(mux)
        if(~mux)
            begin
                {out1,out2} <= {num1,num2};
            end
        else
            begin
                {out1,out2} <= {ber1,ber2};
                {save1,save2} <= {ber1,ber2};
            end
endmodule
