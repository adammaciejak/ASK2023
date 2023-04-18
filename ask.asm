; Napisz program który w minimalnej liczbie rozkazów zasygnalizuje 
; czy w komórkach pamięci od 30H do 40H znajdują się jakakowiek jedyka czy też nie.]]]]

ORG 0000h

MOV R1, #16			; ustawiamy liczbę wykonań pętli na 16, bo tyle adresów pomiędzy 30 hex i 40 hex
MOV R0, #30h		; ustawiamy wskaźnik na pierwszy adres

LOOP:
MOV A, @R0			; wczytujemy do rejestru akumulatora wartość pod adresem na którym znajduje się wskaźnik
JNZ FOUND			; gdy A różne od 0, skocz do instrukcji FOUND
INC R0					; inkrementujemy R0, czyli przesuwamy wskaźnik na następną pozycję
DJNZ R1, LOOP		; dekrementujemy licznik pętli i skaczemy do instrukcji LOOP (zapętlamy)

NOT_FOUND:
JMP CONTINUE

FOUND:
CPL P1.7					; zapalamy diodę LED (siódmą)
JMP CONTINUE

CONTINUE:
END