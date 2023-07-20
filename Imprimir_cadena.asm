#start=stepper_motor.exe#
;***********************************************
;   Nombre del proyecto:
;   FIRULAIS SOLOVINO
;   
;   Integrantes:
;   1. Gadyel Josue Mart?nez Guzm?n
;   2. Gerardo Espinosa Rosas
;   3. Jose Manuel Vazquez Mendez
;   Presenta:
;   
;-------------------------------------------------------------
;FASE 1. MAQUETADO de SOFTWARE           -Fecha 13 julio 2023-
;------------------------------------------------------------- 
;INSTRUCCIONES:
;   1.  Definir una paleta de colores, m?ximo 3 colores
;       cada pantalla, deber? estar alineada a la paleta
;       de colores.
;   2.  Por equipo, definir un logotipo. Debe ser original.
;   3.  Cada pantalla deber? tener el logotipo, un encabezado
;       y un pie de p?gina.
;   4.  Cada pantalla deber? tener un fondo de alg?n caracter.
;   5.  Definir el men?, pantalla login, pantalla <1>.
;**************************************************************
.MODEL SMALL           
.STACK
.DATA
;******************* VARIABLES LOGIN *************************    
    LINEA           DB  80  DUP(219)
    MSJUSUARIO      DB  "USUARIO:       "  
    MSJCONTRASE?A   DB  "CONTRASE",165,"A:    "    
    USUARIO         DB  "  FIRULAIS"
    CONTRASE?A      DB  "  SOLOVINO" 
    USUARIOC        DB  9, 0, 9 DUP(36)
    CONTRASE?AC     DB  9, 0, 9 DUP(36)
    USUARIOINC      DB  "Ha introducido un usuario incorrecto";36
    USUARIOCOR      DB  "Usuario correcto                    ";36 
    CONTRASE?ACOR   DB  "Contrase",164,"a correcta                     ";40
    CONTRASE?AINC   DB  "Ha introducido una contrase",164,"a incorrecta";40
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
;***************************** VARIABLES MEN? *************************************************
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
                DB '                    | |\/| |/ _ \ ?_ \| | | |',10,13
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
;************************** VARIABLES ENVIADO ********************************* 
TITULOENVIAR    DB '        ===RECURSOS===         '
FIRULAIS        DB '                                         ______________  __  ____    ___    _________',10,13
                DB '               / ____/  _/ __ \/ / / / /   /   |  /  _/ ___/',10,13
                DB '              / /_   / // /_/ / / / / /   / /| |  / / \__ \ ',10,13
                DB '             / __/ _/ // _, _/ /_/ / /___/ ___ |_/ / ___/ / ',10,13
                DB '            /_/   /___/_/ |_|\____/_____/_/  |_/___//____/  ',10,13
ENVIADO         DB '                _______   ___    _________    ____  ____ ',10,13
                DB '               / ____/ | / / |  / /  _/   |  / __ \/ __ \',10,13
                DB '              / __/ /  |/ /| | / // // /| | / / / / / / /',10,13
                DB '             / /___/ /|  / | |/ // // ___ |/ /_/ / /_/ / ',10,13
                DB '            /_____/_/ |_/  |___/___/_/  |_/_____/\____/  ',10,13
LLEGADO         DB '                __  _____       __    __    _______________    ____  ____ ',10,13
                DB '               / / / /   |     / /   / /   / ____/ ____/   |  / __ \/ __ \',10,13
                DB '              / /_/ / /| |    / /   / /   / __/ / / __/ /| | / / / / / / /',10,13
                DB '             / __  / ___ |   / /___/ /___/ /___/ /_/ / ___ |/ /_/ / /_/ / ',10,13
                DB '            /_/ /_/_/  |_|  /_____/_____/_____/\____/_/  |_/_____/\____/  ',10,13  

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
JMP INICIO_MENSAJE
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
    JMP CONTRASE?A_INICIO

USUARIOINCORRECTO:
    IMP_CAD_COLOR   USUARIOINC, 36, 21, 30, 0, 0FCH, 0
    JMP USUARIO_INICIO

;**********     SI EL USUARIO FUE CORRECTO ***********
CONTRASE?A_INICIO:
IMP_CAD_COLOR   MSJCONTRASE?A, 15, 22, 30, 0, 0F8H, 0

CURSOR 22, 46, 0

LEER_CADENA CONTRASE?AC

MOV CX, 8
MOV SI, 2
MOV AX, 0
MOV BX, 0
MOV CONTADOR, 0
COMPARAR_CONTRASE?A:
    MOV AL, CONTRASE?AC[SI]
    MOV BL, CONTRASE?A[SI]
    CMP AL, BL
    JE CMP_CONTRASE?ACOR
    JMP CMP_CONTRASE?AINC
    
CMP_CONTRASE?ACOR:
    INC CONTADOR
    INC SI    
    LOOP COMPARAR_CONTRASE?A
    JMP FIN_COMPARAR_CONTRASE?A
    
CMP_CONTRASE?AINC:
    INC SI
    LOOP COMPARAR_CONTRASE?A
    JMP FIN_COMPARAR_CONTRASE?A
    
FIN_COMPARAR_CONTRASE?A:
    CMP CONTADOR, 8
    JE  CONTRASE?ACORRECTA
    JMP CONTRASE?AINCORRECTA
    
    
CONTRASE?ACORRECTA: 
    IMP_CAD_COLOR CONTRASE?ACOR, 40, 23, 30, 0, 0F8H, 0
    NOP
    JMP MENU

CONTRASE?AINCORRECTA:
    IMP_CAD_COLOR   CONTRASE?AINC, 40, 23, 30, 0, 0FCH, 0
    JMP CONTRASE?A_INICIO
    
;=================================================================
;                            MEN?
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
    JMP IMPRIMIR_CADENA
    
ESCRIBIRMENSAJE:
    IMP_CAD_COLOR PEDIRMSJ, 20, 10, 15, 0, 0CFH, 0
    IMP_CAD_COLOR ESPACIOMSJ, 35, 12, 15, 0, 0CFH, 0
    IMP_CAD_COLOR ESPACIOMSJ, 35, 14, 15, 0, 0CFH, 0
    
    ;ESCRIBIR EL MENSAJE
    CURSOR 12,15,0
    LEER_CADENA MENSAJE
    CURSOR 14,15,0
    LEER_CADENA MENSAJE2
    
    IMP_CAD_COLOR MSJDENUEVO, 28, 16, 15, 0, 0CFH, 0 
    IMP_CAD_COLOR MSJDENUEVO2, 28, 17, 15, 0, 0CFH, 0                                         
    IMP_CAD_COLOR RESMSJ, 11, 19, 15, 0, 0CFH, 0
    
    CURSOR 19,26,0
    MOV AH,1
    INT 21H
    
    MOV R, AL
    CMP R,'1'
    JE ESCRIBIRMENSAJE
    JMP IMPRIMIR_CADENA
;============================================================
;                     VENTANA UBICACION    
;============================================================
IMPRIMIR_CADENA:
   ;INTERRUPCION PARA IMPRESORA
   MOV AH,5
        MOV DL,12
        INT 21H
        
            MOV CX,0  ; total de caracteres
            MOV CL,MENSAJE[1] 
            MOV SI,2 
IMPRIMIR:    
       MOV AH,5       ; IBTERRUPCION PARA IMPRIMIR
       MOV DL,MENSAJE[SI] ;caracter a imprimir  
       INT 21H
       INC SI
LOOP IMPRIMIR 
       MOV AH,5       ; IBTERRUPCION PARA IMPRIMIR
       MOV DL,0AH ;caracter a imprimir  
       INT 21H     
       MOV AH,5       ; IBTERRUPCION PARA IMPRIMIR
       MOV DL,0DH ;caracter a imprimir  
       INT 21H  ; total de caracteres 
            MOV CX,0  ; total de caracteres
            MOV CL,MENSAJE2[1] 
            MOV SI,2
IMPRIMIR2:    
       MOV AH,5       ; IBTERRUPCION PARA IMPRIMIR
       MOV DL,MENSAJE2[SI] ;caracter a imprimir  
       INT 21H
       INC SI
LOOP IMPRIMIR2


FIN:
    
        MOV AX, 4C00H
        INT 21H
END