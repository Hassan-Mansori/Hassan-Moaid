`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:57:53 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter #(parameter PROG_VALUE = 3)(
 output logic [PROG_VALUE -1 :0] PC,
input logic clk, reset);

always@(posedge clk or negedge reset) begin 

if(~reset)
PC <= 0;
else begin
PC <= PC+1;
if(PC== 3)
PC <= 0;
end
end
endmodule
