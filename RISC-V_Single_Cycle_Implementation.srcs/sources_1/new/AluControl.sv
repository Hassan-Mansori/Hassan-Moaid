`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 04:14:13 PM
// Design Name: 
// Module Name: AluControl
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


module AluControl(
    input logic [1:0] alu_op,
    input logic [2:0] func3,
    input logic func7,
    output logic [3:0] alu_ctrl
    );
    
    always @(*) begin
        case (alu_op) 
            2'b00: alu_ctrl = 4'b0000;// store/Load op=ADD
            2'b01: begin 
            case(func3)
                3'b000 :alu_ctrl = 4'b1000; //beq
                3'b001: alu_ctrl = 4'b1000;  //bne
                3'b100: alu_ctrl = 4'b0010;  //blt
                3'b101: alu_ctrl = 4'b0010;  //bge
                3'b110: alu_ctrl = 4'b0011;  //bltu
                3'b111: alu_ctrl = 4'b0011;  //bgeu
            endcase
            end
            2'b10: alu_ctrl = {func7,func3}; // R-type
            2'b11: alu_ctrl = {1'b0,func3}; // I-type
            
            endcase
            end
    
    
    
endmodule
