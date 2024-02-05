`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 03:51:28 PM
// Design Name: 
// Module Name: RGB_Driver
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


module RGB_Driver#(parameter R= 8)(
         input clk,
         input reset,
         input [R :0 ] red_duty , green_duty , blue_duty,
         output red_LED , green_LED , blue_LED 
    ); 
    
    
    localparam timer_bits = 8;
    localparam final_value =195;   //control PWM switching frequency 
    
    //red
    PWM_improved #(.R(R) , .timer_bits(timer_bits)) RED(
    .clk(clk),
    .reset(reset),
    .duty(red_duty),
    .final_value(final_value),
    .pwm_out(red_LED)
    );
    
      //green 
     PWM_improved #(.R(R) , .timer_bits(timer_bits)) Green(
     .clk(clk),
     .reset(reset),
     .duty(green_duty),
     .final_value(final_value),
     .pwm_out(green_LED)
     );
     
       //blue
      PWM_improved #(.R(R) , .timer_bits(timer_bits)) Blue(
      .clk(clk),
      .reset(reset),
      .duty(blue_duty),
      .final_value(final_value),
      .pwm_out(blue_LED)
      ); 
    
    
endmodule
