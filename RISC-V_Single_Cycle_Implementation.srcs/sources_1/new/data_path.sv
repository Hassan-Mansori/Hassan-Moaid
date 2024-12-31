`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 04:51:12 PM
// Design Name: 
// Module Name: data_path
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


module data_path(input logic clk, input logic reset_n,
input logic branch, 
inout logic [1:0] memtoreg, 
input logic rege_write,
input logic [3:0] alu_ctrl,
input logic alu_src,
input logic mem_write,
input logic pc_sel,
input logic jump_alu,
input logic jump_u,
output logic zero,
output logic [31:0]inst_bus
);

logic [31:0] imm;
//imm gen
//logic [31:0] inst_bus;
logic [31:0] current_pc;  
logic [31:0] pc_data_in;
logic [31:0] pc_jump;
logic [31:0] pc_plus_4;
logic [31:0] alu_imm;
// PC logics
logic [31:0]reg_data1;
logic [31:0]reg_data2;

logic [31:0] reg_wdata;
logic [31:0] reg_wdata2;
logic [31:0] mem_data;
//
//logic zero;
logic [31:0] alu_result;
logic [31:0] alu_op2;
//alu logics
program_counter #(32) PC (.clk(clk), .reset_n(reset_n), .data_in(pc_data_in), .data_out(current_pc) );


//assign pc_sel = branch & zero;
assign pc_plus_4 = current_pc + 4;
assign pc_jump = current_pc + imm;

assign pc_data_in = (pc_sel == 1 & jump_alu == 0) ? pc_jump:
 (pc_sel == 0 & jump_alu == 0)? pc_plus_4: alu_result;

inst_mem ROM (.PC(current_pc), .inst(inst_bus) ); 



reg_file reges (.clk(clk), .reset_n(reset_n), .reg_write(rege_write), .raddr1(inst_bus[19:15]), .raddr2(inst_bus[24:20]), .waddr(inst_bus[11:7]),
 .wdata(reg_wdata2), .rdata1(reg_data1), .rdata2(reg_data2) );



imm_gen immadiate( .inst(inst_bus), .imm(imm));

assign alu_op2 = alu_src ? imm : reg_data2;

alu #(32) al_u (.op1(reg_data1), .op2(alu_op2), .alu_ctrl(alu_ctrl), .alu_result(alu_result), .zero(zero) );



//data_mem RAM ( .clk(clk), .reset(reset_n),  .rdata(mem_data), .Wdata(reg_data2), .address(alu_result), .mem_write(mem_write) );
assign reg_wdata = (memtoreg == 2'b01) ? mem_data : (memtoreg == 2'b00) ? alu_result : (memtoreg == 2'b10) ? pc_plus_4: pc_jump; 
assign reg_wdata2 = (jump_u == 1) ? imm :reg_wdata;

data_mem RAM(
.Wdata(reg_data2),
.address(alu_result),
.mem_write(mem_write),
.clk(clk),
.reset(reset_n),
.func3(inst_bus[14:12]),
.rdata(mem_data) 
    );


endmodule
