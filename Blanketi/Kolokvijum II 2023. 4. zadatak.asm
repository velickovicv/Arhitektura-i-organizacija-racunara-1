.386
.model flat,c
.data 

  mat dw 5,3,1,4   ; Prva kolona
      dw 3,4,4,8   ; Druga kolona
	  dw 1,5,7,10  ; Treca kolona

  n dw 4
  m dw 3
  rez dd ?

.code
main proc

	movzx ebx, m   ; Ubacujemo M kolona
	shl ebx, 1     ; Mnozi se sa 2 da bi se nasao offset jer radimo sa 16b elementima
	movzx eax, n   ; Ubacujemo N vrsta

	sub eax, 2     ; Da bi pristupili pretposlednjoj vrsti dobicemo je kao (n-2) 
	mul ebx        ; Pomnožimo broj vrsta (eax) sa brojem bajtova po vrsti (ebx)
	               ; da bismo dobili offset do početka pretposlednje vrste

	movzx edi, word ptr mat[eax][2]     ; Dodamo 2 ([2]) jer želimo drugi element, i taj element smeštamo u edi

	movzx eax, n
	movzx ecx, m
    mul ecx      ; Racunamo broj elemenata u matrici kao N*M i broj smestamo u ecx
	mov ecx, eax   ; Moramo da izraz N*M prebacimo u ecx, jer instrukcijom mul ne menjamo registar ecx, vec menjamo akumulator
	
	xor edx, edx
	xor esi, esi 

	petlja:

	  movzx eax, word ptr mat[esi]
	  cmp eax,edi
	  jbe dalje       ;  Ako je element manji ili jednak, preskočimo

	  inc edx         ; Ako jeste veci povecamo edx++

	  dalje:

	  add esi, 2      ; Povecamo za 2 da bi presao na sledeci element
	  loop petlja

	  mov rez, edx

	  ret   ; Vracamo se u main i skidamo EIP sa stack-a

main endp
end main




