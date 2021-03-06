start:	MOV	BL,C0	; Primeiro endere�o da mem�ria de v�deo
loop:	IN	00	; Captura um caracter do teclado
	CMP	AL,0D	; Compara o valor lido do teclado com o ASCII do "Enter"
	JZ	fim	; Se iguais, desvia para a linha de r�tulo "fim"

	CMP 	AL, 18	; Compara o valor lido do teclado com o ASCII DE "CTRL-X"
	JZ 	fim	; Se iguais, desvia para a linha de r�tulo "fim"

	CMP 	AL,08	; Compara o valor lido do teclado com o ASCII DE "BACKSPACE"
	JZ	bk	; Se iguais, desvia para a linha de r�tulo "bk"

	MOV	[BL],AL	; Guarda o valor lido do teclado na mem�ria de v�deo

	CMP	BL,FF	; Verifique se j� coloquei um dado na �ltima posi��o da mem�ria de v�deo			
	JZ	ff	; Se BL cont�m FF, DESVIA PARA A LINHA DE ROTULO "FF"

	INC	BL	; Incrementa o apontador de endere�os (BL)
	JMP	loop	; Captura um novo dado do teclado

bk:	MOV 	AL,00	; COPIA O VALOR VAZIO PARA AL
	DEC	BL	; DECRESCE O ENDERE�O DE BL
	MOV	[BL],AL	; COPIA O VALOR DE AL(VAZIO) PARA O ENDERE�O DE BL
	JMP	loop	; RETORNA PARA A LINHA DE ROTULO "LOOP"

ff: 	MOV	AL,00	; COPIA O VALOR VAZIO PARA AL
	MOV     [BL], AL; COPIA O VALOR DE AL(VAZIO) PARA O ENDERE�O DE BL
	DEC	BL	; DECRESCENTA BL
	CMP 	BL, C0	; VERIFICA SE BL TEM C0
	JS	start	; SE S FOR 1, PULA PARA A LINHA DE ROTULO "START"
	JMP	ff	; RETORNA PARA A LINHA DE ROTULO "FF"

	
fim:	END		; Encerra o programa

	