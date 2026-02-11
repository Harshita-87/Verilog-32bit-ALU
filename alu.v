`timescale 1ns / 1ps

module ALU(
    input [3:0] SrcA,
    input [3:0] SrcB,
    input [1:0] ALUcontrol,
    output reg [3:0] ALUresult,
    output reg [3:0] ALUflags
    );
    always@(*)begin
       case(ALUcontrol)
         2'b00: begin //AND operation
            ALUresult = SrcA & SrcB;
            ALUflags[2] = 0;
            ALUflags[3] = 0;
            ALUflags[0] = (ALUresult == 4'b0) ? 1'b1 : 1'b0;
            ALUflags[1] = ALUresult[3];
         end
         2'b01: begin //OR operation
            ALUresult = SrcA | SrcB;
            ALUflags[2] = 0;
            ALUflags[3] = 0;
            ALUflags[0] = (ALUresult == 4'b0) ? 1'b1 : 1'b0;
            ALUflags[1] = ALUresult[3];
         end
         2'b10: begin //ADD operation
            {ALUflags[3], ALUresult} = SrcA + SrcB; //concatenation to include carry o/p
            ALUflags[2] = (SrcA[3] == SrcB[3]) && (ALUresult[3] != SrcA[3]);
            ALUflags[0] = (ALUresult == 4'b0) ? 1'b1 : 1'b0;
            ALUflags[1] = ALUresult[3];
         end
         2'b11: begin //SUB operation
            {ALUflags[3], ALUresult} = SrcA - SrcB; //concatenation to include carry o/p
            ALUflags[2] = (SrcA[3] != SrcB[3]) && (ALUresult[3] != SrcA[3]);
            ALUflags[0] = (ALUresult == 4'b0) ? 1'b1 : 1'b0;
            ALUflags[1] = ALUresult[3];
         end
         default: begin
            ALUresult = 4'b0;
            ALUflags[3] = 0;
            ALUflags[2] = 0;
            ALUflags[0] = (ALUresult == 4'b0) ? 1'b1 : 1'b0;
            ALUflags[1] = ALUresult[3];
         end 
       endcase
    end
    
endmodule