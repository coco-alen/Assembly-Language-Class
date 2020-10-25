.386
data segment use16
hex db 3 dup(0)   ;用于存储ascii码的16进制数字，1是高位 0是地位。
ascii db 0        ;当前操作的ascii码值
data ends

code segment use16
assume cs:code, ds:data
;ax用于字符显示的寄存
;bx用于数字显示的寄存
;di是偏移地址
;cl存放ascii码
;ch进行空格输出的循环
;dl用于记行坐标
;si用于记第一行第n列坐标对应的偏移地址

main:
   mov ax, 0B800h
   mov es, ax   ;把现存段地址输入es
   mov ax, data ;存入data中的数据
   mov ds, ax   

   mov dx, 0  ;  初始化dx
   mov ah, 0CH ; 黑色背景，高亮红色前景
   mov bh, 0AH ; 黑色背景，高亮绿色前景
   mov si, 0  ;  初始化dl为0，表示在第0列的偏移地址值

again:  ;总循环
   mov dl, 19h   ; dl赋值为19h，用于行数的计数，（总共19h行）
   mov di, si    ; 把偏移地址移动到第一行第n列，这里的n随着一列列被打印慢后递增

a_line:  ;打印一列
   mov cl, ascii
   mov al, cl               ; 输入到对应的ascii码。
   mov word ptr es:[di], ax ; 打印ascii码下的字符
                            ;mov byte ptr es:[di], al
                            ;mov byte ptr es:[di+1], ah
   add di, 2                ;向x正方向移动一格
   and cx, 0000000000001111B ; 000Fh  ;取出ascii码的低4位
   cmp cx, 10        ;比较这个一位16进制数是否小于10
   jb is_digit0      ;如果小于10

is_alpha0:     ;如果不小于10
   sub cl, 10
   add cl, 'A'     ;转化为可输出的字母
   jmp deal_hex0
is_digit0:     ;如果小于10
   add cl, '0'       ;转化为可输出的数字
   jmp deal_hex0
   
deal_hex0:         ;把数据存入hex[0]
   mov hex[0], cl  ;这里存的是cx的最低四位，是16进制的低位
   mov cl, ascii   ;重新把ascii放入cl，准备存储16进制的低位
   rol cl, 4       ;循环左移四位
   and cx, 0000000000001111B; 000Fh;取出ascii码的低4位，由于左移了，这里是低八位的高四位，是16进制的高位
   cmp cx, 10     ;比较这个一位16进制数是否小于10
   jb is_digit1   ;如果小于10

is_alpha1:   ;同上is_alpha0
   sub cl, 10
   add cl, 'A'
   jmp deal_hex1
is_digit1:   ;同上is_digit0
   add cl, '0'

deal_hex1:     ;把处理好的数字存入hex[1]
   mov hex[1], cl
   mov cl, ascii   ;重新把ascii放入cl，准备后续处理

printnum:         ;打印对应的ascii码数字

   mov bl, hex[1]  ;打印对应的ascii码16进制高位数字
   mov word ptr es:[di], bx  
   add di, 2

   mov bl, hex[0]   ;打印对应的ascii码16进制低位数字
   mov word ptr es:[di], bx  
   add di, 2

   mov ch, 4       ;初始化ch为4，用于循环输出空格
   jmp add_block 

add_block:   ;输出空格
   mov bl, 20h      ;空格的ASCII码
   mov word ptr es:[di], bx  ;输出空格
   add di, 2h

   sub ch, 1   ;进行循环4次
   jnz add_block  

   add di, 92h  ;把偏移地址的位置移动到第n列 下一行的开头
   add ascii, word ptr 1     ;操作的ASCII码加1
   cmp ascii, word ptr 0     ;这里比较ascii码，如果是0说明循环了0-255了，全部显示完成，跳到退出
   je exit

   sub dl, 1       ;用于记录行循环的dl减一
   jnz a_line      ;减到0说明打印了19h行
   add si, 0Eh     ; si移动到下一粒第一行对应的偏移地址
   cmp si, 8Ch     ;如果行数不大于10，继续打印
   jbe again       ;返回去打印下一列


exit:          ;退出
   mov ah, 1
   int 21h; 键盘输入，起到等待敲键的作用
   mov ah, 4Ch
   int 21h

code ends
end main

