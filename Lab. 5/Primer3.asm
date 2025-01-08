.386
.model flat,c
.data

   x db 5
   y db 3
   rez db ?

.stack 4096
.code
saberi proc

   pushfd
   push eax

   add eax,ebx
   mov [ecx],eax

   pop eax
   popfd
   ret
saberi endp
main proc

    :  Saberi dva broja: ulaz po vednosti, izlaz po adresi


  mov eax, x
  mov ebx, y
  lea ecx, rez
  call saberi


   ret
main endp
end main
