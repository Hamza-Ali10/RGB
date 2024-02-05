`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 02:49:24 PM
// Design Name: 
// Module Name: Timer_input
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


module Timer_input #(parameter n= 255)(
         input clk,
         input reset,
         input enable,
         input [n -1:0 ] final_value,
         output done 
    ); 
    
             reg [n-1 : 0] Q_reg , Q_next ;
           
             
            always@ (posedge clk , negedge reset)
            begin
                    if(~reset )
                     Q_reg = 1'b0;
                    
                    else if(enable)
                    Q_reg <= Q_next ;
                    
                    else
                    Q_reg <= Q_reg ;
            end
            
            assign done = Q_reg == final_value ;
            
            always@(*)
            begin
                    if(Q_next == done ) 
                    Q_next = 'b0 ;
                    else
                    Q_next = (Q_reg + 1);
            end
endmodule