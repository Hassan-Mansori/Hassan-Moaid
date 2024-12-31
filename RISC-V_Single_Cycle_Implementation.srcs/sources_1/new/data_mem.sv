`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 01:53:31 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
input logic [31 :0] Wdata,
input logic [31:0] address,
input logic mem_write,
input logic clk,
input logic reset,
input logic [2:0] func3,
output logic [31:0] rdata 
    );
    
    int i; 
    logic [31:0] ram [0:1023];     
    logic [7:0] byteData;
    logic [15:0] halfData;
    logic [31:0] wordData;
    
    always @(*) begin
        if(func3[2:0] == 3'b000) begin //byte
                if(address[1:0] == 2'b00) 
                    rdata= { {23{ram[address[31:2]][31]}},ram[address[31:2]][7:0]};
                else if(address[1:0] == 2'b01)
                    rdata = { {23{ram[address[31:2]][31]}},ram[address[31:2]][15:8]};
                else if(address[1:0] == 2'b10)
                    rdata = { {23{ram[address[31:2]][31]}},ram[address[31:2]][23:16]};
                else if(address[1:0] == 2'b11)
                    rdata = { {23{ram[address[31:2]][31]}},ram[address[31:2]][31:24]};
        end
        if(func3[2:0] == 3'b100) begin //byte unsigned
                if(address[1:0] == 2'b00) 
                    rdata= ram[address[31:2]][7:0];
                else if(address[1:0] == 2'b01)
                    rdata = ram[address[31:2]][15:8];
                else if(address[1:0] == 2'b10)
                    rdata = ram[address[31:2]][23:16];
                else if(address[1:0] == 2'b11)
                    rdata = ram[address[31:2]][31:24];
        end
            if(func3[2:0] == 3'b001) begin // half word
                if(address[1:0] == 2'b00) 
                    rdata= { {16{ram[address[31:2]][31]}},ram[address[31:2]][15:0]};
                else if(address[1:0] == 2'b10)
                    rdata ={ {16{ram[address[31:2]][31]}},ram[address[31:2]][31:16]};
        end
        
        if(func3[2:0] == 3'b101) begin //half word unsigned
                if(address[1:0] == 2'b00) 
                    rdata= ram[address[31:2]][15:0];
                else if(address[1:0] == 2'b10)
                    rdata =ram[address[31:2]][31:16];
        end
        
            if(func3[2:0] == 3'b010)
                rdata = ram[address[31:2]];
      end
            
         
   // need to handle the store each byte
    always @(posedge clk, negedge reset)
    begin
        if(!reset)
        begin  
            for(i=0; i < 1023; i++) begin
            ram[i] <= 0; 
            end
        end
         else if (mem_write) begin
             if(func3[1:0] == 2'b00) begin //byte
                if(address[1:0] == 2'b00) 
                    ram[address[31:2]][7:0] <= Wdata[7:0];
                else if(address[1:0] == 2'b01)
                    ram[address[31:2]] [15:8] <= Wdata[7:0];
                else if(address[1:0] == 2'b10)
                    ram[address[31:2]][23:16] <= Wdata[7:0];
                else if(address[1:0] == 2'b11)
                    ram[address[31:2]] [31:24]<= Wdata[7:0];
        end
            if(func3[1:0] == 2'b01) begin
                if(address[1:0] == 2'b00) 
                    ram[address[31:2]] [15:0]<= Wdata[15:0];
                else if(address[1:0] == 2'b10)
                    ram[address[31:2]][31:16] <= Wdata[15:0];
        end
            if(func3[1:0] == 2'b10)
                ram[address[31:2]] <= Wdata;
      end
   end
    

endmodule