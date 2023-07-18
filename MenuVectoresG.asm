;*******************************************************
;Tema: LOOP, colores, relleno, vectores y flechas
;Guardar como: MenuVectores.asm
;
;Gadyel Josue Martínez Guzmán           VERANO 2023
;
;PARTE 1. Diseño de la interfaz
;PARTE 2. Funcionamiento    - 11 JULIO - 2023
;--------------------------TAREA------------------------
;PARTE 3. FINALIZAR EL PROGRAMA -PARA EL 18 DE JULIO DE 2023
;
;*******************************************************
.MODEL SMALL
.STACK
.DATA
    LINEA       DB  80  DUP(219)
    RENGLON     DB  0
    ;--- VARIABLES PARA DISEÑO ---
    MSJVECT     DB  ' V1     V2      V3  ';20
    MSJVEC      DB  '[ ]    [ ] = [    ] ';20
    ;--- VECTORES
    V1          DB  0,0,0,0
    V2          DB  0,0,0,0
    V3          DB  0,0,0,0,0,0,0,0
                   ;d,u,d,u,d,u,d,u     decena = d   unidad = u
    ;--- MENÚ
    MSJMENU     DB  '---MEN',163,'---' ;10
    MSJOPSUMA   DB  '1. SUMA   '       ;10
    MSJOPRESTA  DB  '2. RESTA  '       ;10
    MSJOPMUL    DB  '3. MULTIPL'       ;10
    MSJOPDIV    DB  '4. DIVISIO'       ;10
    MSJOPCION   DB  'OPCION [ ]'
    OPCION      DB  0,'$'
    

.CODE
INICIO: MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX ;SEGMENTO EXTRA PARA MANEJO DE COLOR
;-----------------LINEA--------------------------
MOV CX, 25
CICLOLINEA:
    PUSH CX
        MOV AH, 19
        LEA BP, LINEA 
        MOV CX, 80
        MOV DH, RENGLON
        MOV DL, 0
        MOV BH, 0
        MOV AL, 0
        MOV BL, 0F3H
        INT 10H           
    POP CX
    INC RENGLON    
LOOP CICLOLINEA
;------------------------------------------------                
;DISEÑO DE LA INTERFAZ
;V1
;MSJVECT
MOV AH, 19
LEA BP, MSJVECT
MOV CX, 20
MOV DH, 5
MOV DL, 30
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H
    ;MSJVEC 1
    MOV AH, 19
    LEA BP, MSJVEC
    MOV CX, 20
    MOV DH, 7
    MOV DL, 30
    MOV BH, 0
    MOV AL, 0
    MOV BL, 3FH
    INT 10H         

    ;MSJVEC 2
    MOV AH, 19
    LEA BP, MSJVEC
    MOV CX, 20
    MOV DH, 9
    MOV DL, 30
    MOV BH, 0
    MOV AL, 0
    MOV BL, 3FH
    INT 10H
    
    ;MSJVEC 3
    MOV AH, 19
    LEA BP, MSJVEC
    MOV CX, 20
    MOV DH, 11
    MOV DL, 30
    MOV BH, 0
    MOV AL, 0
    MOV BL, 3FH
    INT 10H
    
    ;MSJVEC 4
    MOV AH, 19
    LEA BP, MSJVEC
    MOV CX, 20
    MOV DH, 13
    MOV DL, 30
    MOV BH, 0
    MOV AL, 0
    MOV BL, 3FH
    INT 10H
    
;----------DESPLIEGUE DE MENÚ------------
;TITULO
MOV AH, 19
LEA BP, MSJMENU
MOV CX, 10
MOV DH, 5
MOV DL, 5
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H             
;SUMA
MOV AH, 19
LEA BP, MSJOPSUMA
MOV CX, 10
MOV DH, 7
MOV DL, 5
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H
;RESTA
MOV AH, 19
LEA BP, MSJOPRESTA
MOV CX, 10
MOV DH, 9
MOV DL, 5
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H
;MULTIPLICACION
MOV AH, 19
LEA BP, MSJOPMUL
MOV CX, 10
MOV DH, 11
MOV DL, 5
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H
;DIVISION
MOV AH, 19
LEA BP, MSJOPDIV
MOV CX, 10
MOV DH, 13
MOV DL, 5
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H
;OPCION
MOV AH, 19
LEA BP, MSJOPCION
MOV CX, 10
MOV DH, 15
MOV DL, 5
MOV BH, 0
MOV AL, 0
MOV BL, 3FH
INT 10H     
    ;========================================
    ;              FUNCIONAMIENTO
    ;========================================
CICLOTECLA:
    ;CURSOR OPCION
    MOV AH, 2
    MOV DH, 15
    MOV DL, 13
    MOV BH, 0
    INT 10H
        MOV AH, 1
        INT 21H     
        MOV OPCION, AL
    ;----- CAPTURA DE V1 Y V2 ------
    MOV CX, 4 ;4 ELEMENTOS PARA V1 Y V2
    MOV SI, 0
    MOV RENGLON, 7
CAPTURA:
    PUSH CX
      ;CURSOR
      MOV AH, 2
      MOV DH, RENGLON
      MOV DL, 31
      MOV BH, 0
      INT 10H
        MOV AH, 1 ;ESPERAR CARACTER
        INT 21H
            MOV V1[SI], AL
            SUB V1[SI], 30H
        ;---------->>>>>>
        ;CURSOR
        MOV AH, 2
        MOV DH, RENGLON
        MOV DL, 38
        MOV BH, 0
        INT 10H
        MOV AH, 1 ;ESPERAR CARACTER
        INT 21H
            MOV V2[SI], AL
            SUB V2[SI], 30H 
       ;---------->>>>>>
        INC RENGLON
        INC RENGLON
        INC SI
    POP CX
    LOOP CAPTURA
    
    ;---- SWITCH ----
    CMP OPCION, '1'
    JE SUMAR
    CMP OPCION, '2'
    JE RESTAR
    CMP OPCION, '3'
    JE MULTI
    CMP OPCION, '4'
    JE DIVI
    CMP OPCION, '.'
    JE FIN
    JMP CICLOTECLA
    
SUMAR:
; *** COLOCAR OPERADOR '+' ***
;CURSOR
MOV CX, 4
MOV RENGLON, 7
OPADD:
PUSH CX
    MOV AH, 2
    MOV DH, RENGLON
    MOV DL, 34
    MOV BH, 0
    INT 10H
    ;IMPRIMIR '+'
    MOV AH, 9
    MOV CX, 1
    MOV AL, '+'
    MOV BL, 3FH   
    INT 10H
POP CX
INC RENGLON
INC RENGLON
LOOP OPADD     

;*** SUMAR VECTORES ***
MOV CX, 4
MOV SI, 0
MOV DI, 0
CICLOSUMAR:
        MOV AX, 0 ;INICIALIZAR
        MOV BX, 0 ;INICIALIZAR
              
        MOV AL, V1[SI]
        MOV BL, V2[SI]
        ADD AL, BL
            AAA ;AH = DECENAS AL = UNIDADES
            ADD AX, 3030H ;AJUSTE ASCII
        MOV V3[DI], AH
            INC DI
        MOV V3[DI], AL
            INC DI
    INC SI
    LOOP CICLOSUMAR
JMP IMPRIMEV3

RESTAR:    
; *** COLOCAR OPERADOR '-' ***
;CURSOR
MOV CX, 4
MOV RENGLON, 7
OPSUB:
PUSH CX
    MOV AH, 2
    MOV DH, RENGLON
    MOV DL, 34
    MOV BH, 0
    INT 10H
    ;IMPRIMIR '-'
    MOV AH, 9
    MOV CX, 1
    MOV AL, '-'
    MOV BL, 3FH   
    INT 10H
POP CX
INC RENGLON
INC RENGLON
LOOP OPSUB
MOV CX, 4
MOV SI, 0
MOV DI, 0
MOV AX, 0
MOV BX, 0
MOV RENGLON, 7
;RESTAR
CICLORESTAR:
PUSH CX
    MOV AL, V1[SI]
    MOV BL, V2[SI]
    SUB AL, BL
    MOV V3[DI], 30H
    INC DI
    MOV V3[DI], AL
    
    CMP V3[DI], 0
    JL NEGATIVO
    ADD V3[DI], 30H
    INC DI
    INC SI
    INC RENGLON
    INC RENGLON
    POP CX
    LOOP CICLORESTAR
    JMP IMPRIMEV3
NEGATIVO:
    MOV AH, 2
    MOV DH, RENGLON
    MOV DL, 44
    MOV BH, 0
    INT 10H
    ;IMPRIMIR '-'
    MOV AH, 9
    MOV CX, 1
    MOV AL, '-'
    MOV BL, 3FH   
    INT 10H

    NEG V3[DI]
    ADD V3[DI], 30H
INC RENGLON
INC RENGLON
INC DI
INC SI       
POP CX
LOOP CICLORESTAR
JMP IMPRIMEV3

MULTI:      
; *** COLOCAR OPERADOR '*' ***
;CURSOR
MOV CX, 4
MOV RENGLON, 7
OPMUL:
PUSH CX
    MOV AH, 2
    MOV DH, RENGLON
    MOV DL, 34
    MOV BH, 0
    INT 10H
    ;IMPRIMIR '*'
    MOV AH, 9
    MOV CX, 1
    MOV AL, '*'
    MOV BL, 3FH   
    INT 10H
POP CX
INC RENGLON
INC RENGLON
LOOP OPMUL

MOV CX, 4
MOV SI, 0
MOV DI, 0
MOV AX, 0
MOV BX, 0
CICLOMUL:
;MULTIPLICAR
MOV AL, V1[SI]
MOV BL, V2[SI]
MUL BL
AAM
ADD AX, 3030H
MOV V3[DI], AH
INC DI
MOV V3[DI], AL
INC DI
INC SI
LOOP CICLOMUL
JMP IMPRIMEV3


DIVI:       
; *** COLOCAR OPERADOR '/' ***
;CURSOR
MOV CX, 4
MOV RENGLON, 7
OPDIV:
PUSH CX
    MOV AH, 2
    MOV DH, RENGLON
    MOV DL, 34
    MOV BH, 0
    INT 10H
    ;IMPRIMIR '/'
    MOV AH, 9
    MOV CX, 1
    MOV AL, '/'
    MOV BL, 3FH   
    INT 10H
POP CX
INC RENGLON
INC RENGLON
LOOP OPDIV


MOV BX, 0
MOV CX, 4
MOV SI, 0
MOV DI, 0
CICLODIV:
PUSH CX
    MOV AX, 0
    MOV AL, V1[SI]
    DIV V2[SI]
    ;COCIENTE
    MOV V3[DI], AL
    ADD V3[DI], 30H
    INC DI
    ;RESIDUO
    MOV V3[DI], AH
    ADD V3[DI], 30H
    INC DI  
INC SI             
POP CX
LOOP CICLODIV
JMP IMPRIMEV3

IMPRIMEV3:
        MOV DI, 0
        MOV CX, 4
        MOV RENGLON, 7
CICLOV3:
        PUSH CX
            MOV AH, 2
            MOV DH, RENGLON
            MOV DL, 45
            MOV BH, 0
            INT 10H
                MOV AH, 9 ;CARACTER CON COLOR
                MOV CX, 1
                MOV AL, V3[DI]  ;UNIDAD
                MOV BL, 3FH
                MOV BH, 0
                INT 10H
            INC DI
            MOV AH, 2
            MOV DH, RENGLON
            MOV DL, 46 ;COLUMNA
            MOV BH, 0
            INT 10H
                MOV AH, 9 ;CARACTER CON COLOR
                MOV CX, 1
                MOV AL, V3[DI]  ;DECENA
                MOV BL, 3FH
                MOV BH, 0
                INT 10H  
        INC DI
        INC RENGLON
        INC RENGLON
        POP CX
        LOOP CICLOV3
JMP CICLOTECLA




FIN:    MOV AX, 4C00H
        INT 21H

END
