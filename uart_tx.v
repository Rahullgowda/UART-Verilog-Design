`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 18:51:43
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk,
    input rst,
    input baud_tick,
    input start,
    input [7:0] data_in,
    output reg tx
);

    reg [1:0] state;
    reg [7:0] data_reg;
    reg [2:0] bit_index;

    localparam IDLE=0, START=1, DATA=2, STOP=3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1;
            bit_index <= 0;
        end else begin
            case (state)

                IDLE: begin
                    tx <= 1;
                    if (start) begin
                        data_reg <= data_in;
                        state <= START;
                    end
                end

                START: begin
                    tx <= 0;
                    if (baud_tick) begin
                        bit_index <= 0;
                        state <= DATA;
                    end
                end

                DATA: begin
                    tx <= data_reg[bit_index];
                    if (baud_tick) begin
                        if (bit_index == 7)
                            state <= STOP;
                        else
                            bit_index <= bit_index + 1;
                    end
                end

                STOP: begin
                    tx <= 1;
                    if (baud_tick)
                        state <= IDLE;
                end

            endcase
        end
    end

endmodule
