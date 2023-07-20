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
    RW                  DW  0
    RUTAJOSE            DB  'C:\FIRULAIS\JOSE.txt',0
    RUTAGADYEL          DB  'C:\FIRULAIS\GADYEL.txt',0 
    RUTAGERRY           DB  'C:\FIRULAIS\GERRY.txt',0
    NOMBREJOSE          DB  'JOSE '
    NOMBREGADYEL        DB  'GADY '
    NOMBREGERRY         DB  'GERRY'
    msjError            DB  'ERROR: NO SE HA PODIDO REALIZAR EL PROCESO.';43 
    msjEscritura        DB  'SE HA ESCRITO EN EL ARCHIVO, VERIFIQUE     ';43
    
    ID                  DW      0
    DATOSLEIDOS         DB      200 DUP('_')
    MENSAJER            DB      71 DUP('$')
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

ABRIR_ARCHIVO MACRO RUTA,MODO
    MOV AH,3DH
    LEA DX,RUTA
        MOV AL,MODO
    INT 21H 
        MOV ID,AX ; RECUPERAR ID
        ; -----MODOS-----
        ; -> Solo lectura       =0
        ; -> Solo escritura     =1
        ; -> Lectura/Escritura  =2
ABRIR_ARCHIVO ENDM

ESCRIBIR_ARCHIVO MACRO ID,CUANTOS_ESCRIBIR,DATOS_ESCRIBIR
    MOV AH,40H
    MOV BX,ID
    MOV CX,CUANTOS_ESCRIBIR
    LEA DX,DATOS_ESCRIBIR
    INT 21H    
ESCRIBIR_ARCHIVO ENDM

LEER_ARCHIVO MACRO ID,CUANTOS_LEER,DATOS_LEIDOS
    MOV AH,3FH
    MOV BX,ID
    MOV CX,CUANTOS_LEER
    LEA DX,DATOS_LEIDOS
    INT 21H
LEER_ARCHIVO ENDM

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
    LEER_CADENA MENSAJE2
    
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

; GUARDAMOS LOS 2 MENSAJE EN UNO SOLO
    MOV CX,35
    MOV DI,0
    MOV SI,2
    MOV RW,0
LOOP_COPIAR_CAD:
    PUSH CX
    
        MOV AL,MENSAJE[SI]
        MOV MENSAJER[DI],AL
        CMP AL,0DH
        JE SALIR
        INC SI
        INC DI
        INC RW
        
    POP CX
LOOP LOOP_COPIAR_CAD
;ESPACIO EN EL MENSAJE RESULTANTE  
SALIR:
    MOV SI,RW
    MOV MENSAJER[SI],20H
    INC RW

;MENSAJE2 A MENSAJER    
    MOV CX,35
    MOV SI,2
    MOV DI,RW
LOOP_COPIAR_CAD2:   
    PUSH CX
        
        MOV AL,MENSAJE2[SI]
        MOV MENSAJER[DI],AL
        CMP AL,0DH
        JE SALIR2
        INC SI
        INC DI
        INC RW
    
    POP CX
LOOP LOOP_COPIAR_CAD2 

SALIR2:    
    MOV SI,RW
    MOV MENSAJER[SI],20H
    INC RW  
    
    MOV CX,70
LLENAR_MENSAJER:
    PUSH CX
        
        MOV SI,RW
        MOV MENSAJER[SI],20H
        INC RW
        CMP RW,71
        JE GUARDAR_JOSE
           
    POP CX 
LOOP LLENAR_MENSAJER
    
    
;GUARDAMOS EL MENSAJE DEPENDIENDO DEL DESTINATARIO
;JOSE
GUARDAR_JOSE:
    MOV CX,4
    MOV SI,0
    MOV DI,2
CICLO_GUARDAR_JOSE:
    PUSH CX
        MOV DH,DESTINATARIO[DI]
        MOV DL,NOMBREJOSE[SI] 
        CMP DH,DL
        JE SIGUELE_JOSE
        JMP GUARDAR_GADYEL
SIGUELE_JOSE:        
    INC SI
    INC DI
    POP CX
LOOP CICLO_GUARDAR_JOSE
;ESCRIBIR EN EL ARCHIVO DE JOSE 
    ABRIR_ARCHIVO RUTAJOSE,2
    ESCRIBIR_ARCHIVO ID,71,MENSAJER
    JMP UBICACION
    
;GADYEL    
GUARDAR_GADYEL:    
    MOV CX,4
    MOV SI,0
    MOV DI,2
CICLO_GUARDAR_GADYEL:
    PUSH CX
        MOV DH,DESTINATARIO[DI]
        MOV DL,NOMBREGADYEL[SI] 
        CMP DH,DL
        JE SIGUELE_GADYEL
        JMP GUARDAR_GERRY
SIGUELE_GADYEL:        
    INC SI
    INC DI
    POP CX
LOOP CICLO_GUARDAR_GADYEL
;ESCRIBIR EN EL ARCHIVO 
    ABRIR_ARCHIVO RUTAGADYEL,2
    ESCRIBIR_ARCHIVO ID,71,MENSAJER
    JMP UBICACION
    
    MOV AH, 3EH
    MOV BX, ID
    INT 21H 
       
    JMP UBICACION
    
;GERRY    
GUARDAR_GERRY:    
    MOV CX,5
    MOV SI,0
    MOV DI,2
CICLO_GUARDAR_GERRY:
    PUSH CX
        MOV DH,DESTINATARIO[DI]
        MOV DL,NOMBREGERRY[SI] 
        CMP DH,DL
        JE SIGUELE_GERRY
        JMP PREGUNTARDESTINATARIO
SIGUELE_GERRY:        
    INC SI
    INC DI
    POP CX
LOOP CICLO_GUARDAR_GERRY
;ESCRIBIR EN EL ARCHIVO 
    ABRIR_ARCHIVO RUTAGERRY,2
    ESCRIBIR_ARCHIVO ID,71,MENSAJER
    JMP UBICACION

UBICACION:
    
FIN:
        MOV AX, 4C00H
        INT 21H
END











       