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
;******************* VARIABLES LOGIN *************************    
    LINEA           DB  80  DUP(219)
    MSJUSUARIO      DB  "USUARIO:       "  
    MSJCONTRASEÑA   DB  "CONTRASE",165,"A:    "    
    USUARIO         DB  "  FIRULAIS"
    CONTRASEÑA      DB  "  SOLOVINO" 
    USUARIOC        DB  9, 0, 9 DUP(36)
    CONTRASEÑAC     DB  9, 0, 9 DUP(36)
    USUARIOINC      DB  "Ha introducido un usuario incorrecto";36
    USUARIOCOR      DB  "Usuario correcto                    ";36 
    CONTRASEÑACOR   DB  "Contrase",164,"a correcta                     ";40
    CONTRASEÑAINC   DB  "Ha introducido una contrase",164,"a incorrecta";40
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
;***************************** FIN VARIABLES LOGIN ********************************************
;==============================================================================================
;***************************** VARIABLES MENÚ *************************************************
    MSJMENU   DB      '     FUNCIONALIDADES     '
    MSJFUNCION  DB      '[PRESIONA ENTER PARA CONTINUAR]';31
    MSJOPCION1  DB      '1.Enviar recursos        '
    MSJOPCION2  DB      '2.Detectar enemigos      '
    MSJOPCION3  DB      '3.Enviar mensajes        ' 
    RASTREO     DB      0
    ESLOGAN     DB      'FIRULAIS SOLOVINO - EL MENSAJERO DE ESPERANZA'
    NOMBRE1     DB      'GERARDO ESPINOSA ROSAS';22   
    NOMBRE2     DB      'GADYEL JOSUE M',160,'RTINEZ G',163,'ZMAN';28
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
                
    LOGO        DB 10,13,'                    ___  ___                 ',10,13
                DB '                    |  \/  |                 ',10,13
                DB '                    | .  . | ___ _ __  _   _ ',10,13
                DB '                    | |\/| |/ _ \ ´_ \| | | |',10,13
                DB '                    | |  | |  __/ | | | |_| |',10,13
                DB '                    \_|  |_/\___|_| |_|\__,_|',10,13         
;***************************  FIN VARIABLES MENU ******************************
;==============================================================================
;*************************** VARIABLES RECURSOS *******************************
    MSJRECURSOS DB      '        ===RECURSOS===         '
    MSJPREGUNTA DB      'Deseas enviar recursos?[   ]   ';31
    MSJSI       DB      '1.Si                           '
    MSJNO       DB      '2.No                           '
    OPCION      DB      0
;*************************** FIN VARIABLES RECURSOS ***************************
;==============================================================================
;************************** VARIABLES MENSAJE *********************************
    PREGUNTARMENSAJE    DB  'DESEA MANDAR UN MENSAJE? ';25
    OPCMSJ1             DB  '1. SI' ;5
    OPCMSJ2             DB  '2. NO' ;5
    RESMSJ              DB  'RESPUESTA: ' ;11 
    PEDIRMSJ            DB  'ESCRIBA SU MENSAJE: ';20
    ESPACIOMSJ          DB  '___________________________________';70
    MENSAJE             DB  35,0,36 DUP('$')
    MENSAJE2            DB  35,0,36 DUP('$')
    MSJDENUEVO          DB  '1. ESCRIBIR MENSAJE DE NUEVO';28
    MSJDENUEVO2         DB  '2. MENSAJE LISTO            ';28
    R                   DB  0
;************************** FIN VARIABLES MENSAJE *****************************
;==============================================================================
;************************ VARIABLES UBICACION *********************************
    TITULOUBICACION     DB      'INDIQUE LA UBICACI',162,'N A DONDE DESEE ENVIAR A SOLOVINO'
    MSJLATITUD          DB      'LATITUD:    ';12
    MSJLONGITUD         DB      'LONGITUD:   ';12
    LATITUDC            DB      10, 0, 10 DUP(36)
    MSJNS               DB      'NORTE[N] SUR[S]:   ';19
    NS                  DB      0
    MSJEO               DB      'ESTE[E] OESTE[O]:  ';19
    EO                  DB      0
    LONGITUDC           DB      10, 0, 10 DUP(36)
;************************ FIN VARIABLES UBICACION *****************************

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
;============================= LOGIN ========================
LOGIN:
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

MOV CX,25
FONDOLOGIN:
    PUSH CX
    IMP_CAD_COLOR LINEA,80,RENGLON,0,0,8FH,0       
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
    JMP CONTRASEÑA_INICIO

USUARIOINCORRECTO:
    IMP_CAD_COLOR   USUARIOINC, 36, 21, 30, 0, 0FCH, 0
    JMP USUARIO_INICIO

;**********     SI EL USUARIO FUE CORRECTO ***********
CONTRASEÑA_INICIO:
IMP_CAD_COLOR   MSJCONTRASEÑA, 15, 22, 30, 0, 0F8H, 0

CURSOR 22, 46, 0

LEER_CADENA CONTRASEÑAC

MOV CX, 8
MOV SI, 2
MOV AX, 0
MOV BX, 0
MOV CONTADOR, 0
COMPARAR_CONTRASEÑA:
    MOV AL, CONTRASEÑAC[SI]
    MOV BL, CONTRASEÑA[SI]
    CMP AL, BL
    JE CMP_CONTRASEÑACOR
    JMP CMP_CONTRASEÑAINC
    
CMP_CONTRASEÑACOR:
    INC CONTADOR
    INC SI    
    LOOP COMPARAR_CONTRASEÑA
    JMP FIN_COMPARAR_CONTRASEÑA
    
CMP_CONTRASEÑAINC:
    INC SI
    LOOP COMPARAR_CONTRASEÑA
    JMP FIN_COMPARAR_CONTRASEÑA
    
FIN_COMPARAR_CONTRASEÑA:
    CMP CONTADOR, 8
    JE  CONTRASEÑACORRECTA
    JMP CONTRASEÑAINCORRECTA
    
    
CONTRASEÑACORRECTA: 
    IMP_CAD_COLOR CONTRASEÑACOR, 40, 23, 30, 0, 0F8H, 0
    NOP
    JMP MENU

CONTRASEÑAINCORRECTA:
    IMP_CAD_COLOR   CONTRASEÑAINC, 40, 23, 30, 0, 0FCH, 0
    JMP CONTRASEÑA_INICIO
    
;=================================================================
;                            MENÚ
;=================================================================    
MENU:
MOV CX,25
MOV RENGLON, 0
FONDOMENU:
    PUSH CX
    IMP_CAD_COLOR LINEA, 80, RENGLON, 0, 0, 0FCH, 0       
        INC RENGLON
    POP CX
LOOP FONDOMENU

ENCABEZADO_Y_PIE

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

;IMPRIMIR MENU
    MOV AH, 19
    LEA BP, LOGO
    MOV CX, 284
    MOV DH, 3    
    MOV DL, 40    
    MOV AL, 0    
    MOV BH, 0
    MOV BL, 0CFH
    INT 10H 
    
        IMP_CAD_COLOR MSJMENU,25,12,18,0,0CFH,0
        IMP_CAD_COLOR MSJFUNCION,25,20,20,0,0CFH,0
        IMP_CAD_COLOR msjOpcion1,25,14,20,0,0CFH,0
        IMP_CAD_COLOR msjOpcion2,25,16,20,0,0CFH,0
        IMP_CAD_COLOR msjOpcion3,25,18,20,0,0CFH,0
        IMP_CAD_COLOR msjFuncion,31,20,20,0,0CFH,0
        MOV AH,2
        MOV DH,20
        MOV DL,90
        MOV BH,0
        INT 10H
        ;Esperar ENTER
            MOV AH,0
            INT 16H
            MOV RASTREO, AH ;RECUPERAR
  
        CMP RASTREO, 1CH
        JE VENTANARECURSOS
;==========================================================
;                   VENTANA RECURSOS
;==========================================================
VENTANARECURSOS:
MOV CX,25
MOV RENGLON, 0
FONDOVENTANARECURSOS:
    PUSH CX
    IMP_CAD_COLOR linea,80,RENGLON,0,0,0FCH,0       
        INC RENGLON
    POP CX
LOOP FONDOVENTANARECURSOS

ENCABEZADO_Y_PIE

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
    
    ;imprimir menu
        IMP_CAD_COLOR MSJRECURSOS,31,5,16,0,0CFH,0 
        IMP_CAD_COLOR msjpregunta,31,10,10,0,0CFH,0
        IMP_CAD_COLOR msjSi,31,14,10,0,0CFH,0
        IMP_CAD_COLOR msjNo,31,16,10,0,0CFH,0

CICLORECURSO:       
        ;COLOCAR CURSOR
        MOV AH,2
        MOV DH,10
        MOV DL,35
        MOV BH,0
        INT 10H
        ;Esperar tecla
        MOV AH,1
        INT 21H
            MOV OPCION, AL
        CMP OPCION, '1'
        JE INICIO_MENSAJE
        CMP OPCION, '2'
        JE INICIO_MENSAJE
JMP CICLORECURSO
;==========================================================
;                     VENTANA MENSAJE
;==========================================================       
INICIO_MENSAJE:
MOV CX,25
    
MOV RENGLON, 0
FONDOMENSAJE:
    PUSH CX
    IMP_CAD_COLOR LINEA,80,RENGLON,0,0,0FCH,0
        INT 10H        
        INC RENGLON
    POP CX
LOOP FONDOMENSAJE

ENCABEZADO_Y_PIE

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

    IMP_CAD_COLOR PREGUNTARMENSAJE, 25, 5, 15, 0, 0CFH, 0
    IMP_CAD_COLOR OPCMSJ1, 5, 6, 15, 0, 0CFH, 0
    IMP_CAD_COLOR OPCMSJ2, 5, 7, 15, 0, 0CFH, 0  
    IMP_CAD_COLOR RESMSJ, 11, 8, 15, 0, 0CFH, 0

    CURSOR 8,26,0
    MOV AH,1
    INT 21H
    
    MOV R,AL
    CMP AL,'1'
    JE ESCRIBIRMENSAJE
    JMP UBICACION
    
ESCRIBIRMENSAJE:
    IMP_CAD_COLOR PEDIRMSJ, 20, 10, 15, 0, 0CFH, 0
    IMP_CAD_COLOR ESPACIOMSJ, 35, 12, 15, 0, 0CFH, 0
    IMP_CAD_COLOR ESPACIOMSJ, 35, 14, 15, 0, 0CFH, 0
    
    ;ESCRIBIR EL MENSAJE
    CURSOR 12,15,0
    LEER_CADENA MENSAJE
    CURSOR 14,15,0
    LEER_CADENA MENSAJE
    
    IMP_CAD_COLOR MSJDENUEVO, 28, 16, 15, 0, 0CFH, 0 
    IMP_CAD_COLOR MSJDENUEVO2, 28, 17, 15, 0, 0CFH, 0                                         
    IMP_CAD_COLOR RESMSJ, 11, 19, 15, 0, 0CFH, 0
    
    CURSOR 19,26,0
    MOV AH,1
    INT 21H
    
    MOV R, AL
    CMP R,'1'
    JE ESCRIBIRMENSAJE
    JMP UBICACION
;============================================================
;                     VENTANA UBICACION    
;============================================================
UBICACION:

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
    JE LOGIN
    CMP EO, 'O'
    JE LOGIN
    JMP REPEO
    

FIN:
        MOV AX, 4C00H
        INT 21H
END











       