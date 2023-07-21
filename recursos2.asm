.MODEL SMALL
.STACK
.DATA 
    msjabrir    DB      '        A B R I E N D O   C O M P U E R T A     '
    msjFuncion  DB      '[PRESIONA ENTER PARA CONTINUAR]';31
    msj1        DB      'Favor de ingresar los recursos '
    msjcerrar   DB      '        C E R R A N D O  C O M P U E R T A       '
    msjcerrar2  DB      'Sus recursos estan a salvo     '
    opcion      DB      0,'$' 
    rastreo     db      0
    ESLOGAN     DB      'FIRULAIS SOLOVINO - EL MENSAJERO DE ESPERANZA'
    NOMBRE1     DB      'GERARDO ESPINOSA ROSAS';22   
    NOMBRE2     DB      'GADYEL JOSUE M',160,'RTINEZ G',163,'ZMAN';28
    NOMBRE3     DB      'JOS',130,' MANUEL V',160,'ZQUEZ M',130,'NDEZ';26
    MATERIA     DB      'LENGUAJEZ DE INTERFAZ';21
    MAESTRA     DB      'MA. ELENA PARRA UR',161,'AS';21
    PROYECTO    DB      'PROYECTO FINAL';14
    RENGLON        DB 0
    linea          db 80 dup(219) ;reserva 80 bytes con el caracter 219
    LOGOP       DB      10,13,10,13,10,13,'                                                       ','    ',219,219,219,219,219,219,219,'    ',10,13  
                DB      '                                                       ','  ',219,219,'       ',219,219,'  ',10,13    
                DB      '                                                       ',' ',219,'  ',219,'     ',219,'  ',219,' ',10,13      
                DB      '                                                       ',219,'  ',219,'       ',219,'  ',219,10,13
                DB      '                                                       ',219,'  ',219,' ',219,'   ',219,' ',219,'  ',219,10,13 
                DB      '                                                       ',' ',219,' ',219,'       ',219,' ',219,' ',10,13 
                DB      '                                                       ',' ',219,' ',219,'       ',219,' ',219,' ',10,13
                DB      '                                                       ','  ',219,' ',219,' ',219,219,219,' ',219,' ',219,'  ',10,13
                DB      '                                                       ','    ',219,'  ',219,'  ',219,'    ',10,13
                DB      '                                                       ','     ',219,'   ',219,'     ',10,13
                DB      '                                                       ','      ',219,219,219,'      ',10,13
                          
;***************SECCION DE MACROS*************
IMP_CAD_COLOR MACRO CADENA, LONGITUD, RENGLON, COLUMNA, MODO, COLOR, PAGINA 
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
;*********************************************
.CODE
    INICIO: MOV AX,@DATA
        MOV DS,AX 
        MOV ES,AX 
;---------------------------------------------------------        
MOV CX,25
FONDOPANTALLA2:
    PUSH CX
    IMP_CAD_COLOR linea,80,RENGLON,0,0,0FCH,0
        INT 10H        
        INC RENGLON
    POP CX
LOOP FONDOPANTALLA2
;--------------------------------------------------------- 
;==============================================================================
;ENCABEZADO ===================================================================
    IMP_CAD_COLOR LINEA,80,0,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,1,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,2,0,0,08H,0
    
    IMP_CAD_COLOR ESLOGAN,45,1,18,0,8FH,0                                         

;==============================================================================
;PIE DE PAGINA ================================================================
    IMP_CAD_COLOR LINEA,80,22,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,23,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,24,0,0,08H,0
    
    IMP_CAD_COLOR NOMBRE1,22,22,3,0,8FH,0
    IMP_CAD_COLOR PROYECTO,14,22,55,0,8FH,0 
    
    IMP_CAD_COLOR NOMBRE2,28,23,3,0,8FH,0
    IMP_CAD_COLOR MATERIA,21,23,55,0,8FH,0
    
    IMP_CAD_COLOR NOMBRE3,26,24,3,0,8FH,0
    IMP_CAD_COLOR MAESTRA,21,24,55,0,8FH,0
;==============================================================================       
        ; paso 1 imprimir MENU 
      ;IMPRIMIR LOGO
    MOV AH, 19
    LEA BP, LOGOP
    MOV CX, 794
    MOV DH, 3    ;renglon
    MOV DL, 55    ;columna
    MOV AL, 0    ;modo
    MOV BH, 0
    MOV BL, 0CFH
    INT 10H

        ;IMP_CAD_COLOR CADENA, LONGITUD, RENGLON, COLUMNA, MODO, COLOR, PAGINA
        IMP_CAD_COLOR msjabrir,48,7,0,0,0CFH,0
        IMP_CAD_COLOR msj1,31,9,10,0,0CFH,0         
        IMP_CAD_COLOR msjFuncion,31,12,9,0,0CFH,0
        
        
        
        
        MOV AH,2 ;cursor
        MOV DH,20 ;renglon
        MOV DL,90 ;columna
        MOV BH,0  ;pagina
        INT 10H   
            MOV AH,0
            INT 16H
            MOV rastreo,AH ;RECUPERAR        
        CMP rastreo,1CH
        IMP_CAD_COLOR msjcerrar,49,14,0,0,0CFH,0
        IMP_CAD_COLOR msjcerrar2,31,16,10,0,0CFH,0
        JE Ventanarecursos
        
Ventanarecursos:
    JMP fin    
        
;---------------------------------------------------------------------
           
FIN: MOV AX,4C00H
     INT 21H
END