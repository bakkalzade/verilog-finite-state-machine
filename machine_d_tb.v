`timescale 1ns / 1ps


module machine_d_tb();
    reg clk,rst,x;
    wire F; 
  

    machine_d uut(.rst(rst), .clk(clk), .x(x), .F(F));


    initial begin
        clk= 0;
        forever begin
            #5;
            clk=~clk;
         end
    end

    initial begin
        x=0;
        rst = 1; #15;
        rst = 0; #10;
        x = 0;
        x =0; #10;
        x=1; #10;
        x=0; #10;
        x=0; #10;
        x=0; #10
        x=1; #10
        x=1; #10
        x=1; #10
        x=0; #10
        x=0; #10
        x=0; #10
        x=1; #10
        x=1; #10
        x=0; #10
        x=0; #10
        rst = 1; #10; 
        rst = 0; #10;
        x=1; #10
        x=0; #10
        x=1; #10
        x=0; #10
        x=1; #10
        x=1; #10

        $finish;

    end
endmodule