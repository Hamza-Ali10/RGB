`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 04:02:01 PM
// Design Name: 
// Module Name: RGB_LED_Application
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


module RGB_LED_Application #(parameter R = 8)(
       
       input clk,
       input reset,
       input change_color,
       input [R:0] color_intensity, 
       input [1:0] color_selector,
       output red_LED , green_LED , blue_LED, 
       output red_JA
        
    );
    
    
    reg [R:0] R_reg , R_next ,G_reg , G_next ,B_reg , B_next;

     always @(posedge clk , negedge reset)
       begin
               
               if(~reset )
               begin
                 R_reg  <= 'b0;
                 G_reg  <= 'b0;
                 B_reg  <= 'b0;
               end
               else if(change_color)
               begin
                 R_reg <= R_next;
                 G_reg <= G_next;
                 B_reg <= B_next;
               end
              else
              begin
                 R_reg <= R_reg;
                 G_reg <= G_reg;
                 B_reg <= B_reg;
               end  
       end
    
    //next state logic 
     always@(*)
        begin
                     R_next = R_reg;
                     G_next = G_reg;
                     B_next = B_reg;
                     
                        case(color_selector)
                                                2'b00 : R_reg = color_intensity;
                                                2'b01 : G_reg = color_intensity;
                                                2'b10 : B_reg = color_intensity;
                                                default:
                                                begin
                                                      R_next = R_reg;
                                                      G_next = G_reg;
                                                      B_next = B_reg;
                                                end
                        endcase
        end
    
    //RGB driver to generate appropriate PWM signal 
    RGB_Driver #(.R(R)) LED16(
    
    .clk(clk),
    .reset(reset),
    
    .red_duty(R_reg),
    .green_duty(G_reg),
    .blue_duty(B_reg),
    
    .red_LED(red_LED),
    .green_LED(green_LED),
    .blue_LED(blue_LED)
    
    );
    
    //output the RED PMW signal to JA
    assign red_JA = red_LED;
    
endmodule
