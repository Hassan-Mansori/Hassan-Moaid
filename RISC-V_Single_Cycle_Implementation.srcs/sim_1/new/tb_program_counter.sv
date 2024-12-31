`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:12:10 PM
// Design Name: 
// Module Name: tb_program_counter
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


module tb_program_counter;
logic clk;
logic reset_n;
logic [31:0]data_in;
logic [31:0]data_out;
program_counter #(32) dut (.clk(clk), .reset_n(reset_n), .data_in(data_in), .data_out(data_out));

always #5 clk=~clk;

initial begin 
reset_n = 0;
clk = 0;
#5
reset_n = 1;
data_in = 1;
#5

repeat(10) begin
    @(negedge clk);
    data_in = data_in + 1 ;
end

repeat(10) begin
    @(negedge clk);
    reset_n =0;
    data_in = data_in + 1 ;
end
$finish;
end
endmodule
