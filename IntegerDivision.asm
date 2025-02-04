    @R4         
    M=0
    @R5
    M=0
    @R6
    M=1          

    @R1         
    D=M
    @DIV_ZERO
    D;JEQ       

    @R2
    M=0         
    @R3
    M=0         

    @R0
    D=M         
    @X_COPY
    M=D         

    @R1
    D=M         
    @Y_COPY
    M=D         

    @X_COPY
    D=M
    @NEG_X
    D;JLT       

    @Y_COPY
    D=M
    @NEG_Y
    D;JLT       

(LOOP)
    @X_COPY
    D=M
    @Y_COPY
    D=D-M       
    @DONE
    D;JLT       

    @X_COPY
    M=D         

    @R2
    M=M+1       
    @LOOP
    0;JMP       

(DONE)
    @X_COPY
    D=M
    @R3
    M=D
    @R5
    D=M
    @NEG_Q
    D;JLT         

    @END
    0;JMP       

(NEG_X)
    @X_COPY
    M=-M
    @R5
    M=M-1
    @R6
    M=M-1          
    @LOOP
    0;JMP       

(NEG_Y)
    @Y_COPY
    M=-M
    @R6
    M=M-1        
    @LOOP
    0;JMP

(NEG_Q)
    @R3
    M=-M
    
    @MID
    0;JMP

(MID)
    @R6
    D=M
    @NEG_M
    D;JLT
    @END
    0;JMP

(NEG_M)
    @R2
    M=-M
    @END
    0;JMP
      

(DIV_ZERO)
    @R4
    M=1         
    @END
    0;JMP       

(END)
