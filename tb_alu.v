`timescale 1ns / 1ps
module alu_tb();

    reg  [3:0] SrcA;
    reg  [3:0] SrcB;
    reg  [1:0]  ALUcontrol;

    wire [3:0] ALUresult;
    wire [3:0]  ALUflags;

    ALU dut (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUcontrol(ALUcontrol),
        .ALUresult(ALUresult),
        .ALUflags(ALUflags)
    );

    initial begin
       
        SrcA = 4'b0;
        SrcB = 4'b0;
        ALUcontrol = 2'b00;
        #10;

        // AND operation
        SrcA = 4'b1000;
        SrcB = 4'b1010;
        ALUcontrol = 2'b00;
        #10;

        // OR operation
        SrcA = 4'b1000;
        SrcB = 4'b1100;
        ALUcontrol = 2'b01;
        #10;

        // ADD operation (no carry)
        SrcA = 4'b1011;
        SrcB = 4'b0100;
        ALUcontrol = 2'b10;
        #10;

        // ADD operation (with carry)
        SrcA = 4'b1111;
        SrcB = 4'b0001;
        ALUcontrol = 2'b10;
        #10;

        // ADD overflow case
        SrcA = 4'b0111;
        SrcB = 4'b0001;
        ALUcontrol = 2'b10;
        #10;

        // SUB operation (positive result)
        SrcA = 4'b1100;
        SrcB = 4'b1000;
        ALUcontrol = 2'b11;
        #10;

        // SUB operation (negative result)
        SrcA = 4'b1100;
        SrcB = 4'b1111;
        ALUcontrol = 2'b11;
        #10;

        // Zero result 
        SrcA = 4'b0110;
        SrcB = 4'b0110;
        ALUcontrol = 2'b11;
        #10;
        
        $stop;
    end

endmodule