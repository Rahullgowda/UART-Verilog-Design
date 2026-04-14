`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 18:52:27
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input clk,
    input rst,
    input baud_tick,
    input rx,
    output reg [7:0] data_out,
    output reg done
);

    reg [1:0] state;
    reg [2:0] bit_index;
    reg [7:0] data_reg;

    localparam IDLE=0, START=1, DATA=2, STOP=3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            bit_index <= 0;
        end else begin
            case (state)

                IDLE: begin
                    done <= 0;
                    if (rx == 0)
                        state <= START;
                end

                START: begin
                    if (baud_tick) begin
                        bit_index <= 0;
                        state <= DATA;
                    end
                end

                DATA: begin
                    if (baud_tick) begin
                        data_reg[bit_index] <= rx;
                        if (bit_index == 7)
                            state <= STOP;
                        else
                            bit_index <= bit_index + 1;
                    end
                end

                STOP: begin
                    if (baud_tick) begin
                        data_out <= data_reg;
                        done <= 1;
                        state <= IDLE;
                    end
                end

            endcase
        end
    end

endmodule
