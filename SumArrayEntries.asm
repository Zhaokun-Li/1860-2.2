    @R2         
    M=0         

    @R1         
    D=M         
    @END        
    D;JEQ       

    @R0         
    D=M         
    @PTR        
    M=D         

    @R1         
    D=M         
    @COUNT      
    M=D         

(LOOP)
    @COUNT      
    D=M         
    @END        
    D;JEQ       

    @PTR        
    A=M         
    D=M         

    @R2         
    M=M+D       

    @PTR        
    M=M+1       

    @COUNT      
    M=M-1       
    @LOOP       
    0;JMP       

(END)
