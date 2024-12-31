`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 03:15:06 PM
// Design Name: 
// Module Name: imm_gen
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

module imm_gen(
    input logic [31:0] inst,
    output logic [31:0] imm
    );
    
    always_comb begin
        case (inst[6:0])
            7'b0010011: imm = { {20{inst[31]}}, inst[31:20] };             // I-type
            7'b0000011: imm = { {20{inst[31]}}, inst[31:20] };             // I-type
            7'b0100011: imm = { {20{inst[31]}}, inst[31:25], inst[11:7] }; // S-type
            7'b1100011: imm = {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};            
            7'b0110111: imm = {inst[31:12], 12'b0};                        // U-type (LUI)
            7'b0010111: imm = {inst[31:12], 12'b0};                        // U-type (AUIPC)
            7'b1101111: imm = { {12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0 }; // J-type
            default: imm = 32'b0;                                          // Default case for unsupported instructions
        endcase
    end
    
endmodule
