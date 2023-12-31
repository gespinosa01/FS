#START=STEPPER_MOTOR.EXE#
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
;       cada pantalla, deber�a estar alineada a la paleta
;       de colores.
;   2.  Por equipo, definir un logotipo. Debe ser original.
;   3.  Cada pantalla deber�a tener el logotipo, un encabezado
;       y un pie de p�gina.
;   4.  Cada pantalla deber�a tener un fondo de alg�n caracter.
;   5.  Definir el men�, pantalla login, pantalla <1>.
;**************************************************************
.MODEL SMALL           
.STACK
.DATA
;******************* VARIABLES LOGIN *************************    
    COLOR           DB  0
    LINEA           DB  80  DUP(219)
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
;***************************** FIN VARIABLES LOGIN ********************************************
;==============================================================================================
;***************************** VARIABLES MEN� *************************************************
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
                DB '                    | |\/| |/ _ \  _ \| | | |',10,13
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
    MSJDENUEZ           DB  '1. MENSAJE LISTO            ';28                           
    MSJDENUEZ2          DB  '2. ESCRIBIR MENSAJE DE NUEVO';28
    MSJDESTINATARIO     DB  'DESTINATARIO: ' ;14
    DESTINATARIO        DB  11,0,12 DUP('$')
    R                   DB  0
    RW                  DW  0
    RUTA                DB  'C:\FIRULAIS\',0
    RUTAJOSE            DB  'C:\FIRULAIS\JOSE.txt',0
    RUTAGADYEL          DB  'C:\FIRULAIS\GADYEL.txt',0 
    RUTAGERRY           DB  'C:\FIRULAIS\GERRY.txt',0
    NOMBREJOSE          DB  'JOSE '
    NOMBREGADYEL        DB  'GADY '
    NOMBREGERRY         DB  'GERRY'
    MSJERROR            DB  'ERROR: NO SE HA PODIDO REALIZAR EL PROCESO.';43 
    MESJESCRITURA       DB  'SE HA ESCRITO EN EL ARCHIVO, VERIFIQUE     ';43
    
    ID                  DW      0
    DATOSLEIDOS         DB      200 DUP('_')
    MENSAJER            DB      71 DUP('$')
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
    FIRULAIS        DB '______________  __  ____    ___    _________',10,13
                    DB '               / ____/  _/ __ \/ / / / /   /   |  /  _/ ___/',10,13
                    DB '              / /_   / // /_/ / / / / /   / /| |  / / \__ \ ',10,13
                    DB '             / __/ _/ // _, _/ /_/ / /___/ ___ |_/ / ___/ / ',10,13
                    DB '            /_/   /___/_/ |_|\____/_____/_/  |_/___//____/  ',10,13
    ENVIADO         DB '_______   ___    _________    ____  ____ ',10,13
                    DB '               / ____/ | / / |  / /  _/   |  / __ \/ __ \',10,13
                    DB '              / __/ /  |/ /| | / // // /| | / / / / / / /',10,13
                    DB '             / /___/ /|  / | |/ // // ___ |/ /_/ / /_/ / ',10,13
                    DB '            /_____/_/ |_/  |___/___/_/  |_/_____/\____/  ',10,13
    LLEGADO         DB '__  _____       __    __    _______________    ____  ____ ',10,13
                    DB '               / / / /   |     / /   / /   / ____/ ____/   |  / __ \/ __ \',10,13
                    DB '              / /_/ / /| |    / /   / /   / __/ / / __/ /| | / / / / / / /',10,13
                    DB '             / __  / ___ |   / /___/ /___/ /___/ /_/ / ___ |/ /_/ / /_/ / ',10,13
                    DB '            /_/ /_/_/  |_|  /_____/_____/_____/\____/_/  |_/_____/\____/  ',10,13  
    VUELTA_HORARIO  DB  0000_0110B  ;6H - 6
                    DB  0000_0100B  ;4H - 4
                    DB  0000_0011B  ;3H - 3
                    DB  0000_0010B  ;2H - 2
    VUELTA_ANTI     DB 0000_0011B   ;3H - 3
                    DB 0000_0001B   ;1H - 1
                    DB 0000_0110B   ;6H - 6
                    DB 0000_0010B   ;2H - 2                
;******************************** FIN VARIABLES ENVIADO ***********************
;==============================================================================
;*********************************VARIABLES MENSAJE****************************
    IMGMENSAJE      DB   '  @@@@@@@@@@@@@@@@@@@@@@@@@    ';31
                    DB   '  @@                     @@    '
                    DB   '  @@   @@@@@@            @@    '
                    DB   '  @@                     @@    '
                    DB   '  @@                     @@    '
                    DB   '  @@   @@@@@@@@@@@@@@    @@    '
                    DB   '@@@@@                     @@@@@'
                    DB   '@@@  @@@    @@@@@@@@.   @@@@@@@'
                    DB   '@@      @@@.         (@@@    @@'
                    DB   '@@         @@@     @@@       @@'
                    DB   '@@           @@ @@@&         @@'
                    DB   '@@      @@@@@@( #@@@@@@      @@'
                    DB   '@@    @@@@           @@@@    @@'
                    DB   '@@ @@@@               @@@@   @@'
                    DB   '@@@@@                   @@@@ @@'
                    DB   '@@@                      @@@@@@'
                    DB   '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
        MSJTIENE    DB   '  _________________   _______     __  ___   __ ';47
                    DB   ' /_  __/  _/ ____/ | / / ___/    / / / / | / / '
                    DB   '  / /  / // __/ /  |/ / __/     / / / /  |/ /  '
                    DB   ' / / _/ // /___/ /|  / /___    / /_/ / /|  /   '
                    DB   '/_/ /___/_____/_/ |_/_____/    \____/_/_|_/    '
        MSJMENSAJE  DB   '   /  |/  / ____/ | / / ___//   |     / / ____/'
                    DB   '  / /|_/ / __/ /  |/ /\__ \/ /| |__  / / __/   '
                    DB   ' / /  / / /___/ /|  /___/ / ___ / /_/ / /___   '
                    DB   '/_/  /_/_____/_/ |_//____/_/  |_\____/_____/   '
        BMENSAJE    DB   0
        BSUMINISTRO DB   0                                                                                      
;*******************************FIN VARIABLES MENSAJE************************** 
;******************************* VARIABLES TERMOMETRO**************************
        TEMPERATURA DB  0
        MSJENEMIGO  DB  ' _____ _   _  ________  ________ _____ _____ ',10,13;45
                    DB  '                 |  ___| \ | ||  ___|  \/  |_   _|  __ \  _  |',10,13
                    DB  '                 | |__ |  \| || |__ | .  . | | | | |  \/ | | |',10,13
                    DB  '                 |  __|| . ` ||  __|| |\/| | | | | | __| | | |',10,13
                    DB  '                 | |___| |\  || |___| |  | |_| |_| |_\ \ \_/ /',10,13
                    DB  '                 \____/\_| \_/\____/\_|  |_/\___/ \____/\___/ ' 
        MSJDETECTADO DB '______ _____ _____ _____ _____ _____ ___ ______ _____ ',10,13;54
                    DB  '             |  _  \  ___|_   _|  ___/  __ \_   _/ _ \|  _  \  _  |',10,13
                    DB  '             | | | | |__   | | | |__ | /  \/ | |/ /_\ \ | | | | | |',10,13
                    DB  '             | | | |  __|  | | |  __|| |     | ||  _  | | | | | | |',10,13
                    DB  '             | |/ /| |___  | | | |___| \__/\ | || | | | |/ /\ \_/ /',10,13
                    DB  '             |___/ \____/  \_/ \____/ \____/ \_/\_| |_/___/  \___/ '
        MSJESCAPANDO DB ' _____ _____ _____   ___  ______  ___   _   _______ _____ ',10,13
                    DB  '           |  ___/  ___/  __ \ / _ \ | ___ \/ _ \ | \ | |  _  \  _  |',10,13;58
                    DB  '           | |__ \ `--.| /  \// /_\ \| |_/ / /_\ \|  \| | | | | | | |',10,13
                    DB  '           |  __| `--. \ |    |  _  ||  __/|  _  || . ` | | | | | | |',10,13
                    DB  '           | |___/\__/ / \__/\| | | || |   | | | || |\  | |/ /\ \_/ /',10,13
                    DB  '           \____/\____/ \____/\_| |_/\_|   \_| |_/\_| \_/___/  \___/ ',10,13
                     
;******************************* FIN VARIABLES TERMOMETRO *********************
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

CREAR_CARPETA   MACRO RUTA
    MOV AH, 39H
    LEA DX, RUTA
    INT 21H
CREAR_CARPETA   ENDM

CREAR_ARCHIVO   MACRO RUTA, TIPO, 
    MOV AH, 3CH 
    LEA DX, RUTA
    MOV CX, TIPO
    INT 21H
        MOV ID, AX   ;REGRESA EL <ID> DEL ARCHIVO    
CREAR_ARCHIVO   ENDM    


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

;========================================================
;                   VENTANA ENVIADO/LLEGADO
;========================================================
VENTANA_ENVIADO:
MOV CX,25
MOV RENGLON, 0

MOV COLOR, 0FH
CALL PINTAR_FONDO 


ENCABEZADO_Y_PIE


IMP_CAD_COLOR  FIRULAIS, 294, 5, 15, 0, 0F0H, 0
IMP_CAD_COLOR  ENVIADO, 279, 12, 15, 0, 0F0H, 0

;**** VUELTAS EN SENTIDO HORARIO ****
;MOVEMOS A BX, VUELTA_HORARIO
MOV BX, OFFSET VUELTA_HORARIO   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_HORARIO:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI�N DE QUE 
    ;EST� FUNCIONANDO CORRECTAMENTE
    WAIT1:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT1 ;SI EQUIVALE A CERO SEGUIR� ESPERANDO
    ;SI YA EST� LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI�N AL MOTOR
    ;INCREMENTA LA POSICI�N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI� LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET� 4 PASOS REGRESA 
                ;A LA POSICI�N INICIAL
               
    JC  SIGUIENTE_PASO_HORARIO 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 8
    JBE SIGUIENTE_PASO_HORARIO


;TERMOMETRO IDEA
    MOV COLOR, 0FH
    CALL PINTAR_FONDO
#START=THERMOMETER.EXE#;ABRIMOS EL TERMOMETRO
    MOV AL,1    
    OUT 127,AL;ENCENDEMOS EL TERMOMETRO
    CALL TECLA;ESPERAMOS A UNA TECLA
    
    IN AL, 125  ;
    MOV TEMPERATURA,AL;CAPTURAMOS LA TEMPERATURA LEIDA
    
    CMP TEMPERATURA,30
    JB CONTINUANDO_VUELTAS

    IMP_CAD_COLOR MSJENEMIGO, 365, 3, 17, 0, 0F0H, 0
    IMP_CAD_COLOR MSJDETECTADO, 399, 9, 13, 0, 0F0H, 0
    IMP_CAD_COLOR MSJESCAPANDO, 413, 15, 11, 0, 0F0H, 0





 
 
 
 
 
CONTINUANDO_VUELTAS:
 
    
;*** VUELTAS EN SENTIDO ANTIHORARIO ***
;MOVEMOS A BX, VUELTA_ANTI
MOV BX, OFFSET VUELTA_ANTI   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_ANTIHORARIO:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI�N DE QUE 
    ;EST� FUNCIONANDO CORRECTAMENTE
    WAIT2:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT2 ;SI EQUIVALE A CERO SEGUIR� ESPERANDO
    ;SI YA EST� LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI�N AL MOTOR
    ;INCREMENTA LA POSICI�N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI� LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET� 4 PASOS REGRESA 
                ;A LA POSICI�N INICIAL
               
    JC  SIGUIENTE_PASO_ANTIHORARIO 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 5
    JBE SIGUIENTE_PASO_ANTIHORARIO


;**** VUELTAS EN SENTIDO HORARIO ****
;MOVEMOS A BX, VUELTA_HORARIO
MOV BX, OFFSET VUELTA_HORARIO   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_HORARIO1:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI�N DE QUE 
    ;EST� FUNCIONANDO CORRECTAMENTE
    WAIT3:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT3 ;SI EQUIVALE A CERO SEGUIR� ESPERANDO
    ;SI YA EST� LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI�N AL MOTOR
    ;INCREMENTA LA POSICI�N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI� LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET� 4 PASOS REGRESA 
                ;A LA POSICI�N INICIAL
               
    JC  SIGUIENTE_PASO_HORARIO1 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 8
    JBE SIGUIENTE_PASO_HORARIO1


    IMP_CAD_COLOR   LLEGADO, 364, 12, 15, 0, 0F2H, 0
    IMP_CAD_COLOR   MSJFUNCION,31,20,20,0,0F2H,0
ENTER:
    ;CURSOR ENTER
    MOV AH,2
    MOV DH,20
    MOV DL,52
    MOV BH,0
    INT 10H
    ;Esperar ENTER
            MOV AH,0
            INT 16H
            MOV RASTREO, AH ;RECUPERAR
  
        CMP RASTREO, 1CH
;        JE IMPRIMIR_MENSAJE
JMP ENTER
;======================================================
FIN:
        MOV AX, 4C00H
        INT 21H
;************** SECCION DE PROCEDIMIENTOS **********       
PINTAR_FONDO PROC
    MOV CX,25
    MOV RENGLON,0
FONDO:
    PUSH CX    
        IMP_CAD_COLOR LINEA,80,RENGLON,0,0,COLOR,0       
        INC RENGLON
    POP CX
LOOP FONDO
RET
PINTAR_FONDO ENDP
;***************************************************
TECLA PROC
    MOV AH,0
    INT 16H
    
    RET ;RETURN
ENDP
;***************************************************
END











       
        JMP PREGUNTARDESTINATARIO
SIGUELE_GERRY:        
    INC SI
    INC DI
    POP CX
LOOP CICLO_GUARDAR_GERRY

    ;CREAR EL ARCHIVO DE JOSE
    CREAR_ARCHIVO RUTAGERRY,32
;ESCRIBIR EN EL ARCHIVO 
    ABRIR_ARCHIVO RUTAGERRY,2
    ESCRIBIR_ARCHIVO ID,71,MENSAJER
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

;--- LATITUD
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
    
;--- LONGITUD
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
    JE VENTANA_ENVIADO
    CMP EO, 'O'
    JE VENTANA_ENVIADO
JMP REPEO
;========================================================
;                   VENTANA ENVIADO/LLEGADO
;========================================================
VENTANA_ENVIADO:
MOV CX,25
MOV RENGLON, 0
FONDOENVIADO:
    PUSH CX
    IMP_CAD_COLOR LINEA, 80, RENGLON, 0, 0, 00FH, 0
        INT 10H        
        INC RENGLON
    POP CX   
LOOP FONDOENVIADO

ENCABEZADO_Y_PIE


IMP_CAD_COLOR  FIRULAIS, 294, 5, 15, 0, 0F0H, 0
IMP_CAD_COLOR  ENVIADO, 279, 12, 15, 0, 0F0H, 0

;**** VUELTAS EN SENTIDO HORARIO ****
;MOVEMOS A BX, VUELTA_HORARIO
MOV BX, OFFSET VUELTA_HORARIO   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_HORARIO:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI�N DE QUE 
    ;EST� FUNCIONANDO CORRECTAMENTE
    WAIT1:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT1 ;SI EQUIVALE A CERO SEGUIR� ESPERANDO
    ;SI YA EST� LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI�N AL MOTOR
    ;INCREMENTA LA POSICI�N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI� LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET� 4 PASOS REGRESA 
                ;A LA POSICI�N INICIAL
               
    JC  SIGUIENTE_PASO_HORARIO 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 8
    JBE SIGUIENTE_PASO_HORARIO
    
;*** VUELTAS EN SENTIDO ANTIHORARIO ***
;MOVEMOS A BX, VUELTA_ANTI
MOV BX, OFFSET VUELTA_ANTI   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_ANTIHORARIO:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI�N DE QUE 
    ;EST� FUNCIONANDO CORRECTAMENTE
    WAIT2:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT2 ;SI EQUIVALE A CERO SEGUIR� ESPERANDO
    ;SI YA EST� LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI�N AL MOTOR
    ;INCREMENTA LA POSICI�N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI� LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET� 4 PASOS REGRESA 
                ;A LA POSICI�N INICIAL
               
    JC  SIGUIENTE_PASO_ANTIHORARIO 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 5
    JBE SIGUIENTE_PASO_ANTIHORARIO


;**** VUELTAS EN SENTIDO HORARIO ****
;MOVEMOS A BX, VUELTA_HORARIO
MOV BX, OFFSET VUELTA_HORARIO   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_HORARIO1:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI�N DE QUE 
    ;EST� FUNCIONANDO CORRECTAMENTE
    WAIT3:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT3 ;SI EQUIVALE A CERO SEGUIR� ESPERANDO
    ;SI YA EST� LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI�N AL MOTOR
    ;INCREMENTA LA POSICI�N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI� LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET� 4 PASOS REGRESA 
                ;A LA POSICI�N INICIAL
               
    JC  SIGUIENTE_PASO_HORARIO1 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 8
    JBE SIGUIENTE_PASO_HORARIO1


    IMP_CAD_COLOR   LLEGADO, 364, 12, 15, 0, 0F2H, 0
    IMP_CAD_COLOR   MSJFUNCION,31,20,20,0,0F2H,0
ENTER:
    ;CURSOR ENTER
    MOV AH,2
    MOV DH,20
    MOV DL,52
    MOV BH,0
    INT 10H
    ;Esperar ENTER
            MOV AH,0
            INT 16H
            MOV RASTREO, AH ;RECUPERAR
  
        CMP RASTREO, 1CH
        JE IMPRIMIR_CADENA
JMP ENTER
;======================================================
;           IMPRIMIR_MENSAJE
;======================================================
IMPRIMIR_CADENA:
     
 MOV CX,0  ; LIMPIAR CX
 MOV CL,MENSAJE[1] ;CANTIDAD DE CARACTERES A IMPRIMIR DE <MENSAJE>
 MOV SI,2 
IMPRIMIR:    
       MOV AH, 5       ; INTERRUPCION PARA IMPRIMIR
       MOV DL, MENSAJE[SI] ;CARACTER A  IMPRIMIR  
       INT 21H
       INC SI
LOOP IMPRIMIR 
    
    MOV AH, 5       ; IBTERRUPCION PARA IMPRIMIR
    MOV DL, 0AH ;caracter a imprimir  
    INT 21H     
       
    MOV AH, 5       ; IBTERRUPCION PARA IMPRIMIR
    MOV DL, 0DH ;caracter a imprimir  
    INT 21H  ; total de caracteres 
            
MOV CX,0  ;LIMPIAR CX
MOV CL,MENSAJE2[1] ;CANTIDAD DE CARACTERES A IMPRIMIR DE <MENSAJE2> 
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











       