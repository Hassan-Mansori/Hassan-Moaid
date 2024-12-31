`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 04:13:38 PM
// Design Name: 
// Module Name: rv32i_top
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


module rv32i_top(input logic clk, input logic reset_n);

logic branch;
wire [1:0] memtoreg;
logic rege_write;
logic [1:0] alu_op;
logic alu_src;
logic mem_write;
logic [3:0] alu_ctrl;
logic [31:0] inst_bus;
logic pc_sel;
logic zero;
logic jump_alu ;
logic jump_u ;


control_unit cu(
     .opcode(inst_bus[6:0]),
     .func7(inst_bus[30]),
     .func3(inst_bus[14:12]),
     .branch(branch),
     .zero(zero), 
     .pc_sel(pc_sel) ,
     .jump_alu (jump_alu),
     .jump_u (jump_u),
    // less
     .mem_write(mem_write),
     .memtoreg(memtoreg),     .alu_src(alu_src),     .reg_write(rege_write),    .alu_op(alu_op), .alu_ctrl(alu_ctrl));
     
     
     
data_path path (.clk(clk), .reset_n(reset_n), .inst_bus(inst_bus),
 .branch(branch),     .zero(zero), 
 .jump_alu (jump_alu), 
 .jump_u (jump_u), 
 .memtoreg(memtoreg), .rege_write(rege_write), .alu_ctrl(alu_ctrl), .alu_src(alu_src), .mem_write(mem_write), .pc_sel(pc_sel) );



//main_control ctrl(.Instruction(inst_bus[6:0]), .branch(branch), .mem_write(mem_write), .mem_to_reg(memtoreg), .alu_src(alu_src), .reg_write(rege_write), .alu_op(alu_op) );

//ALUcu aluxx (.alu_op(alu_op), .func3(inst_bus[14:12]), .func7(inst_bus[30]), .alu_ctrl(alu_op) );

endmodule
