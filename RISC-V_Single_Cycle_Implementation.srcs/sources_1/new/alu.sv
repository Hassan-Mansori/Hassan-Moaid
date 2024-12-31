`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 02:50:42 PM
// Design Name: 
// Module Name: alu
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


module alu #(parameter n = 32) (input logic [n-1:0] op1, input logic [n-1:0] op2, input logic [3:0]alu_ctrl,
 output logic [n-1:0] alu_result, output logic zero);


always_comb begin
case (alu_ctrl)
    4'b0000:begin
     alu_result =op1 + op2; 
     if(alu_result == 0)
            zero = 1;
        else
            zero = 0;
    end
    4'b1000:begin
     alu_result = op1 - op2;    
     if(alu_result == 0)
            zero = 1;
       else
            zero = 0;         
     end
    4'b0110: begin 
    alu_result =op1 | op2;
    zero = 0;
    end    //OR
    4'b0100: begin  alu_result = op1 ^ op2;
    zero=0;
    end   //XOR
    4'b0001: begin alu_result =op1 << op2;  
    zero=0;
    end //SLL
    4'b0101:begin  alu_result =op1 >> op2;  
    zero=0;
    end //SRL
    4'b1101: begin  alu_result =(op1 >>> op2);
    zero=0;
    end//SRA
    
    4'b0010: begin 
        if ($signed(op1) < $signed(op2)) begin
            alu_result = 1; 
            zero = 1;     
    end
        else begin
            alu_result = 0; 
            zero = 0; 
        end
    end//SLT
     
    4'b0011: begin alu_result = (op1 < op2) ? 1:0;
    zero = (alu_result == 1) ? 1 : 0;
    end //SLTU
    
    //  4'b1001 : if ( op1 < op2) rd=1 less=1; else rd=0 less=0
    4'b0111: begin alu_result = op1 & op2; 
    zero =0;
    end //AND
      endcase  
      
          
end              
                 



endmodule
