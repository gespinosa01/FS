.MODEL SMALL
.STACK
.DATA
    RENGLON             DB      0
    LINEA               DB      80  DUP(219)
    ESLOGAN             DB      'FIRULAIS SOLOVINO - EL MENSAJERO DE ESPERANZA'
    NOMBRE1             DB      'GERARDO ESPINOSA ROSAS';22   
    NOMBRE2             DB      'GADYEL JOSUE M',160,'RTINEZ G',163,'ZMAN';28
    NOMBRE3             DB      'JOS',130,' MANUEL V',160,'ZQUEZ M',130,'NDEZ';26
    MATERIA             DB      'LENGUAJEZ DE INTERFAZ';21
    MAESTRA             DB      'MA. ELENA PARRA UR',161,'AS';21
    PROYECTO            DB      'PROYECTO FINAL';14
    LOGOP               DB      10,13,'                                                       ','    ',219,219,219,219,219,219,219,'    ',10,13  
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
    TITULOUBICACION     DB      'INDIQUE LA UBICACI',162,'N A DONDE DESEE ENVIAR A SOLOVINO'
    MSJLATITUD          DB      'LATITUD:    ';12
    MSJLONGITUD         DB      'LONGITUD:   ';12
    LATITUDC            DB      10, 0, 10 DUP(36)
    MSJNS               DB      'NORTE[N] SUR[S]:   ';19
    NS                  DB      0
    MSJEO               DB      'ESTE[E] OESTE[O]:  ';19
    EO                  DB      0
    LONGITUDC           DB      10, 0, 10 DUP(36)
;==============================================================================
;                                   MACROS                           
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

ENCABEZADO_Y_PIE  MACRO
;********************** ENCABEZADO ******************************* 
    IMP_CAD_COLOR LINEA, 80, 0, 0, 0, 08H,0
    IMP_CAD_COLOR LINEA, 80, 1, 0, 0, 08H,0
    IMP_CAD_COLOR LINEA, 80, 2, 0, 0, 08H,0
    
    IMP_CAD_COLOR ESLOGAN, 45, 1, 18, 0, 8FH, 0                                         

;******************** FIN ENCABEZADO *****************************


;******************** PIE DE PAGINA  *****************************
    IMP_CAD_COLOR LINEA, 80, 22, 0, 0, 08H, 0
    IMP_CAD_COLOR LINEA, 80, 23, 0, 0, 08H, 0
    IMP_CAD_COLOR LINEA, 80, 24, 0, 0, 08H, 0
    
    IMP_CAD_COLOR NOMBRE1,  22, 22,  3, 0, 8FH, 0
    IMP_CAD_COLOR PROYECTO, 14, 22, 55, 0, 8FH, 0 
    
    IMP_CAD_COLOR NOMBRE2, 28, 23,  3, 0, 8FH, 0
    IMP_CAD_COLOR MATERIA, 21, 23, 55, 0, 8FH, 0
    
    IMP_CAD_COLOR NOMBRE3, 26, 24,  3, 0, 8FH, 0
    IMP_CAD_COLOR MAESTRA, 21, 24, 55, 0, 8FH, 0
;******************* FIN PIE DE PAGINA ***************************
ENCABEZADO_Y_PIE ENDM
;============================================================
;                               CODE
;============================================================  
.CODE
;============================================================
;                           UBICACION    
;============================================================
UBICACION:
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX


MOV CX,25
MOV RENGLON, 0
FONDOUBICACION:
    PUSH CX
    IMP_CAD_COLOR LINEA, 80, RENGLON, 0, 0, 00FH, 0
        INT 10H        
        INC RENGLON
    POP CX   
LOOP FONDOUBICACION

ENCABEZADO_Y_PIE        

IMP_CAD_COLOR  TITULOUBICACION, 52, 4, 15, 0, 0F0H, 0    


;IMPRIMIR LOGO
    MOV AH, 19
    LEA BP, LOGOP
    MOV CX, 794
    MOV DH, 8    ;renglon
    MOV DL, 0    ;columna
    MOV AL, 0    ;modo
    MOV BH, 0
    MOV BL, 0F0H
    INT 10H    

;LONGITUD
LATITUD:
    IMP_CAD_COLOR   MSJLATITUD, 12, 10, 15, 0, 0F0H, 0
    CURSOR  10, 25, 0
    LEER_CADENA LATITUDC  
    IMP_CAD_COLOR   MSJNS, 19, 11, 15, 0, 0F0H, 0   
REPNS:
    CURSOR  11, 31, 0
    MOV AH, 1
    INT 21H
        MOV NS, AL
    CMP NS, 'N'
    JE LONGITUD
    CMP NS, 'S'
    JE LONGITUD
    JMP REPNS
LONGITUD:
    IMP_CAD_COLOR   MSJLONGITUD, 12, 13, 15, 0, 0F0H, 0
    CURSOR  13, 25, 0
    LEER_CADENA LONGITUDC  
    IMP_CAD_COLOR   MSJEO, 19, 14, 15, 0, 0F0H, 0   
REPEO:
    CURSOR  14, 32, 0
    MOV AH, 1
    INT 21H
        MOV EO, AL
    CMP EO, 'E'
    JE PANTALLAFINAL
    CMP EO, 'O'
    JE PANTALLAFINAL
    JMP REPEO


FIN:
MOV AX, 4C00H
INT 21H

END