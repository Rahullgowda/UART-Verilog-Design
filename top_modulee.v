`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 18:53:05
// Design Name: 
// Module Name: top_mod
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


module uart_top(
    input clk,
    input rst,
    input start,
    input [7:0] data_in,
    output tx,
    output [7:0] data_out,
    output done
);

wire baud_tick;
wire rx;

assign rx = tx;

baud_gen b1 (.clk(clk),.rst(rst),.baud_tick(baud_tick));

uart_tx t1 (.clk(clk),.rst(rst),.baud_tick(baud_tick),.start(start),.data_in(data_in),.tx(tx));

uart_rx r1 (.clk(clk),.rst(rst),.baud_tick(baud_tick),.rx(rx),.data_out(data_out),.done(done));

endmodule
