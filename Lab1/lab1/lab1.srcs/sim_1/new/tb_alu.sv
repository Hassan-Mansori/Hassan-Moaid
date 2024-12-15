`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:36:44 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu #(parameter ALU_WIDTH = 16);


logic [ALU_WIDTH -1 : 0] A, B;
logic carry;
 logic [1:0] sel;
logic [ALU_WIDTH -1 : 0] SUM;

alu #(16) DUT( .A(A), .B(B), .SUM(SUM), .sel(sel), .carry());


initial begin
#10
A = 20;
B = 20;
sel = 2'b00; 

#10
A = 20;
B = 20;
sel = 2'b01; 
 
#10
A = 20;
B = 20;
sel = 2'b11; 
 
 #10
A = 20;
B = 20;
sel = 2'b10; 
 
 
#50
$finish; 
end
endmodule
