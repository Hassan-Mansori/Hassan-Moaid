`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:40:40 PM
// Design Name: 
// Module Name: top
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


module top( input logic clk, input logic reset, output logic [15:0] alu_bus);

logic [3:0] PC;
logic [7:0] inst_bus;
//logic [15:0] alu_bus;
logic [15:0]rege1;
logic [15:0]rege2;
  
  program_counter #(4) dd (.clk(clk), .reset(reset), .PC(PC));


alu #(16) aluu ( .A(rege1), .B(rege2), .SUM(alu_bus), .sel(inst_bus[1:0]), .carry(0));


register_file #(16) regester1 (.clk(clk), .reset(reset), .Data(alu_bus), .write(inst_bus[7:6]), .read1(inst_bus[3:2]), .read2(inst_bus[5:4]), .reg1(rege1), .reg2(rege2));

instruction_memory #(4)memo(.intstruction(inst_bus), .PC(PC));

endmodule
