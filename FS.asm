;-------------------------------------------------------------------------------------
; FIRULAIS SOLOVINO
; 
; Integrantes:
; 1. Gerardo Esinosa Rosas
; 2. Gadyel Josue Martinez Guzman
; 3. Jose Manuel Vazquez Mendez
; 
; PRESENTA:
;   XXXX
;-------------------------------------------------------------------------------------
; Fase 1. MAQUETADO DE SOFTWARE
;-------------------------------------------------------------------------------------
; INSTRUCCIONES
; 1. Definir una paleta de colores, maximo 3 colores 
;    Cada pantalla, debera estar alineana a la paleta de colores
; 2. Por equipo, definir un logotipo, Debe ser original.
; 3. Cada pantalla deberá tener el logotipo, un encabezado y un pie de pagina
; 4. Cada pantalla deberá tener un fondo de algun caracter.
; 5. Definir el menú, pantalla login, pantalla <1> 
;-------------------------------------------------------------------------------------

.MODEL SMALL
.STACK
.DATA
    linea               db      80 dup(219)
    renglon             db      0
    usuario             db      'USUARIO:       '  
    contraseña          db      'CONTRASE',164,'A:    '
    encabezado          db      'LA RESISTENCIA SOBREVIVE'
.CODE

INICIO:
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    ;INICIO DE CÓDIGO =/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/    
    ;===========FONDO DE PANTALLA=================================================================
    MOV CX,25
    ;JMP COMIENZO
CICLOLINEA:
    PUSH CX
    
    MOV AH,19
    LEA BP,LINEA;CADENA
    MOV CX,80;LONGITUD
    MOV DH,RENGLON;RENGLON
    MOV DL,0;COLUMNA
    MOV BH,0;PAGINA     
    MOV AL,0          ;MODO
    MOV BL,8H;COLOR NEGRO DE FONDO
    INT 10H
    
    INC RENGLON
    POP CX
    LOOP CICLOLINEA
    ;=================================================================================
    ;===========LOGIN=================================================================
    MOV AH,19
    LEA BP,USUARIO
    MOV CX,15
    MOV DH,20
    MOV DL,30
    MOV BH,0
    MOV AL,0
    MOV BL,8FH
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
    MOV BL,8FH
    INT 10H
    
    MOV AH,2            ; ESCRIBIR LA CONTRASEÑA
    MOV DH,21
    MOV DL,46
    MOV BH,0
    INT 10H
        MOV AH, 1
        INT 21H    
    
    MOV AX,4C00H
    INT 21H
    
    
