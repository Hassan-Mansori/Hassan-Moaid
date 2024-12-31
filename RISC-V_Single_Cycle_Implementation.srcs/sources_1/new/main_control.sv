`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 02:00:36 PM
// Design Name: 
// Module Name: main_control
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


module main_control(
    input logic [6:0] Instruction,
    output logic branch,
    output logic mem_write,
    output logic [1:0]mem_to_reg,
    output logic alu_src,
    output logic jump_alu, jump_u,
    output logic reg_write,
    output logic [1:0] alu_op
);
    always_comb begin
        case (Instruction)
            // R-type Instruction
            7'b0110011: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b00;
                alu_op = 2'b10;
                alu_src = 0;
                branch = 0;
                jump_alu = 0;
                jump_u = 0;
            end

            // I-type Immediate Instruction
            7'b0010011: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b00;
                alu_op = 2'b11;
                alu_src = 1;
                branch = 0;
                jump_alu = 0;
                jump_u = 0;
            end

            // Load Instruction
            7'b0000011: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b01;
                alu_op = 2'b00;
                alu_src = 1;
                branch = 0;
                jump_alu = 0;
                jump_u = 0;
            end

            // Store Instruction
            7'b0100011: begin
                reg_write = 0;
                mem_write = 1;
                mem_to_reg = 2'b00;
                alu_op = 2'b00;
                alu_src = 1;
                branch = 0;
                jump_alu = 0;
                jump_u = 0;
            end

            // Branch (beq) Instruction
            7'b1100011: begin
                reg_write = 0;
                mem_write = 0;
                mem_to_reg = 2'b00;
                alu_op = 2'b01;
                alu_src = 0;
                branch = 1;
                jump_alu = 0;
                jump_u = 0;
            end
              // jump Instruction
            7'b1101111: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b10;
                alu_op = 2'b01;
                alu_src = 0;
                branch = 1;
                jump_alu = 0;
                jump_u = 0;
            end
            // JALR Instruction
            7'b1100111: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b00;
                alu_op = 2'b11;
                alu_src = 1;
                branch = 1;
                jump_alu = 1;
                jump_u = 0;
            end
             // aUpic-type Instruction
            7'b0010111: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b11;
                alu_op = 2'b10;
                alu_src = 0;
                branch = 0;
                jump_alu = 0;
                jump_u = 0;
            end  
            //l Ui-type Instruction
            7'b0110111: begin
                reg_write = 1;
                mem_write = 0;
                mem_to_reg = 2'b00;
                alu_op = 2'b10;
                alu_src = 0;
                branch = 0;
                jump_alu = 0;
                jump_u = 1;
            end
            // Default case (already set to 0 in the beginning)
            default: begin
                reg_write = 0;
                mem_write = 0;
                mem_to_reg = 2'b00;
                alu_op = 2'b00;
                alu_src = 0;
                branch = 0;
                jump_alu = 0;
                jump_u = 0;
            end
        endcase
    end
endmodule
