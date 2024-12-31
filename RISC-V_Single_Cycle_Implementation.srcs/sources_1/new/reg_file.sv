`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:21:26 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input logic clk,
    input logic reset_n,
    input logic reg_write,
    input logic [4:0] raddr1,
    input logic [4:0] raddr2,
    input logic [4:0] waddr,
    input logic [31:0] wdata,
    output logic [31:0] rdata1,
    output logic [31:0] rdata2
    );
    
    logic [31 :0] registers [0:31];
    int i;
    
    always@ (posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            for(i=0; i < 32; i++) begin
            registers[i] <= 0; 
            end
        end
        if (reg_write == 1'b1 && waddr != 0)
            registers[waddr] <= wdata;
    end
    
    assign rdata1 = registers[raddr1];
    assign rdata2 = registers[raddr2];

endmodule

