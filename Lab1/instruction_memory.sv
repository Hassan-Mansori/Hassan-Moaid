`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:23:00 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory #(parameter IMEM_DEPTH = 4)(
    input logic [IMEM_DEPTH-1 : 0] PC,
    output logic [7:0] intstruction
    );
    
    logic [7 :0] ints [0:IMEM_DEPTH - 1];
    
    initial $readmemb("/home/it/Desktop/Courses/MCA/Hassan-Moaid/CX-204-Lab1/support_files/fib_im.mem", ints);
    
    assign intstruction = ints[PC];
endmodule
