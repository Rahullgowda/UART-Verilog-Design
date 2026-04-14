`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 19:18:46
// Design Name: 
// Module Name: test
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


module uart_top_tb;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire tx;
wire [7:0] data_out;
wire done;


uart_top dut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .tx(tx),
    .data_out(data_out),
    .done(done)
);


always #5 clk = ~clk;


initial begin
    clk = 0;
    rst = 1;
    start = 0;
    data_in = 8'b10110010;

    #20;
    rst = 0;

   
    #20;
    start = 1;

    #10;
    start = 0;   

   
    #200000;

    $finish;
end

endmodule
