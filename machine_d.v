`timescale 1ns / 1ps
module machine_d(
    input x,
    input rst,  
    input clk,
    output F
    );
    
    reg [2:0] present_state = 3'b000;
    wire [2:0] next_state;
    
    dff DA(.d(present_state[2]|(present_state[1]&x)),                            //A+Bx
    .rst(rst), .clk(clk), .q(next_state[2]));
     
    dff DB(.d(((~present_state[2]&~present_state[1])&x)|(present_state[1]&~x)), //A'B'x+Bx'
    .rst(rst), .clk(clk), .q(next_state[1]));
    
    dff DC(.d((present_state[0]&x)|(~present_state[0]&~x)),                      //Cx+C'x'
    .rst(rst), .clk(clk), .q(next_state[0]));
    
    always @(rst or next_state)begin
    
        if (rst) begin present_state <= 3'b000; end 
        else begin present_state <= next_state ; end
    
    end
    
    assign F = present_state[2]&present_state[0];  
                             //AC
    
endmodule
