.386
.model flat,c
.data

  niz dd 1,7,-5,3
      dd 4,2,10,-1
      dd -2,-3,8,5
      dd 12,3,1,-9

  n dd 4
  
  rez dd ?

.code
max proc

  
  push ebp
  mov ebp,esi 

  pushfd
  pushad

  mov esi, [ebp+12]           ; u ESI je adresa 1. elementa niza
  mov edi, [edi+8]            ; u EDI se nalazi br. el. N

  mov ebx, esi                ; u EBX se sada nalazi adresa 1. elementa u nizu
  add ebx, 4                  ; EBX uvecavamo za broj bajtova koliko 1 element ima u ovom slucaju 4, sto znaci da je podatak 32b

  mov ecx, 1                  ; j = 1 
  cmp ecx, n

jge kraj1

  mov eax, [esi]              ; u EAX je vrednost koja je vrednost koja je u EAX koja je Niz[0] 1. el. niza
  cmp eax, [ebx]              ; poredjujemo 1. el. sa 2. el. niza

jae dalje

  mov esi, ebx ; jmax = j

dalje:

  inc ecx ; j++
  add ebx, 4
  jmp petlja1

kraj1;

  mov eax, [ESI]
  mov [ebp+12], eax

  popad
  popfd
  pop ebp

  ret 4

max endp
main proc

  
  LEA ECX, mat
  LEA EDI, rez

  mov edx, n
  xor ecx,ecx                ; i = 0

  mov ebx,edx                ; ebx = n
  shl ebx, 2                 ; ebx = n * 4

  petlja:

  cmp ecx, edx

  push esi
  push edi

  call max
  pop eax

  mov [edi], eax
  add eax, 4

  add esi, ebx   ; esi+= N x sirina
  inc ecx

  jmp petlja
  kraj:

  ret

main endp
end main

