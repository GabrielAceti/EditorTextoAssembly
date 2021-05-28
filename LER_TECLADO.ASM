	MOV	BL,C0	; Primeiro endereço da memória de vídeo
loop:	IN	00	; Captura um caracter do teclado
	CMP	AL,0D	; Compara o valor lido do teclado com o ASCII do "Enter"
	JZ	fim	; Se iguais, desvia para a linha de rótulo "fim"

	CMP 	AL,08
	JZ	bk

	MOV	[BL],AL	; Guarda o valor lido do teclado na memória de vídeo
	CMP	BL,FF	; Verifique se já coloquei um dado na última
			; posição da memória de vídeo
	JZ	fim	; Se BL contém FF, encerrar o programa
	INC	BL	; Incrementa o apontador de endereços (BL)
	JMP	loop	; Captura um novo dado do teclado

bk:	MOV 	AL,00
	DEC	BL
	MOV	[BL],AL	
	JMP	loop
	
fim:	END		; Encerra o programa

	