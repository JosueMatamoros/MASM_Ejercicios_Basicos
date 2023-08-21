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

    ; Datos del quinto ejercicio
    positivoMsg BYTE "El numero es positivo", 0
    negativoMsg BYTE "El numero es negativo", 0

    ; <<<<<<< utilizo las mismas variables del cuarto ejercicio >>>>>>> numero1, numero2 , resultado 

    ; Datos del sexto ejercicio
    numeroDosCifrasMsg BYTE "Ingrese un numero de dos cifras: ", 0
    elNumeroIngresadoMsg BYTE "El numero ingresado es: ", 0
    
    ; <<<<<<< Utilizo la misma variable del tercer ejercicio (numero1) >>>>>>>> numero1 SDWORD ?

    ; Datos del septimo ejercicio
    palabraMsg BYTE "La palbra es: ", 0
    palabraPredeterminada BYTE "Hola", 0
    contadorVocales DWORD ?
    cantidadVocalesMsg BYTE "La cantidad de vocales es: ", 0

; Datos del octavo ejercicio
	horaMsg BYTE "La hora predeterminada es: ", 0
    horaStr BYTE "12:34:20", 0  ; Hora en formato HH:MM:SS
    totalSegundosMsg BYTE "La cantidad de segundos es: ", 0
    totalSegundos DWORD ?

    ; Mensaje del menu principal
    menuMsg BYTE "Menu principal", 0

    ; Mensaje de las opciones del menu
    menuOpcion1Msg BYTE "1. Hola Mundo", 0
    menuOpcion2Msg BYTE "2. Presione enter", 0
    menuOpcion3Msg BYTE "3. Numero par o impar", 0
    menuOpcion4Msg BYTE "4. Suma o resta", 0
    menuOpcion5Msg BYTE "5. Numero positivo o negativo", 0
    menuOpcion6Msg BYTE "6. Guardar y mostrar numero de dos cifras", 0
    menuOpcion7Msg BYTE "7. Contar vocales", 0
    menuOpcion8Msg BYTE "8. Cantidad de segundos", 0
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
            ret

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
            ret
			
    sumaResta ENDP

    ;----------------Quinto ejercicio----------------
    positivoNegativo PROC
        mov edx , OFFSET primerNumeroMsg
        call WriteString

        call ReadInt
        mov numero1, eax

        mov edx, OFFSET segundoNumeroMsg
        call WriteString

        call ReadInt
        mov numero2, eax

        mov eax, numero1
        sub eax, numero2

        mov resultado, eax

        cmp resultado, 0
        jge positivo
        jmp negativo

        positivo:
			mov edx, OFFSET positivoMsg
			call WriteString
			jmp fin

        negativo:
			mov edx, OFFSET negativoMsg
            call WriteString
			jmp fin

		fin:
            call Crlf
            ret

    positivoNegativo ENDP

     ;----------------Sexto ejercicio----------------
     numeroDosCifras PROC
        mov edx, OFFSET numeroDosCifrasMsg
        call WriteString
        call Crlf
    
        call ReadInt
        mov numero1, eax ; Se almacena en una variable el numero ingresado por el usuario

        mov edx, OFFSET elNumeroIngresadoMsg
		call WriteString

        mov eax, numero1 ; Se mueve el numero ingresado a eax
        call WriteDec ; Se escribe el numero ingresado por el usuario
        call Crlf
        ret
     numeroDosCifras ENDP

    ;----------------Septimo ejercicio----------------
    cantidadVocales PROC
        mov edx, OFFSET palabraMsg
		call WriteString
        
        mov edx, OFFSET palabraPredeterminada
        call WriteString
		call Crlf

        mov esi , OFFSET palabraPredeterminada ; Puntero a la palabra predeterminada
        mov ecx , 0 ; Contador de vocales

        countLoop:
            mov al, [esi]          ; Cargar el carácter actual en AL
            cmp al, 0              ; Comprobar si es el final de la cadena
            je countDone            ; Si es el final, salir del bucle
    
            cmp al, 'a'            ; Comprobar si es 'a'
            je incrementCounter
            cmp al, 'e'            ; Comprobar si es 'e'
            je incrementCounter
            cmp al, 'i'            ; Comprobar si es 'i'
            je incrementCounter
            cmp al, 'o'            ; Comprobar si es 'o'
            je incrementCounter
            cmp al, 'u'            ; Comprobar si es 'u'
            je incrementCounter

        jmp continueLoop

        incrementCounter:
            inc ecx                ; Incrementar el contador de vocales

        continueLoop:
            inc esi                ; Avanzar al siguiente carácter
            jmp countLoop

        countDone:
            mov contadorVocales, ecx ; Guardar el contador de vocales en la variable
            mov edx, OFFSET cantidadVocalesMsg
            call WriteString
            mov eax, contadorVocales
            call WriteDec
            call Crlf
            ret

    cantidadVocales ENDP

    ;---------------- Octavo ejercicio----------------
   	 cantidadSegundos PROC
        mov edx, OFFSET horaMsg
        call WriteString
        
        mov edx, OFFSET horaStr
        call WriteString
		call Crlf

        mov esi, OFFSET horaStr ; Puntero a la cadena de hora

        ; Convertir el primer dígito de las horas a segundos (36000 segundos por hora)
        mov al, [esi]        ; Cargar el primer dígito de las horas
        sub al, '0'          ; Convertir el dígito de ASCII a valor numérico
        movzx eax, al        ; Extender el valor a un DWORD
        imul eax, 10         ; Multiplicar por 10
        imul eax, 3600       ; Multiplicar por 3600 para convertir a segundos

        mov totalSegundos, eax ; Almacenar el total de segundos en la variable

        ; Convertir el segundo dígito de las horas a segundos (3600 segundos por hora)
        mov al, [esi+1]      ; Cargar el segundo dígito de las horas
        sub al, '0'          ; Convertir el dígito de ASCII a valor numérico
        movzx ecx, al        ; Extender el valor a un DWORD
        imul ecx, 3600       ; Multiplicar por 3600 para convertir a segundos

        ; Sumar segundos del segundo dígito de las horas al total de segundos
        add totalSegundos, ecx

        ; Convertir el primer dígito de los minutos a segundos (60 segundos por minuto)
        mov al, [esi+3]      ; Cargar el primer dígito de los minutos
        sub al, '0'          ; Convertir el dígito de ASCII a valor numérico
        movzx edx, al        ; Extender el valor a un DWORD
        imul edx, 10         ; Multiplicar por 10
        imul edx, 60         ; Multiplicar por 60 para convertir a segundos

        ; Sumar segundos del primer dígito de los minutos al total de segundos
        add totalSegundos, edx

        ; Convertir el segundo dígito de los minutos a segundos (60 segundos por minuto)
        mov al, [esi+4]      ; Cargar el segundo dígito de los minutos
        sub al, '0'          ; Convertir el dígito de ASCII a valor numérico
        movzx eax, al        ; Extender el valor a un DWORD
        imul eax, 60         ; Multiplicar por 60 para convertir a segundos

        ; Sumar segundos del segundo dígito de los minutos al total de segundos
        add totalSegundos, eax

        ; Convertir el primer dígito de los segundos a segundos (10 segundos por segundo)
        mov al, [esi+6]      ; Cargar el primer dígito de los segundos
        sub al, '0'          ; Convertir el dígito de ASCII a valor numérico
        movzx ecx, al        ; Extender el valor a un DWORD
        imul ecx, 10         ; Multiplicar por 10 para convertir a segundos

        ; Sumar segundos del primer dígito de los segundos al total de segundos
        add totalSegundos, ecx

        ; Convertir el segundo dígito de los segundos a segundos (1 segundo por segundo)
        mov al, [esi+7]      ; Cargar el segundo dígito de los segundos
		sub al, '0'          ; Convertir el dígito de ASCII a valor numérico
        movzx edx, al        ; Extender el valor a un DWORD
		add totalSegundos, edx ; Sumar segundos del segundo dígito de los segundos al total de segundos

        ; Mostrar el total de segundos
        mov edx, OFFSET totalSegundosMsg
        call WriteString
        mov eax, totalSegundos
        call WriteDec
        call Crlf
        ret
     cantidadSegundos ENDP

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
    mov edx, OFFSET menuOpcion5Msg
    call WriteString
	call Crlf
    mov edx, OFFSET menuOpcion6Msg
	call WriteString
    call Crlf
    mov edx, OFFSET menuOpcion7Msg
	call WriteString
	call Crlf
    mov edx, OFFSET menuOpcion8Msg
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
    je runNumeroParImpar

    ; if (opcion == 4) runSumaResta()
	cmp eax, 4
    je runSumaResta

    ; if (opcion == 5) runNumeroPositivoNegativo()
	cmp eax, 5
    je runNumeroPositivoNegativo

    ; if (opcion == 6) runNumeroDosCifras()
    cmp eax, 6
	je runNumeroDosCifras

    ; if (opcion == 7) runCantidadVocales()
    cmp eax, 7
	je runCantidadVocales

    ; if (opcion == 8) runCantidadSegundos()
    cmp eax, 8
	je runCantidadSegundos


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

runNumeroPositivoNegativo:
	call positivoNegativo
	jmp main

runNumeroDosCifras:
	call numeroDosCifras
	jmp main

runCantidadVocales:
	call cantidadVocales
	jmp main

runCantidadSegundos:
	call cantidadSegundos
	jmp main

salir:
    exit

main ENDP

end main