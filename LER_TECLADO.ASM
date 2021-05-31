start:	MOV	BL,C0	; Primeiro endereço da memória de vídeo
loop:	IN	00	; Captura um caracter do teclado
	CMP	AL,0D	; Compara o valor lido do teclado com o ASCII do "Enter"
	JZ	fim	; Se iguais, desvia para a linha de rótulo "fim"

	CMP 	AL, 18	; Compara o valor lido do teclado com o ASCII DE "CTRL-X"
	JZ 	fim	; Se iguais, desvia para a linha de rótulo "fim"

	CMP 	AL,08	; Compara o valor lido do teclado com o ASCII DE "BACKSPACE"
	JZ	bk	; Se iguais, desvia para a linha de rótulo "bk"

	MOV	[BL],AL	; Guarda o valor lido do teclado na memória de vídeo

	CMP	BL,FF	; Verifique se já coloquei um dado na última posição da memória de vídeo			
	JZ	ff	; Se BL contém FF, DESVIA PARA A LINHA DE ROTULO "FF"

	INC	BL	; Incrementa o apontador de endereços (BL)
	JMP	loop	; Captura um novo dado do teclado

bk:	MOV 	AL,00	; COPIA O VALOR VAZIO PARA AL
	DEC	BL	; DECRESCE O ENDEREÇO DE BL
	MOV	[BL],AL	; COPIA O VALOR DE AL(VAZIO) PARA O ENDEREÇO DE BL
	JMP	loop	; RETORNA PARA A LINHA DE ROTULO "LOOP"

ff: 	MOV	AL,00	; COPIA O VALOR VAZIO PARA AL
	MOV     [BL], AL; COPIA O VALOR DE AL(VAZIO) PARA O ENDEREÇO DE BL
	DEC	BL	; DECRESCENTA BL
	CMP 	BL, C0	; VERIFICA SE BL TEM C0
	JS	start	; SE S FOR 1, PULA PARA A LINHA DE ROTULO "START"
	JMP	ff	; RETORNA PARA A LINHA DE ROTULO "FF"

	
fim:	END		; Encerra o programa

	