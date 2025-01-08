.386
.model flat,c
.data
	niz db 1, 5, 4, 6, 6, 2, 6, 7
	n dd 8
	rez dd ?			; ocekujemo 3
.stack 4096
.code
brojPojavljivanja proc

    mov ebp,esp            ; Registar ESP Stack Pointer, sluzi za adresiranje stecka, kada napravimo stack 
	                       ; on pokazuje na prvu memorijsku lokaciju u stacku (stack je memorija)
	                       ; Stavljanjem mov ebp,esp EBP postaje referentna dacka (dno stack-a) dok ESP (stack pointer) pokazuje uvek na vrh stack-a


	pushfd                 ; Stavljamo flegove na stack
	pushad                 ; Stavljamo registre opste namene na stack (ebx,ecx...)

	mov ecx, [ebp + 8]     ; ecx = n
	mov esi, 0             ; rez = 0

petlja:

	  cmp [eax], dl
	  jne preskoci
	  inc esi              ; rez++

preskoci:

	  inc eax
	  loop petlja

	mov [ebx], esi         ; Broj ponavljanja vrednost koji je u registru ESI, stavljamo u memorijsku adresu [EBX]

	popad
	popfd
	ret 4                  ; Oslobadjamo 4 bajta jer Niz je 32b == 4 bajta

brojPojavljivanja endp

main proc

lea eax,niz                ; u eax smestamo adresu niza
push n                     ; prosledjujemo broj el. niza putem steka kao argument
lea ebx, rez               ; Smestamo u ebx adresu promenljive REZ (gde je broj pojavljivanja)
mov dl, 6
call brojPojavljivanja

ret                        ; vracanje iz glavnog programa

main endp
end main
