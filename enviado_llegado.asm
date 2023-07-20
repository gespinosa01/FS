.MODEL SMALL
.STACK
.DATA
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
CONTADOR        DB  0


VUELTA_HORARIO  DB  0000_0110B  ;6H - 6
                DB  0000_0100B  ;4H - 4
                DB  0000_0011B  ;3H - 3
                DB  0000_0010B  ;2H - 2



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
ESLOGAN         DB      'FIRULAIS SOLOVINO - EL MENSAJERO DE ESPERANZA'
    NOMBRE1     DB      'GERARDO ESPINOSA ROSAS';22   
    NOMBRE2     DB      'GADYEL JOSUE M',160,'RTINEZ G',163,'ZMAN';28
    NOMBRE3     DB      'JOS',130,' MANUEL V',160,'ZQUEZ M',130,'NDEZ';26
    MATERIA     DB      'LENGUAJEZ DE INTERFAZ';21
    MAESTRA     DB      'MA. ELENA PARRA UR',161,'AS';21
    PROYECTO    DB      'PROYECTO FINAL';14
    LINEA           DB  80  DUP(219)
    MSJFUNCION  DB      '[PRESIONA ENTER PARA CONTINUAR]';31
    RENGLON     DB   0
    RASTREO     DB   0
.CODE
MOV AX, @DATA
MOV DS, AX
MOV ES, AX
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

#START=STEPPER_MOTOR.EXE#

;MOVEMOS A BX, VUELTA_HORARIO
    MOV BX, OFFSET VUELTA_HORARIO   ;INICIAMOS DESDE LA POSICION
    MOV SI, 0
    MOV CX, 0   ;CONTADOR DE PASOS 
    MOV CONTADOR, 0
SIGUIENTE_PASO:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACIÓN DE QUE 
    ;ESTÉ FUNCIONANDO CORRECTAMENTE
    WAIT:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT ;SI EQUIVALE A CERO SEGUIRÁ ESPERANDO
    ;SI YA ESTÁ LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICIÓN AL MOTOR
    ;INCREMENTA LA POSICIÓN
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DIÓ LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLETÓ 4 PASOS REGRESA 
                ;A LA POSICIÓN INICIAL
               
    JC  SIGUIENTE_PASO 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 14
    JBE SIGUIENTE_PASO
    
    IMP_CAD_COLOR   LLEGADO, 364, 12, 15, 0, 0F2H, 0
    IMP_CAD_COLOR   MSJFUNCION,31,20,20,0,0F2H,0
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
        JE VENTANA_ENVIADO
FIN:    
        MOV AX, 4C00H
        INT 21H
END