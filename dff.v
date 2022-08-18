`timescale 1ns / 1ps
module dff (input d,  
              input rst,  
              input clk,  
              output reg q);  
  
   
always @(posedge clk or posedge rst) 
    begin
         if(rst==1'b1)
             q <= 3'b000; 
         else 
             q <= d; 
    end 
endmodule  


