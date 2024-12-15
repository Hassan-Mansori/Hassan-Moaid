`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 03:28:13 PM
// Design Name: 
// Module Name: tb_top
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


module tb_top;

logic clk = 0;
logic reset;
logic [15:0] alu_bus;

top DUT( 
.clk(clk), 
.reset(reset),
.alu_bus(alu_bus)
);

always #5 clk = ~clk;
initial begin
reset = 1;
#10
reset = 0;
#10
reset = 1;



#500
$finish; 
end
endmodule
