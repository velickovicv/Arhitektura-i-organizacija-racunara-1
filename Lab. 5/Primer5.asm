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

   mov ecx, [ebp+4]
   mov eax, [ecx]            ; y

   mov ecx, [ebp+8]
   mov ebx, [ecx]            ; x

   add eax,ebx 
   mov ecx,[ebp+12]          ; u rez
   mov [ecx], eax

   popad
   popfd
   ret 12

saberi endp
main proc

  ; saberi dva broja stek: ulaz i izlaz po adresi

  push offset x
  push offset y
  push offset rez
  call saberi


  nop
  ret
main endp
end main
