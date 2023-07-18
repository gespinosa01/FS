;*******************************************
; Unidad 2.- 10 jul 2023
;
;Nombre:Jose Manuel Vazquez Mendez      Verano 2023
;Guardar como:MenuVcetores.asm
;-------------------------------------------
;Tema:LOOP,colores, relleno, vectores y flechas
;
;--------------------------------------------    
;INSTRUCCIONES:
;PARTE 1.DISEÑO DE INTERFAZ
;PARTE 2.FUNCIONAMIENTO
;**********************************************
.MODEL SMALL
.STACK
.DATA 
    
   RENGLON        DB 0
   linea          db 80 dup(176) ;reserva 80 bytes con el caracter 219
   ;-----Variables para diseño----------------------------------------
   msjVect db ' v1     v2     v3 ';18
   msjVec  db '[ ]    [ ]    [  ]';18
   ;--Vectores
   v1           db 0,0,0,0
   v2           db 0,0,0,0
   v3           db 0,0,0,0,0,0,0,0
                  ;d u d u d u d u
   ;--Menu
   msjMenu      db '--Men',163,'-';13
   msjOpsuma    db '1.Suma       '
   msjOpresta   db '2.Resta      '
   msjOpMul     db '3.Multi      '
   msjOpdiv     db '4. div       ' 
   msjOpcion    db 'Opc     [   ]'
   opcion       db 0,'$'  
   diferencia   db 0,'$'
.CODE 
   
INICIO: MOV AX,@DATA
        MOV DS,AX 
        MOV ES,AX
         
        MOV CX,25  
;-----------LINEA----------------------------------------------
CICLOLINEA:
        PUSH CX 
            MOV AH,19
            LEA BP,linea;CADENA
            MOV CX,80       ;LONGITUD
            MOV DH,RENGLON        ;RENGLON
            MOV DL,0       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0CH         ;COLOR
            INT 10H 
        POP CX
        INC RENGLON
        LOOP CICLOLINEA  
        ;---DISEÑO INTERFAZ
        MOV AH,19
            LEA BP,msjVect;CADENA
            MOV CX,18       ;LONGITUD
            MOV DH,5        ;RENGLON
            MOV DL,40       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,07H         ;COLOR
            INT 10H 
        
        MOV AH,19
            LEA BP,msjVec;CADENA
            MOV CX,18       ;LONGITUD
            MOV DH,7        ;RENGLON
            MOV DL,40       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H 
         MOV AH,19
            LEA BP,msjVec;CADENA
            MOV CX,18       ;LONGITUD
            MOV DH,9        ;RENGLON
            MOV DL,40       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
            
          MOV AH,19
            LEA BP,msjVec;CADENA
            MOV CX,18       ;LONGITUD
            MOV DH,11        ;RENGLON
            MOV DL,40       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
          
          MOV AH,19
            LEA BP,msjVec;CADENA
            MOV CX,18       ;LONGITUD
            MOV DH,13        ;RENGLON
            MOV DL,40       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
         ;----------------DESPLIEGUE DE MEU------------------
          MOV AH,19
            LEA BP,msjMenu   ;CADENA
            MOV CX,13       ;LONGITUD
            MOV DH,5        ;RENGLON
            MOV DL,7       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H 
            
          MOV AH,19
            LEA BP,msjOpsuma   ;CADENA
            MOV CX,13       ;LONGITUD
            MOV DH,9        ;RENGLON
            MOV DL,7       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
          
          MOV AH,19
            LEA BP,msjOpresta   ;CADENA
            MOV CX,13       ;LONGITUD
            MOV DH,11        ;RENGLON
            MOV DL,7       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
          
          MOV AH,19
            LEA BP,msjOpMul   ;CADENA
            MOV CX,13       ;LONGITUD
            MOV DH,13        ;RENGLON
            MOV DL,7       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
             
          MOV AH,19
            LEA BP,msjOpdiv   ;CADENA
            MOV CX,13       ;LONGITUD
            MOV DH,15        ;RENGLON
            MOV DL,7       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H
            
           MOV AH,19
            LEA BP,msjOpcion   ;CADENA
            MOV CX,13       ;LONGITUD
            MOV DH,18        ;RENGLON
            MOV DL,7       ;COLUMNA
            MOV BH,0        ;PAGINA
            MOV AL,0        ;- (MODO CERO - CARACTERES CON COLOR)
            MOV BL,0C7H         ;COLOR
            INT 10H 
            
;--------------------------------------------------------------------------
;=============================FUNCIONAMIENTO===============================
;--------------------------------------------------------------------------   
cicloTecla:
            MOV AH,2  
            MOV DH,18        ;RENGLON
            MOV DL,17       ;COLUMNA
            MOV BH,0        ;PAGINA       
            INT 10H 
                MOV AH,1
                INT 21H
                    MOV opcion,AL
            ;-----CAPTURA DE V1 y V2
            MOV CX,4  ;4 Elementos 
            mov SI,0 
            MOV RENGLON,7
CAPTURA:
        PUSH CX
     
             ;cursor
             MOV AH,2
             MOV DH,RENGLON
             MOV DL,41
             MOV BH,0
             ;esperar elementos
             INT 10H
                MOV AH,1
                INT 21H
                    MOV v1[SI],AL
                    SUB v1[SI],30H
           
           ;----->>>>>>  
           ;cursor
             MOV AH,2
             MOV DH,RENGLON
             MOV DL,48
             MOV BH,0
             ;esperar elementos
             INT 10H
                MOV AH,1
                INT 21H
                    MOV v2[SI],AL 
                    SUB v2[SI],30H
           ;----->>>>>>
                    
        INC RENGLON 
        INC RENGLON
        INC SI
             
        POP CX
        LOOP CAPTURA
             
            ;-----(switch) 
            CMP opcion,'1'
            JE sumar
            CMP opcion,'2'
            JE restar
            CMP opcion,'3'
            JE multi
            CMP opcion,'4'
            JE division
            CMP opcion,'.'
            JE fin 
            JMP cicloTecla
            
;---------------------SUMAR-----------------------------            
sumar:      
    MOV CX,4
    MOV SI,0
    MOV DI,0
ciclosuma:
   push cx  
    MOV AX,0 ;inicializacion
    MOV BX,0 ;inicializacion
        MOV AL,v1[SI]
        MOV BL,v2[SI]
        ADD AL,BL 
            AAA ;AJUSTE AH= DECENAS y AL = UNIDADES 
            ADD AX,3030H ;Ajuste ASCII
       MOV v3[DI],AH
        INC DI
       MOV V3[DI],AL
        INC DI
   INC SI
   pop cx
   loop ciclosuma
JMP imprimeV3 
;===========================RESTAR======================   
restar: 
MOV CX, 4
MOV SI, 0
MOV DI, 0

cicloresta:
    PUSH CX
    MOV AX, 0 ; Inicialización
    MOV BX, 0 ; Inicialización
    MOV AL, v1[SI]
    MOV BL, v2[SI]
    SUB AL, BL

    CMP AL, 0 ; Compara si AL es negativo
    JGE positivo
       
       
    NEG AL ; Negativo
    ADD AL,30H ; Ajuste ASCII
    MOV v3[DI], 2Dh ; Signo negativo '-'
    INC DI
    MOV V3[DI],AL
      INC DI

positivo:
    ADD AL,30H ; Ajuste ASCII
    MOV v3[DI],AH
      INC DI
    MOV V3[DI],AL
      INC DI

INC SI
POP CX
LOOP cicloresta
JMP imprimeV3 
;===========================multiplicar======================
multi: 
    MOV CX,4
    MOV SI,0
    MOV DI,0
ciclomulti: 
    push cx     
     MOV AX,0
     MOV BX,0 
        MOV AL,v1[SI]
        MOV BL,v2[SI]
            MUL BL
            ;ajuste para decenas y unidades
            AAM ;ajuste despues de la multiplicacion
            ;AH - decenas
            ;Al - unidades
            ADD AX,3030H
           MOV v3[DI],AH
            INC DI
           MOV V3[DI],AL
            INC DI
      INC SI
      pop cx
   loop ciclomulti
JMP imprimeV3 

division:   JMP imprimeV3 

imprimeV3: 
    MOV DI,0
    MOV CX,4 
    MOV RENGLON,7 
cicloV3:
    PUSH CX
       MOV AH,2     ;CURSOR
       MOV DH,RENGLON
       MOV DL,55 ;COLUMNA 
       MOV BH,0
       INT 10H
            MOV AH,9    ;CARACTER CON COLOR
            MOV CX,1
            MOV AL,v3[DI]  ;DECENA
            MOV BL,0CFH 
            MOV BH,0
            INT 10H
       
     INC DI
     ;----->>>>>>>>
     MOV AH,2     ;CURSOR
       MOV DH,RENGLON
       MOV DL,56   ;COLUMNA
       MOV BH,0
       INT 10H
            MOV AH,9    ;CARACTER CON COLOR
            MOV CX,1
            MOV AL,v3[DI] ;UNIDAD
            MOV BL,0CFH
            MOV BH,0
            INT 10H 
       INC DI
       
       INC RENGLON
       INC RENGLON        
    POP CX
    LOOP cicloV3
          JMP cicloTecla    

            
FIN: MOV AX,4C00H
     INT 21H

END