`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:23:45 PM
// Design Name: 
// Module Name: register_file
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


module register_file #(parameter REGF_WIDTH = 16)(
    input logic clk,
    input logic reset,
    input logic [1:0] write,
    input logic [1:0] read1,
    input logic [1:0] read2,
    input logic [REGF_WIDTH - 1:0] Data,
    output logic [REGF_WIDTH - 1:0] reg1,
    output logic [REGF_WIDTH - 1:0] reg2
    );
    
    logic [REGF_WIDTH-1 :0] registers [3:0];
    
    initial $readmemb("/home/it/Desktop/Courses/MCA/Hassan-Moaid/CX-204-Lab1/support_files/fib_rf.mem", registers);
    
    always@ (posedge clk, negedge reset) begin
//        if (!reset) begin
//            registers[0] <= 0;
//            registers[1] <= 0;
//            registers[2] <= 0;
//            registers[3] <= 0;
//    end
        if (write == 2'b01)
            registers[1] <= Data;
        else if (write == 2'b10)
            registers[2] <= Data;
        else if (write == 2'b11)
            registers[3] <= Data;
    end
    
    always @(*) begin
        if(read1 == 2'b00)
            reg1 = registers[0];
        else if (read1 == 2'b01)
            reg1 = registers[1];
        else if (read1 == 2'b10)
            reg1 = registers[2];
        else if (read1 == 2'b11)
            reg1 = registers[3];            
    end

    always @(*) begin
        if(read2 == 2'b00)
            reg2 = registers[0];
        else if (read2 == 2'b01)
            reg2 = registers[1];
        else if (read2 == 2'b10)
            reg2 = registers[2];
        else if (read2 == 2'b11)
            reg2 = registers[3];            
    end    
    
endmodule
