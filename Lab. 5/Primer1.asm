.386
.model flat,c
.data

   x db 7
   y db 4
   rez db ?


.stack 4096
.code

saberi proc

  pushfd
  mov cl, al
  add cl,bl
  popfd
  ret

saberi endp
main proc

; saberi dva broja: ulaz i izlaz po vrednosti

movzx eax, x
movzx ebx, y
call saberi
mov rez, cl

ret
main endp
end main
