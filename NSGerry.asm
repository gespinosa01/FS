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
    LINEA       DB      80  DUP(219)
    RENGLON     DB      0    
    ESLOGAN     DB      'FIRULAIS SOLOVINO - EL MENSAJERO DE ESPERANZA'
    NOMBRE1     DB      'GERARDO ESPINOSA ROSAS';22   
    NOMBRE2     DB      'GADYEL JOSUE M',160,'RTINEZ G',162,'ZMAN';28
    NOMBRE3     DB      'JOS',130,' MANUEL V',160,'ZQUEZ M',130,'NDEZ';26
    MATERIA     DB      'LENGUAJEZ DE INTERFAZ';21
    MAESTRA     DB      'MA. ELENA PARRA UR',161,'AS';21
    PROYECTO    DB      'PROYECTO FINAL';14
;==============================================================================
;================= MACROS =====================================================                           
;==============================================================================
;  
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

FIN:
        MOV AX, 4C00H
        INT 21H
END











       