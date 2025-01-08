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
   pushad     ; kada je ulaz po vrednosti mozemo koristiti PUSHAD da na stack stavimo registre opste namene

   mov eax,[ebp+4]
   add eax,[ebp+8]

   mov ebx, [ebp+12]
   mov [ebx], eax

   popad
   popfd
   ret 12

saberi endp
main proc

   ; saberi dva broja stek: ulaz po vrednosti i izlaz po adresi


   push offset rez
   push x
   push y
   call saberi

   nop
   ret


main endp
end main
