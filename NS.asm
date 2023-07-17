;***********************************************
;   Nombre del proyecto:
;   FIRULAIS SOLOVINO
;   
;   Integrantes:
;   1. Gadyel Josue Martínez Guzmán
;   2. Gerardo Espinosa Rosas
;   3. Jose Manuel Vazquez Mendez
;   Presenta:
;   
;-------------------------------------------------------------
;FASE 1. MAQUETADO de SOFTWARE           -Fecha 13 julio 2023-
;------------------------------------------------------------- 
;INSTRUCCIONES:
;   1.  Definir una paleta de colores, máximo 3 colores
;       cada pantalla, deberá estar alineada a la paleta
;       de colores.
;   2.  Por equipo, definir un logotipo. Debe ser original.
;   3.  Cada pantalla deberá tener el logotipo, un encabezado
;       y un pie de página.
;   4.  Cada pantalla deberá tener un fondo de algún caracter.
;   5.  Definir el menú, pantalla login, pantalla <1>.
;**************************************************************
.MODEL SMALL           
.STACK
.DATA 
;==============================================================================
;                       MACROS                           
;==============================================================================
;  
Imprime_cad_color MACRO CADENA, LONGITUD, RENGLON, COLUMNA, MODO, COLOR, PAGINA 
    MOV AH,19
    LEA BP,CADENA
    MOV CX,LONGITUD
    MOV DH,RENGLON
    MOV DL,COLUMNA
    MOV AL,MODO
    MOV BL,COLOR
    MOV BH,PAGINA
    INT 10H    
Imprime_cad_color ENDM 

CURSOR MACRO RENGLON,COLUMNA,PAGINA
    MOV AH,2
    MOV DH,RENGLON
    MOV DL,COLUMNA,
    MOV BH,PAGINA
    INT 10H
CURSOR ENDM 

LEER_CADENA MACRO CADENA 
    MOV AH,10
    LEA DX,CADENA
    INT 21H
LEER_CADENA ENDM
;================================================================================
LINEA       DB      80  DUP(219)
OP1         DB      '1. Entregar un mensaje    '
OP2         DB      '2. Entregar suministros   '
OP3         DB      '3. Encender sensor termico'    
OPCION      DB      'OPCION[   ]               '
USUARIO     DB      'USUARIO:       '  
CONTRASEÑA  DB      'CONTRASE',165,'A:    '
ENCABEZADO1 DB      'FUNCIONES DE FIRULAIS' ;21
ENCABEZADO2 DB      'ENTREGAR UN MENSAJE  ' ;21
LOGOP       DB      10,13,'                         ',219,219,219,219,219,219,219,219,219,219,219,219,'   ',219,219,219,219,219,219,219,219,219,219,10,13   
            DB      '                         ',219,219,219,'          ',219,219,'          ',10,13            
            DB      '                         ',219,219,219,219,219,219,219,219,219,219,'     ',219,219,219,219,219,219,219,'   ',10,13      
            DB      '                         ',219,219,219,'                   ',219,219,219,10,13   
            DB      '                         ',219,219,219,'          ',219,219,219,219,219,219,219,219,219,'     ',10,13


LOGOG       db 10,13,10,13,'                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,'                 ',219,219,219,219,'                                  ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,'                 ',219,219,219,219,'                                  ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'        ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,'                                   ',219,219,219,219,'                ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,'                                   ',219,219,219,219,'                ',10,13
            db '                                                                               ',10,13
            db '                    ',219,219,219,219,'                 ',219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,'                   ',10,13
            db '                                                                               ',10,13
            db '                                                                               ',10,13

RENGLON     DB      0
OP          DB      0  

.CODE
INICIO:
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

;=================================================================================
;===========LOGIN=================================================================    
MOV CX,25
CICLOLINEALOGIN:
    PUSH CX
        MOV AH,19
        LEA BP,LINEA    ;CADENA
        MOV CX,80       ;LONGITUD
        MOV DH,RENGLON  ;RENGLON
        MOV DL,0        ;COLUMNA
        MOV BH,0        ;PAGINA     
        MOV AL,0        ;MODO
        MOV BL,8FH
        INT 10H        
        INC RENGLON
    POP CX
LOOP CICLOLINEALOGIN

        MOV AH,19
        LEA BP,LOGOG
        MOV CX,1360
        MOV DH,0    ;renglon
        MOV DL,0    ;columna
        MOV AL,0    ;modo
        MOV BH,0
        MOV BL,0F8H
        INT 10H
  
    MOV AH,19
    LEA BP,USUARIO
    MOV CX,15
    MOV DH,20
    MOV DL,30
    MOV BH,0
    MOV AL,0
    MOV BL,0F8H
    INT 10H
    
    
    MOV AH,2         ;ESCRIBIR EL USUARIO
    MOV DH,20
    MOV DL,46
    MOV BH,0
    INT 10H
        MOV AH, 1
        INT 21H
 
    MOV AH,19
    LEA BP,CONTRASEÑA
    MOV CX,15
    MOV DH,21
    MOV DL,30
    MOV BH,0
    MOV AL,0
    MOV BL,0F8H
    INT 10H
    
    MOV AH,2            ; ESCRIBIR LA CONTRASEÑA
    MOV DH,21
    MOV DL,46
    MOV BH,0
    INT 10H
        MOV AH, 1
        INT 21H 
        


;===================================================
;=======MENÚ======================================== 
MOV BX, 0
MOV AX, 0
MOV DX, 0
MOV CX, 25
CICLOLINEAMENU:
PUSH CX    
    MOV AH, 19
    LEA BP, LINEA;CADENA
    MOV CX, 80;LONGITUD
    MOV DH, RENGLON;RENGLON
    MOV DL, 0;COLUMNA
    MOV BH, 0;PAGINA     
    MOV AL, 0          ;MODO
    MOV BL, 0F0H;COLOR BLANCO DE FONDO
    INT 10H
    INC RENGLON
    POP CX
LOOP CICLOLINEAMENU

MOV AH,19
        LEA BP,LOGOP
        MOV CX,258
        MOV DH,0    ;renglon
        MOV DL,0    ;columna
        MOV AL,0    ;modo
        MOV BH,0
        MOV BL,0F8H
        INT 10H

;ENCABEZADO
MOV AH, 19
    LEA BP, ENCABEZADO1
    MOV CX, 21
    MOV DH, 0
    MOV DL, 15
    MOV BH, 0
    MOV AL, 0
    MOV BL, 0FH
    INT 10H
    
    MOV AH, 19
    LEA BP, OP1
    MOV CX, 26
    MOV DH, 17
    MOV DL, 15
    MOV BH, 0
    MOV AL, 0
    MOV BL, 0FH
    INT 10H
    
    MOV AH, 19
    LEA BP, OP2
    MOV CX, 26
    MOV DH, 18
    MOV DL, 15
    MOV BH, 0
    MOV AL, 0
    MOV BL, 0FH
    INT 10H
    
    MOV AH, 19
    LEA BP, OP3
    MOV CX, 26
    MOV DH, 19
    MOV DL, 15
    MOV BH, 0
    MOV AL, 0
    MOV BL, 0FH
    INT 10H
    
    MOV AH, 19
    LEA BP, OPCION
    MOV CX, 26
    MOV DH, 20
    MOV DL, 15
    MOV BH, 0
    MOV AL, 0
    MOV BL, 0FH
    INT 10H
    
    MOV AH, 2
    MOV DH, 20
    MOV DL, 23
    MOV BH, 0
    INT 10H   
        MOV AH, 1
        INT 21H
        MOV OP, AL
 CMP OP, 1
 JE MENSAJE
            
;===================================================
;=======MENSAJE===================================== 
 MENSAJE:
    CICLOLINEAMENSAJE:
    PUSH CX
        MOV AH,19
        LEA BP,LINEA    ;CADENA
        MOV CX,80       ;LONGITUD
        MOV DH,RENGLON  ;RENGLON
        MOV DL,0        ;COLUMNA
        MOV BH,0        ;PAGINA     
        MOV AL,0        ;MODO
        MOV BL,0F4H
        INT 10H        
        INC RENGLON
    POP CX       
    LOOP CICLOLINEAMENSAJE:                             


FIN:
        MOV AX, 4C00H
        INT 21H
END











       