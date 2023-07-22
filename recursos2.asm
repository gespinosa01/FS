 #START=STEPPER_MOTOR.EXE#
.MODEL SMALL
.STACK
.DATA  
        VUELTA_HORARIO  DB  0000_0110B  ;6H - 6
                            DB  0000_0100B  ;4H - 4
                            DB  0000_0011B  ;3H - 3
                            DB  0000_0010B  ;2H - 2
            VUELTA_ANTI     DB 0000_0011B   ;3H - 3
                            DB 0000_0001B   ;1H - 1
                            DB 0000_0110B   ;6H - 6
                            DB 0000_0010B   ;2H - 2 
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
    CONTADOR    DB  0
    linea          db 80 dup(219) ;reserva 80 bytes con el caracter 219
    imagenabrir DB 10,13,'       ',219,219,219,'    ',10,13
                DB '      ',219,'   ',219,'   ',10,13
                DB '      ',219,'   ',219,'   ',10,13
                DB '           ',219,'  ',10,13
                DB '    ',219,219,219,219,219,219,219,219,219,' ',10,13
                DB '   ',219,219,219,219,219,219,219,219,219,219,219,10,13 
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13 
                DB '   ',219,219,219,219,'   ',219,219,219,219,10,13 
                DB '   ',219,219,219,219,'   ',219,219,219,219,10,13 
                DB '   ',219,219,219,219,'   ',219,219,219,219,10,13 
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13 
                DB '    ',219,219,219,219,219,219,219,219,219,' ',10,13  
                
   imagencerrar DB 10,13,'       ',219,219,219,'    ',10,13
                DB '      ',219,'   ',219,'   ',10,13
                DB '      ',219,'   ',219,'   ',10,13
                DB '     ',219,'     ',219,'  ',10,13
                DB '    ',219,219,219,219,219,219,219,219,219,' ',10,13
                DB '   ',219,219,219,219,219,219,219,219,219,219,219,10,13 
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13 
                DB '   ',219,219,219,219,'   ',219,219,219,219,10,13 
                DB '   ',219,219,219,219,'   ',219,219,219,219,10,13 
                DB '   ',219,219,219,219,'   ',219,219,219,219,10,13 
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13
                DB '   ',219,219,219,219,219,' ',219,219,219,219,219,10,13 
                DB '    ',219,219,219,219,219,219,219,219,219,' ',10,13            
                 
     blanco     DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13
                DB '                                                                        ',10,13          
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
    LEA BP, imagenabrir
    MOV CX, 225
    MOV DH, 3    ;renglon
    MOV DL, 3    ;columna
    MOV AL, 0    ;modo
    MOV BH, 0
    MOV BL, 0CFH
    INT 10H

        ;IMP_CAD_COLOR CADENA, LONGITUD, RENGLON, COLUMNA, MODO, COLOR, PAGINA
        IMP_CAD_COLOR msjabrir,48,7,15,0,0CFH,0 
        
        ;*** VUELTAS EN SENTIDO ANTIHORARIO ***
    ;MOVEMOS A BX, VUELTA_ANTI
    MOV BX, OFFSET VUELTA_ANTI   ;INICIAMOS DESDE LA POSICION
    MOV SI, 0
    MOV CX, 0   ;CONTADOR DE PASOS 
    MOV CONTADOR, 0
    SIGUIENTE_PASO_ANTIHORARIO:
        ;STEPPER MOTOR FUNCIONA EN EL PIN 7
        ;SE REALIZA UNA COMPROBACI?N DE QUE 
        ;EST? FUNCIONANDO CORRECTAMENTE
        WAIT2:
            IN      AL, 07H
            TEST    AL, 10000000B
            JZ  WAIT2 ;SI EQUIVALE A CERO SEGUIR? ESPERANDO
        ;SI YA EST? LISTO ENTONCES COMIENZA
        MOV AL, [BX][SI] 
        OUT 7, AL   ;LE MANDA LA NUEVA POSICI?N AL MOTOR
        ;INCREMENTA LA POSICI?N
        INC SI      
        CMP SI, 4   ;COMPARA SI YA DI? LOS 4 PASOS
                    ;YA QUE ES UN MOTOR DE 4 PASOS
                    ;SI YA COMPLET? 4 PASOS REGRESA 
                    ;A LA POSICI?N INICIAL
                   
        JC  SIGUIENTE_PASO_ANTIHORARIO 
        MOV SI, 0
        INC CONTADOR
        CMP CONTADOR, 5
        JBE SIGUIENTE_PASO_ANTIHORARIO 
        
        IMP_CAD_COLOR msj1,31,10,25,0,0CFH,0         
        IMP_CAD_COLOR msjFuncion,31,12,25,0,0CFH,0
        
        
        
        
        MOV AH,2 ;cursor
        MOV DH,20 ;renglon
        MOV DL,90 ;columna
        MOV BH,0  ;pagina
        INT 10H   
            MOV AH,0
            INT 16H
            MOV rastreo,AH ;RECUPERAR  
        
                  
        CMP rastreo,1CH 
        
         
        
        MOV AH, 19
        LEA BP, blanco
        MOV CX, 1000
        MOV DH, 3    ;renglon
        MOV DL, 3    ;columna
        MOV AL, 0    ;modo
        MOV BH, 0
        MOV BL, 0CFH
        INT 10H 
        
        MOV AH, 19
        LEA BP, imagencerrar
        MOV CX, 225
        MOV DH, 3    ;renglon
        MOV DL, 3    ;columna
        MOV AL, 0    ;modo
        MOV BH, 0
        MOV BL, 0CFH
        INT 10H
        
       
        
        IMP_CAD_COLOR msjcerrar,49,10,15,0,0CFH,0
        
         ;**** VUELTAS EN SENTIDO HORARIO ****
;MOVEMOS A BX, VUELTA_HORARIO
MOV BX, OFFSET VUELTA_HORARIO   ;INICIAMOS DESDE LA POSICION
MOV SI, 0
MOV CX, 0   ;CONTADOR DE PASOS 
MOV CONTADOR, 0
SIGUIENTE_PASO_HORARIO1:
    ;STEPPER MOTOR FUNCIONA EN EL PIN 7
    ;SE REALIZA UNA COMPROBACI?N DE QUE 
    ;EST? FUNCIONANDO CORRECTAMENTE
    WAIT3:
        IN      AL, 07H
        TEST    AL, 10000000B
        JZ  WAIT3 ;SI EQUIVALE A CERO SEGUIR? ESPERANDO
    ;SI YA EST? LISTO ENTONCES COMIENZA
    MOV AL, [BX][SI] 
    OUT 7, AL   ;LE MANDA LA NUEVA POSICI?N AL MOTOR
    ;INCREMENTA LA POSICI?N
    INC SI      
    CMP SI, 4   ;COMPARA SI YA DI? LOS 4 PASOS
                ;YA QUE ES UN MOTOR DE 4 PASOS
                ;SI YA COMPLET? 4 PASOS REGRESA 
                ;A LA POSICI?N INICIAL
               
    JC  SIGUIENTE_PASO_HORARIO1 
    MOV SI, 0
    INC CONTADOR
    CMP CONTADOR, 8
    JBE SIGUIENTE_PASO_HORARIO1 
        
        IMP_CAD_COLOR msjcerrar2,31,12,25,0,0CFH,0 
        
        
        JE Ventanarecursos
        
Ventanarecursos:
    JMP fin    
        
;---------------------------------------------------------------------
           
FIN: MOV AX,4C00H
     INT 21H
END