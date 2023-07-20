;***********************************************
;   Nombre del proyecto:
;   FIRULAIS SOLOVINO
;   
;   Integrantes:
;   1. Gadyel Josue Mart�nez Guzm�n
;   2. Gerardo Espinosa Rosas
;   3. Jose Manuel Vazquez Mendez
;   Presenta:
;   
;-------------------------------------------------------------
;FASE 1. MAQUETADO de SOFTWARE           -Fecha 13 julio 2023-
;------------------------------------------------------------- 
;INSTRUCCIONES:
;   1.  Definir una paleta de colores, m�ximo 3 colores
;       cada pantalla, deber� estar alineada a la paleta
;       de colores.
;   2.  Por equipo, definir un logotipo. Debe ser original.
;   3.  Cada pantalla deber� tener el logotipo, un encabezado
;       y un pie de p�gina.
;   4.  Cada pantalla deber� tener un fondo de alg�n caracter.
;   5.  Definir el men�, pantalla login, pantalla <1>.
;**************************************************************
.MODEL SMALL           
.STACK
.DATA 
    LINEA       DB      80  DUP(219)
    RENGLON     DB      0    
    ESLOGAN     DB      'FIRULAIS SOLOVINO - EL MENSAJERO DE ESPERANZA'
    NOMBRE1     DB      'GERARDO ESPINOSA ROSAS';22   
    NOMBRE2     DB      'GADYEL JOSUE M',160,'RTINEZ G',162,'ZMAN';28
    NOMBRE3     DB      'JOS',130,' MANUEL V',160,'ZQUEZ M',130,'NDEZ';26
    MATERIA     DB      'LENGUAJEZ DE INTERFAZ';21
    MAESTRA     DB      'MA. ELENA PARRA UR',161,'AS';21
    PROYECTO    DB      'PROYECTO FINAL';14  
    
    LOGOP       DB      10,13,'                                                       ','    ',219,219,219,219,219,219,219,'    ',10,13  
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
    
    
    
    PREGUNTARMENSAJE    DB  'DESEA MANDAR UN MENSAJE? ';25
    OPCMSJ1             DB  '1. SI' ;5
    OPCMSJ2             DB  '2. NO' ;5
    RESMSJ              DB  'RESPUESTA: _' ;11 
    PEDIRMSJ            DB  'ESCRIBA SU MENSAJE: ';20
    ESPACIOMSJ          DB  '___________________________________';70
    MENSAJE             DB  36,0,37 DUP('$')
    MENSAJE2            DB  36,0,37 DUP('$')
    MSJDENUEZ           DB  '1. MENSAJE LISTO            ';28                           
    MSJDENUEZ2          DB  '2. ESCRIBIR MENSAJE DE NUEVO';28
    MSJDESTINATARIO     DB  'DESTINATARIO: ' ;14
    DESTINATARIO        DB  11,0,12 DUP('$')
    R                   DB  0
    
;==============================================================================
;================= MACROS =====================================================                           
;==============================================================================  
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
IMP_CAD_COLOR ENDM 

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

ENCABEZADO_FOOTER MACRO
    IMP_CAD_COLOR LINEA,80,0,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,1,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,2,0,0,08H,0
    
    IMP_CAD_COLOR ESLOGAN,45,1,18,0,8FH,0
    
    IMP_CAD_COLOR LINEA,80,22,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,23,0,0,08H,0
    IMP_CAD_COLOR LINEA,80,24,0,0,08H,0
    
    IMP_CAD_COLOR NOMBRE1,22,22,3,0,8FH,0
    IMP_CAD_COLOR PROYECTO,14,22,55,0,8FH,0 
    
    IMP_CAD_COLOR NOMBRE2,28,23,3,0,8FH,0
    IMP_CAD_COLOR MATERIA,21,23,55,0,8FH,0
    
    IMP_CAD_COLOR NOMBRE3,26,24,3,0,8FH,0
    IMP_CAD_COLOR MAESTRA,21,24,55,0,8FH,0
        
ENCABEZADO_FOOTER ENDM 
;================================================================================

.CODE
INICIO:
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

;=====================================================================================
;PINTAR EL FONDO DE PANTALLA DE LA PAGINA 2 ==========================================    
    MOV CX,25
    
FONDOPANTALLA2:
    PUSH CX
    IMP_CAD_COLOR LINEA,80,RENGLON,0,0,0FCH,0
        INT 10H        
        INC RENGLON
    POP CX
LOOP FONDOPANTALLA2

    ENCABEZADO_FOOTER 

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
;==============================================================================
; OPCION MANDAR MENSAJE =======================================================

    IMP_CAD_COLOR PREGUNTARMENSAJE, 25, 4, 10, 0, 0CFH, 0
    IMP_CAD_COLOR OPCMSJ1, 5, 5, 10, 0, 0CFH, 0
    IMP_CAD_COLOR OPCMSJ2, 5, 6, 10, 0, 0CFH, 0 

RESPUESTA1:             
    IMP_CAD_COLOR RESMSJ, 12, 7, 10, 0, 0CFH, 0
    CURSOR 7,21,0 ;AGREGAR 11 A LA COLUMNA
    MOV AH,1
    INT 21H
    
    MOV R,AL 
    CMP AL,'1'
    JE ESCRIBIRMENSAJE
    CMP AL,'2'
    JE FIN
    JMP RESPUESTA1
    
ESCRIBIRMENSAJE:
    IMP_CAD_COLOR PEDIRMSJ, 20, 9, 13, 0, 0CFH, 0
    IMP_CAD_COLOR ESPACIOMSJ, 35, 11, 13, 0, 0CFH, 0
    IMP_CAD_COLOR ESPACIOMSJ, 35, 13, 13, 0, 0CFH, 0
    
    ;ESCRIBIR EL MENSAJE
    CURSOR 11,13,0
    LEER_CADENA MENSAJE
    CURSOR 13,13,0
    LEER_CADENA MENSAJE
    
    IMP_CAD_COLOR MSJDENUEZ, 28, 15, 10, 0, 0CFH, 0 
    IMP_CAD_COLOR MSJDENUEZ2, 28, 16, 10, 0, 0CFH, 0                                         

MENSAJENUEZ:    
    IMP_CAD_COLOR RESMSJ, 12, 17, 10, 0, 0CFH, 0
    CURSOR 17,21,0 ;SUMAR 11
        MOV AH,1
        INT 21H
    
    MOV R,AL
    CMP R,'1'
    JE PREGUNTARDESTINATARIO
    CMP R,'2'
    JE ESCRIBIRMENSAJE
    JMP MENSAJENUEZ
    
PREGUNTARDESTINATARIO:
    IMP_CAD_COLOR MSJDESTINATARIO, 14, 19, 10, 0, 0CFH, 0
    CURSOR 19,24,0
    LEER_CADENA DESTINATARIO
        

FIN:
        MOV AX, 4C00H
        INT 21H
END











       