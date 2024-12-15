`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:09:08 PM
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


module tb_program_counter #(parameter PROG_VALUE =3);
 logic [PROG_VALUE -1 :0] PC;
logic clk;
logic reset;

program_counter #(3) dut(.clk(clk), .reset(reset), .PC(PC));

always #5 clk = ~clk;
initial begin
reset = 0;
clk = 0;
#10
reset = 1;
#10

#60
$finish;
end
endmodule
