include irvine32.inc

; ----------------Datos----------------
; Algunas varibales poseen numeros haciedo referencia a la pregunta del ejercicio
.data
    ; Datos del primer ejercicio
    holaMundoMsg BYTE "Hola Mundo", 0

    ; Datos del segundo ejercicio
    enterMsg BYTE "Presione enter para continuar", 0
    enterPresionadoMsg BYTE "Enter presionado", 0
    enterKey BYTE 0Dh

    ; Datos del tercer ejercicio
    numero2Msg BYTE "Ingrese un numero: ", 0
    numeroParMsg BYTE "El numero es par", 0
    numeroImparMsg BYTE "El numero es impar", 0
    number2 DWORD ?

    ; Datos el cuarto ejercicio
    primerNumeroMsg BYTE "Ingrese el primer numero: ", 0
    segundoNumeroMsg BYTE "Ingrese el segundo numero: ", 0
    operacionMsg BYTE "Ingrese la operacion a realizar (+ o -): ", 0
    numero1 SDWORD ?
    numero2 SDWORD ?
    operacion BYTE ?
    resultado SDWORD ?

    ; Mensaje del menu principal
    menuMsg BYTE "Menu principal", 0

    ; Mensaje de las opciones del menu
    menuOpcion1Msg BYTE "1. Hola Mundo", 0
    menuOpcion2Msg BYTE "2. Presione enter", 0
    menuOpcion3Msg BYTE "3. Numero par o impar", 0
    menuOpcion4Msg BYTE "4. Suma o resta", 0
    menuOpcion9Msg BYTE "9. Salir", 0
    invalidOptionMsg BYTE "Opcion invalida", 0

.code
    ; ----------------Primer ejercicio----------------
    holaMundo PROC
        mov edx, OFFSET holaMundoMsg
        call WriteString
        call Crlf 
        ret
    holaMundo ENDP

    ; ----------------Segundo ejercicio----------------
    enterPress PROC
        call Crlf
        mov edx, OFFSET enterMsg
        call WriteString
        call ReadChar
        cmp al, 0Dh
        je enterPresionado ;Jump if equal
        jmp enterPress

    enterPresionado:
        call Crlf
        mov edx, OFFSET enterPresionadoMsg
        call WriteString
        call Crlf
        ret
    enterPress ENDP

    ; ----------------Tercer ejercicio----------------
    numeroParImpar PROC
        mov edx, OFFSET numero2Msg
        call WriteString

        call ReadInt ; Lee el numero ingresado por el usuario
        mov number2, eax ; Guarda el numero ingresado en la variable number2

        mov eax, number2 ; Mueve el numero ingresado a eax
        and eax, 1 ; Realiza la operacion AND con 1
        cmp eax, 0 ; Compara el resultado con 0
        je numeroPar ; Si es igual a 0, el numero es par
        jmp numeroImpar ; Si no, el numero es impar

        numeroPar:
            mov edx, OFFSET numeroParMsg
	        call WriteString
            call Crlf
            jmp fin
        numeroImpar:
            mov edx, OFFSET numeroImparMsg
	        call WriteString
            call Crlf
			jmp fin

        fin: ; Salto para terminar el programa
			call Crlf
    numeroParImpar ENDP

    ;----------------Cuarto ejercicio----------------
	sumaResta PROC
        mov edx, OFFSET primerNumeroMsg
        call WriteString

        call ReadInt
        mov numero1, eax

        mov edx, OFFSET segundoNumeroMsg
        call WriteString

        call ReadInt
        mov numero2, eax

        mov edx, OFFSET operacionMsg
        call WriteString

        call ReadChar
        mov operacion, al

        cmp operacion, '+'
        je suma

        cmp operacion, '-'
        je resta

        jmp fin

        suma:
			mov eax, numero1
			add eax, numero2
			mov resultado, eax
			jmp fin

        resta:
            mov eax, numero1
            sub eax, numero2
            mov resultado, eax
            jmp fin

        fin:
            call Crlf
			mov edx, OFFSET resultado
			call WriteInt
			call Crlf
			
    sumaResta ENDP


   	
    
main PROC
	; Mostrar el menu principal
    mov edx, OFFSET menuMsg
    call WriteString
    call Crlf

    ; Preguntar al usuario la opcion 
    mov edx, OFFSET menuOpcion1Msg
    call WriteString
	call Crlf
    mov edx, OFFSET menuOpcion2Msg
    call WriteString
    call Crlf
    mov edx, OFFSET menuOpcion3Msg
    call WriteString
	call Crlf
    mov edx, OFFSET menuOpcion4Msg
	call WriteString
    call Crlf
	mov edx, OFFSET menuOpcion9Msg
    call WriteString
    call Crlf
    call ReadInt

    ; if (opcion == 1) runHolaMundo()
    cmp eax, 1
    je runHolaMundo

    ; if (opcion == 2) runEnter()
    cmp eax, 2
    je runEnter

    ; if (opcion == 3) runNumeroParImpar()
    cmp eax, 3
    je numeroParImpar

    ; if (opcion == 4) runSumaResta()
	cmp eax, 4
    je sumaResta

    ; if (opcion == 9) salir()
    cmp eax, 9
    jmp salir

     ; Opción inválida
    mov edx, OFFSET invalidOptionMsg
    call WriteString
    jmp main


runHolaMundo:
    call holaMundo
    jmp main

runEnter:
    call enterPress
    jmp main

runNumeroParImpar:
	call numeroParImpar
	jmp main

runSumaResta:
	call sumaResta
	jmp main

salir:
    exit

main ENDP

end main