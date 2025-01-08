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
  pushad

  mov esi,[eax]
  add esi,[ebx]
  mov [ecx], esi

  popfd
  popad
  ret

saberi endp
main proc

   ; saberi dva broja: ulaz i izlaz po adresi

   lea eax, x
   lea ebx, y
   lea ecx, rez
   call saberi


   ret
main endp
end main
