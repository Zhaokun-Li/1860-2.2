    @R4
    M=0          // 设 R4 = 0，假设除法有效

    @R1
    D=M
    @DIV_ZERO
    D;JEQ       // 如果 y == 0，跳转到 DIV_ZERO

    @R2
    M=0         // 初始化商 m = 0
    @R3
    M=0         // 初始化余数 q = 0

    @R0
    D=M         
    @X_COPY
    M=D         // 复制 x 以防止修改原始值

    @R1
    D=M         
    @Y_COPY
    M=D         // 复制 y 以防止修改原始值

    @X_COPY
    D=M
    @NEG_X
    D;JLT       // 如果 x < 0，跳转到 NEG_X

    @Y_COPY
    D=M
    @NEG_Y
    D;JLT       // 如果 y < 0，跳转到 NEG_Y

    @X_SIGN
    M=1         
    @X_COPY
    D=M
    @POS_X
    D;JGE       
    @X_SIGN
    M=-1        
    @X_COPY
    M=-M        // 取 x 的绝对值

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
    M=-M        // 取 y 的绝对值

(POS_Y)
(LOOP)
    @X_COPY
    D=M
    @Y_COPY
    D=D-M       
    @DONE
    D;JLT       // 如果 x < y，跳转到 DONE

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
    M=D         // 余数 q = x

    @X_SIGN
    D=M
    @Y_SIGN
    D=D*M
    @R2
    M=D*M       // 调整商的符号

    @X_SIGN
    D=M
    @R3
    M=D*M       // 确保余数符号和 x 一致

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
    M=1         // 设标志 R4 = 1（无效除法）
    @END
    0;JMP       

(END)
