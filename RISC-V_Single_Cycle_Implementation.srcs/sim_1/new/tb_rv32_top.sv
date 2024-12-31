`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 05:09:17 PM
// Design Name: 
// Module Name: tb_rv32_top
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


module tb_rv32_top;

logic clk = 0;
logic reset_n;

rv32i_top dut ( .clk(clk), .reset_n(reset_n));

always #5 clk=~clk;

initial begin

clk = 0; 
reset_n = 1;
#5 
reset_n = 0;
#5
reset_n = 1;
#1500

$finish;

end

endmodule
