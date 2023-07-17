 .MODEL SMALL
.STACK
.DATA
    LINEA           DB      80  DUP(219)
    MSJUSUARIO      DB  "USUARIO:       "  
    MSJCONTRASE�A   DB  "CONTRASE",165,"A:    "    
    USUARIO         DB  "  FIRULAIS"
    CONTRASE�A      DB  "  SOLOVINO" 
    USUARIOC        DB  9, 0, 9 DUP(36)
    CONTRASE�AC     DB  9, 0, 9 DUP(36)
    USUARIOINC      DB  "Ha introducido un usuario incorrecto";36
    USUARIOCOR      DB  "Usuario correcto                    ";36 
    CONTRASE�ACOR   DB  "Contrase",164,"a correcta                     ";40
    CONTRASE�AINC   DB  "Ha introducido una contrase",164,"a incorrecta";40
    RENGLON         DB  0
    CONTADOR        DB  0
    LOGOG           DB  10,13,10,13,'                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,'                 ',219,219,219,219,'                                  ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,'                 ',219,219,219,219,'                                  ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,'                                   ',219,219,219,219,'                ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,'                                   ',219,219,219,219,'                ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                    ',219,219,219,219,'                 ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
                    DB  '                                                                               ',10,13
                    DB  '                                                                               ',10,13

LEER_CADENA MACRO CADENA
    MOV AH, 10
    LEA DX, CADENA
    INT 21H
LEER_CADENA ENDM

CURSOR MACRO    RENGLON, COLUMNA, PAGINA
    MOV AH, 2
    MOV DH, RENGLON
    MOV DL, COLUMNA
    MOV BH, PAGINA
    INT 10H
CURSOR ENDM

IMP_CAD_COLOR   MACRO   CADENA, LONGITUD, RENGLON, COLUMNA, MODO, COLOR, PAGINA
    MOV AH, 19
    LEA BP, CADENA 
    MOV CX, LONGITUD
    MOV DH, RENGLON
    MOV DL, COLUMNA
    MOV AL, MODO
    MOV BL, COLOR
    MOV BH, PAGINA
    INT 10H
IMP_CAD_COLOR   ENDM

.CODE

LOGIN:
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

MOV CX,25
FONDOLOGIN:
    PUSH CX
    IMP_CAD_COLOR LINEA,80,RENGLON,0,0,8FH,0
        INT 10H        
        INC RENGLON
    POP CX
LOOP FONDOLOGIN

LOGO_LOGIN:
    MOV AH,19
    LEA BP,LOGOG
    MOV CX,1360
    MOV DH,0    ;renglon
    MOV DL,0    ;columna
    MOV AL,0    ;modo
    MOV BH,0
    MOV BL,0F8H
    INT 10H

USUARIO_INICIO:
IMP_CAD_COLOR   MSJUSUARIO, 15, 20, 30, 0, 0F8H, 0

CURSOR 20, 46, 0
LEER_CADENA USUARIOC

MOV CONTADOR, 0
MOV CX, 8
MOV SI, 2
COMPARAR_USUARIO:
    MOV AL, USUARIOC[SI]
    MOV BL, USUARIO[SI]
    CMP AL, BL
    JE CMP_USUARIOCOR
    JMP CMP_USUARIOINC
    
CMP_USUARIOCOR:
    INC CONTADOR
    INC SI    
    LOOP COMPARAR_USUARIO
    JMP FIN_COMPARAR_USUARIO
    
CMP_USUARIOINC:
    INC SI
    LOOP COMPARAR_USUARIO
    JMP FIN_COMPARAR_USUARIO
    
FIN_COMPARAR_USUARIO:
    CMP CONTADOR, 8
    JE  USUARIOCORRECTO
    JMP USUARIOINCORRECTO
    
    
USUARIOCORRECTO: 
    IMP_CAD_COLOR USUARIOCOR, 36, 21, 30, 0, 0F8H, 0
    JMP CONTRASE�A_INICIO

USUARIOINCORRECTO:
    IMP_CAD_COLOR   USUARIOINC, 36, 21, 30, 0, 0FCH, 0
    JMP USUARIO_INICIO

;**********     CONTRASE�AC      ***********
CONTRASE�A_INICIO:
IMP_CAD_COLOR   MSJCONTRASE�A, 15, 22, 30, 0, 0F8H, 0

CURSOR 22, 46, 0

LEER_CADENA CONTRASE�AC

MOV CX, 8
MOV SI, 2
MOV AX, 0
MOV BX, 0
MOV CONTADOR, 0
COMPARAR_CONTRASE�A:
    MOV AL, CONTRASE�AC[SI]
    MOV BL, CONTRASE�A[SI]
    CMP AL, BL
    JE CMP_CONTRASE�ACOR
    JMP CMP_CONTRASE�AINC
    
CMP_CONTRASE�ACOR:
    INC CONTADOR
    INC SI    
    LOOP COMPARAR_CONTRASE�A
    JMP FIN_COMPARAR_CONTRASE�A
    
CMP_CONTRASE�AINC:
    INC SI
    LOOP COMPARAR_CONTRASE�A
    JMP FIN_COMPARAR_CONTRASE�A
    
FIN_COMPARAR_CONTRASE�A:
    CMP CONTADOR, 8
    JE  CONTRASE�ACORRECTA
    JMP CONTRASE�AINCORRECTA
    
    
CONTRASE�ACORRECTA: 
    IMP_CAD_COLOR CONTRASE�ACOR, 40, 23, 30, 0, 0F8H, 0
    JMP FIN                           

CONTRASE�AINCORRECTA:
    IMP_CAD_COLOR   CONTRASE�AINC, 40, 23, 30, 0, 0FCH, 0
    JMP CONTRASE�A_INICIO



FIN:
    MOV AX, 4C00H
    INT 21H


END