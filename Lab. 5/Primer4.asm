.386
.model flat,c
.data

   x db 5
   y db 3
   rez db ?

.stack 4096
.code
saberi proc

  mov ebp,esp
  pushfd
  pushad

  move eax, [ebp+8]
  add eax, [ebp+12]
  move [ebp+12], eax

  popad
  popfd
  ret 4

saberi endp
main proc

   ; saberi dva broja stek: ulaz i izlaz po vednosti

   push x
   push y
   call saberi
   pop eax
   mov rez, eax

   ret

main endp
end main
