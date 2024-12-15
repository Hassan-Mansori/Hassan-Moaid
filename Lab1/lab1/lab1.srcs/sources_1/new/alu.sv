`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:19:36 PM
// Design Name: 
// Module Name: alu
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


module alu #(parameter ALU_WIDTH = 16) ( 
input logic [ALU_WIDTH -1 : 0] A, B,
input logic carry, input logic [1:0] sel,
output logic [ALU_WIDTH -1 : 0] SUM
    );
    
   always_comb begin
    case (sel) 
     
    2'b00: SUM = A + B; 
    2'b01: SUM = A - B; 
    2'b11: SUM = A | B; 
    2'b10: SUM = A & B; 
    
    
    endcase
    end
endmodule
