`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 09:48:30 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input logic [6:0] opcode,
    input logic func7,
    input logic  [2:0] func3,
    
    input logic less,
    input logic zero,
    output logic pc_sel,
    output  logic jump_alu,
    output logic branch,
    output logic mem_write,
    output logic [1:0] memtoreg,
    output logic alu_src,
    output logic reg_write,
    output logic [1:0] alu_op,
    output logic [3:0] alu_ctrl,
    output logic jump_u
    );
    
    main_control mainCu(
    .Instruction(opcode),
    .branch(branch),
    .mem_write(mem_write),
    .mem_to_reg(memtoreg),
    .alu_src(alu_src),
    .reg_write(reg_write),
    .alu_op(alu_op),
    .jump_alu(jump_alu),
    .jump_u(jump_u)
);

    AluControl ALUcu(
    .alu_op(alu_op),
    .func3(func3),
    .func7(func7),
    .alu_ctrl(alu_ctrl)
    );


barnch_controler ranch ( .func3(func3), .zero(zero), .branch(branch),  .pc_sel(pc_sel));


endmodule
