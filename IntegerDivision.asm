    @R4
    M=0        

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

    @X_SIGN
    M=1         
    @X_COPY
    D=M
    @POS_X
    D;JGE       
    @X_SIGN
    M=-1        
    @X_COPY
    M=-M        

(POS_X)
    @Y_SIGN
    M=1         
    @Y_COPY
    D=M
    @POS_Y
    D;JGE       
    @Y_SIGN
    M=-1        
    @Y_COPY
    M=-M        

(POS_Y)
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

    @X_SIGN
    D=M
    @Y_SIGN
    D=D*M
    @R2
    M=D*M        

    @X_SIGN
    D=M
    @R3
    M=D*M        

    @END
    0;JMP       

(NEG_X)
    @X_COPY
    M=-M        
    @LOOP
    0;JMP       

(NEG_Y)
    @Y_COPY
    M=-M        
    @LOOP
    0;JMP       

(DIV_ZERO)
    @R4
    M=1         
    @END
    0;JMP       

(END)
