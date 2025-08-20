.386
.model flat, c
.data

   Mat dw 1,2,3
       dw 4,5,6
       dw 7,8,9

   N dd 3

   suma dw 10 dup(?)

.code
main proc

mov ebx, 0 ; EBX = 0; Unutrasnja petlja
mov ecx, N ; Broj prolaza kroz petlju 

p1:

  mov esi, 0 ; Spoljasnja petlja
  mov ax, 0 ; SUMA = 0;

P2:

 // Ovde mi uradi ax+=Mat[ebx+esi] 

 add esi, 2 ; Ovo je korak
 cmp esi, N
 jb p2

 add ebx,N
 add ebx, N  ; ova dva zajedno je korak koji je 2*N
 loop p1:

 ret

 main endp
 end main
