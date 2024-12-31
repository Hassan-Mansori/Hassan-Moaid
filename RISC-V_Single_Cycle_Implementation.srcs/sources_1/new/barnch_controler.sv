`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2024 04:47:08 PM
// Design Name: 
// Module Name: barnch_controler
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


module barnch_controler( input logic [2:0]func3, input logic zero, input logic branch,
output logic pc_sel );

   always_comb begin
        case (func3)
            3'b000: pc_sel = (branch & zero) ? 1 : 0; //beq 
            3'b001: pc_sel = (branch & ~zero) ? 1 : 0;  //bne
            3'b100: pc_sel = (branch & zero) ? 1 : 0;  //blt
            3'b101: pc_sel = (branch & ~zero) ? 1 : 0;  //bge
            3'b110: pc_sel = (branch & zero ) ? 1 : 0;  //bltu
            3'b111: pc_sel = (branch & ~zero) ? 1 : 0;  //bgeu
            default: pc_sel = 0;  
        endcase
    end
endmodule
