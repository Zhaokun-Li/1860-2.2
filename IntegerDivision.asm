    @R4         
    M=0        //R4=0, indicating no default division by 0 error
    @R5
    M=0        //R5=0, used to record the dividend symbol
    @R6
    M=1        //R6=1，used to mark whether negative results are required  

    @R1         
    D=M
    @DIV_ZERO
    D;JEQ      //if R1==0, jump to divide by 0 processing 

    @R2
    M=0        //R2=quotient
    @R3
    M=0        //R3=remainder 

    @R0
    D=M         
    @X_COPY
    M=D        //X_COPY=dividend 

    @R1
    D=M         
    @Y_COPY
    M=D        //Y_COPY=divisor 

    @X_COPY
    D=M
    @NEG_X
    D;JLT      //if X_COPY<0, jump to handle negative numbers 

    @Y_COPY
    D=M
    @NEG_Y
    D;JLT      //If Y_COPY<0, jump to handle negative numbers 

(LOOP)
    @X_COPY
    D=M
    @Y_COPY
    D=D-M       
    @DONE
    D;JLT      //If X_COPY-Y_COPY<0, it means the division is complete 

    @X_COPY
    M=D        //Update X_COPY=X_COPY-Y_COPY 

    @R2
    M=M+1      //quotient add 1
    @LOOP
    0;JMP      //back to loop 

(DONE)
    @X_COPY
    D=M
    @R3
    M=D        //R3=remainder
    @R5
    D=M
    @NEG_Q
    D;JLT      //if the original dividend is negative, the result should be negative   

    @MID
    0;JMP       

(NEG_X)
    @X_COPY
    M=-M       //take negative
    @R5
    M=M-1      //mark as negative divisor
    @R6
    M=M-1      //need to take a negative result    
    @LOOP
    0;JMP       

(NEG_Y)
    @Y_COPY
    M=-M       //take negative
    @R6
    M=M-1      //need to take a negative result   
    @LOOP
    0;JMP

(NEG_Q)
    @R3
    M=-M       //take the remainder as negative
    
    @MID
    0;JMP

(MID)
    @R6
    D=M
    @NEG_M
    D;JEQ      //if need to take a negative quotient, jump
    @END
    0;JMP

(NEG_M)
    @R2
    M=-M
    @END
    0;JMP
      

(DIV_ZERO)
    @R4
    M=1         //Set divide by 0 error flag  
    @END
    0;JMP       

(END)
