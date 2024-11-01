`timescale 1ns / 1ns

module control(
		input [5:0] instruction,
		output reg [1:0] ALUOp,
		output reg MemRead,
		output reg MemtoReg,
		output reg RegDst,
		output reg Branch, 
		output reg BNE, 
		output reg ALUSrc,
		output reg MemWrite,
		output reg RegWrite,
		output reg jump,
		output reg lui
		);


always @(*) begin
		if (instruction == 6'b00_0000) begin				//RType
		ALUOp = 2'b00;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b1;
      Branch = 1'b0;	
      BNE = 1'b0; 	
	   ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		jump = 1'b0;
		lui = 1'b0;
		
		end else if (instruction == 6'b00_0100) begin   //branch
		ALUOp = 2'b01;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
      Branch = 1'b1;
      BNE = 1'b0; 			
	   ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		jump = 1'b0;
		lui = 1'b0;
		
		end else if (instruction == 6'b10_1011) begin   // sw
		ALUOp = 2'b10;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
      Branch = 1'b0;
      BNE = 1'b0; 			
	   ALUSrc = 1'b1;
		MemWrite = 1'b1;
		RegWrite = 1'b0;
		jump = 1'b0;
		lui = 1'b0;
		
		end else if (instruction == 6'b10_0011) begin   // lw
		ALUOp = 2'b10;
		MemRead = 1'b1;
		MemtoReg = 1'b1;
		RegDst = 1'b0;
      Branch = 1'b0;
      BNE = 1'b0; 			
	   ALUSrc = 1'b1;
		MemWrite = 1'b0;
		RegWrite = 1'b1;
		jump = 1'b0;
		lui = 1'b0;
		
		end else if (instruction == 6'b00_1000) begin //addi 
		ALUOp = 2'b10; //add for I-Type
        MemRead = 1'b0;
        MemtoReg = 1'b0;
        RegDst = 1'b0; //set to 0 since using immidiate (I-Type) 
        Branch = 1'b0;
        BNE = 1'b0; 	
        ALUSrc = 1'b1; //force ALU to take immidiate as input 
        MemWrite = 1'b0;
        RegWrite = 1'b1; //write back to register
        jump = 1'b0;
        lui = 1'b0;
        
        end else if (instruction == 6'b00_0010) begin //j
        ALUOp = 2'b11;
        MemRead = 1'b0;
        MemtoReg = 1'b0;
        RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0; 	
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        jump = 1'b1;
        lui = 1'b0;
        
        end else if (instruction == 6'b00_0101) begin  // BNE
        ALUOp = 2'b01;
        MemRead = 1'b0;
        MemtoReg = 1'b0;
        RegDst = 1'b0;
        Branch = 1'b1;
        BNE = 1'b1; 
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        jump = 1'b0;
        lui = 1'b0;
        
        end else if (instruction == 6'b00_1111) begin //lui
        ALUOp = 2'b10;
        MemRead = 1'b0;
        MemtoReg = 1'b0;
        RegDst = 1'b0;
        Branch = 1'b0;
        BNE = 1'b0;
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        RegWrite = 1'b1;
        jump = 1'b0;
        lui = 1'b1;
        
		end else begin
		ALUOp = 2'b00;
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
        Branch = 1'b0;		
	    ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		jump = 1'b0;
		lui = 1'b0;
		end
	
	
end
endmodule
