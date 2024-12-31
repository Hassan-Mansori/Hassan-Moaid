`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 01:49:15 PM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
    input logic [31 : 0] PC,
    output logic [31:0] inst
    );
    
    logic [31 :0] ints [0:255];
    
    initial $readmemh("/home/it/Desktop/instrctions.txt", ints);
    
    assign inst = ints[PC/4];
endmodule

