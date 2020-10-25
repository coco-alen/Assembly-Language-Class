.386
data segment

num1 dw 1 dup(0);乘数1。
num2 dw 1 dup(0);乘数2。
mul_result dd 1 dup(0);

out_10 db 11 dup(0) ;十进制输出
out_16 db 9 dup(0) ;十六进制输出
out_2 db 4 dup(0) ;二进制输出

data ends

code segment use16
assume cs:code, ds:data

clear:  ;函数用来换行，清零寄存器
   mov dl , 0Dh
   mov ah, 2
   int 21h ;输出换行
   mov dl , 0Ah
   mov ah, 2
   int 21h ;输出换行
   mov eax, 0
   mov ebx, 0
   mov ecx, 0
   mov edx, 0

   ret


main:
   mov ax, data
   mov ds, ax
   mov si, 0Ah  ;保留十进制乘数10，在input_done的时候完成工作

inputnum1:  ;输入数字1
   mov ah, 1
   int 21h      ;  AL=getchar()，循环输入
   cmp al, 0Dh  ;如果是回车，去输入下一个数字
   je inputnum2_pre
   sub al, '0'  ;把ax化为输入值
   mov ah, 0
   mov bx, ax   ;把输入值放入bx
   
   mov ax, num1 ;ax中是已经累计的值
   mul si       ;原来的值放大10倍，加上新输入的值
   add ax, bx
   mov num1, ax ;存为变量

   jmp inputnum1

inputnum2_pre:
   mov dl, 0Ah   ;调用21h/2输出。
   mov ah, 2
   int 21h

inputnum2:   ;输入数字2
   mov ah, 1
   int 21h      ;  AL=getchar()，循环输入
   cmp al, 0Dh  ;如果是回车，去输入下一个数字
   je do_mul
   sub al, '0'  ;把ax化为输入值
   mov ah, 0
   mov bx, ax   ;把输入值放入bx
   
   mov ax, num2 ;ax中是已经累计的值
   mul si       ;原来的值放大10倍，加上新输入的值
   add ax, bx
   mov num2, ax

   jmp inputnum2

do_mul:   ;进行乘法
   mov dl, 0Ah   ;调用21h/2输出换行。
   mov ah, 2
   int 21h

   mov ax, num1  ;进行乘法
   mov bx, num2
   mul bx
   mov ebx, edx  ;结果的高位存入结果位ebx后左移16位。
   shl ebx, 10h
   add ebx, eax  ;得到计算结果
   mov mul_result , ebx


;从这里开始打印十进制结果

print_10_start:  ;准备打印十进制
;eax里放乘法的结果，ebx中放进制数10，si是数组下标，从1开始

   mov edx, 0
   mov ebx, 0Ah
   mov eax, mul_result  ;eax中存入乘法的结果值
   mov esi, 1

transform_10:   ;十进制转换，倒序放入数组10_out
   cmp eax, 0   ;如果结果除到0，则开始打印
   je print_10_pre
   div ebx      ;除以10，把余数放入准备输出的数组，剩下数字进行循环。
   add dl, '0'
   mov out_10[esi],dl
   add esi, 1
   mov edx , 0   ; 余数edx清零
   jmp transform_10

print_10_pre:
   sub esi, 1  ;减去多余的si值，

print_10:  ;打印10进制结果
   cmp esi ,0
   je print_10_done
   mov dl , out_10[esi]
   mov ah, 2
   int 21h ;输出
   sub esi, 1
   jmp print_10

print_10_done:
   call clear




;以下内容打印16进制结果


print_16_start:  ;准备打印十六进制
;eax里放乘法的结果，ebx中放进制数16，si是数组下标，从1开始
   mov dx, 10h  ;先存入10h作为之后2进制打印停止的标记数
   push dx
   mov edx, 0
   mov ebx, 10h
   mov eax, mul_result
   mov esi, 1

transform_16:   ;十进制转换，倒序放入数组10_out
   cmp eax, 0   ;如果结果除到0，则开始打印
   je print_16_pre
   div ebx      ;除以10，把余数放入准备输出的数组，剩下数字进行循环。

   push dx    ;把结果存入堆栈为2进制做准备。
   cmp dl, 10  ;转化为数字
   jb isnum
   jmp isword

isnum:  ;0-9
   add dl, '0'
   mov out_16[esi],dl
   add esi, 1
   mov edx , 0   ; 余数edx清零
   jmp transform_16

isword:  ;A-F
   sub dl, 10
   add dl, 'A'
   mov out_16[esi],dl
   add esi, 1
   mov edx , 0   ; 余数edx清零
   jmp transform_16

print_16_pre:
   mov esi, 8  ;因为要输出八位，直接赋值esi为8

print_16:   ;打印16进制
   cmp esi ,0
   je print_16_done
   mov dl , out_16[esi]
   cmp dl , 0  ;如果是0,输出0,
   jne print_16_2
print_16_1:
   add dl , '0'
print_16_2:
   mov ah, 2
   int 21h ;输出
   sub esi, 1
   jmp print_16

print_16_done: 
   mov dl , 'h'  ;在结尾输出一个h表示16进制。
   mov ah, 2
   int 21h ;输出
   call clear


;以下内容打印2进制结果
;二进制通过存入堆栈的16进制结果计算得，以保证4位4位的输出
;一个16进制数字需要除四次2，得到的商是对应的二进制值
;其中si存除2的次数，同时作为存储二进制结果的下标，直接倒序存入方便正序输出
;bl存要除的进制2


print_2_start:  ;准备打印2进制
   mov si, 3  
   mov bl, 2
   pop ax     ;提出堆栈中的十六进制结果。
   cmp ax,10h  ;如果读到标志数，结束打印
   je print_2_done

transform_2:
   div bl
   mov out_2[esi],ah   
   mov ah, 0
   sub si, 1
   cmp si, 0FFFFh ;除完4次则完成一个16进制数的计算
   je print_2
   jmp transform_2

print_2:  ;打印一个16进制数的2进制结果
   add si, 1
   cmp esi, 4
   je print_2_tail
   mov dl, out_2[esi]
   add dl, '0'
   mov ah, 2
   int 21h ;输出
   jmp print_2

print_2_tail:  ;在结尾打印一个空格
   mov dl, ' '
   mov ah, 2
   int 21h ;输出
   jmp print_2_start


print_2_done:  ;二进制数打印结束后，先进行一个退格删除结尾的空格，在打印一个字母B表示二进制。
   mov dl, 08h
   mov ah, 2
   int 21h   
   mov dl, 'B'
   mov ah, 2
   int 21h
   call clear


exit:          ;退出
   mov ah, 4Ch
   int 21h

code ends
end main