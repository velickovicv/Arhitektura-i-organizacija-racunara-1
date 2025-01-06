.386
.model flat,c
.data
   niz dd 1,4,7,0,4,2,1
   n dd 7
   rezultat dd ?

.code
main proc

  lea esi, niz       ; u esi cuvamo adresu prvog el. u nizu
  xor eax,eax        ; ocistimo registar gde cemo smestati rezultat (sumu)
  xor ecx,ecx        ; i=0

  petlja:

  cmp ecx, n         ; Proveravamo uslov da li je kraj niza 
  jae kraj
  mov edx, [esi]     ; Edx dajemo adresu fix. el.
  cmp edx, 0         ; Proveravamo da li je 0
  jne dalje

  add eax, edx       ; Sumiramo element koji nije 0
  add edx, 4         ; Dodajemo 4 da bi presao na sledeci element jer 32b je zapravo 4 bajta
  inc ecx            ; i++ prelazimo na sledeci element u nizu
  mov rezultat, eax

  ret
  main endp
  end main
