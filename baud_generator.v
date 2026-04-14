`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 18:47:39
// Design Name: 
// Module Name: baud_gen
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


module baud_gen(
    input clk,
    input rst,
    output reg baud_tick
);

    parameter CLK_FREQ = 1000;
    parameter BAUD_RATE = 10;

    localparam BAUD_COUNT = CLK_FREQ / BAUD_RATE;

    reg [31:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            baud_tick <= 0;
        end else begin
            if (count == BAUD_COUNT - 1) begin
                count <= 0;
                baud_tick <= 1;
            end else begin
                count <= count + 1;
                baud_tick <= 0;
            end
        end
    end

endmodule
