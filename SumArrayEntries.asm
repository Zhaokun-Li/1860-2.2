    @R2         
    M=0         //initialize R2=0, used to store the final accumulated sum

    @R1         
    D=M         
    @END        
    D;JEQ       //if R1 is 0, jump directly to END

    @R0         
    D=M         
    @PTR        
    M=D         //PTR=R0, PTR represents the current array address being accessed

    @R1         
    D=M         
    @COUNT      
    M=D         //COUNT = R1，Indicate the remaining number of elements to be processed

(LOOP)
    @COUNT      
    D=M         
    @END        
    D;JEQ       //if COUNT is 0, it means that all elements have been processed and the jump has ended

    @PTR        
    A=M         //get the address pointed to by the current pointer PTR
    D=M         //get the value from the memory unit

    @R2         
    M=M+D       //add the current element to R2

    @PTR        
    M=M+1       //PTR pointer moves backwards, pointing to the next element

    @COUNT      
    M=M-1       //counter COUNT minus 1
    @LOOP       
    0;JMP       //jump back to LOOP and process the next element

(END)
