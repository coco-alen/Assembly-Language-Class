.386
data segment use16

;文件中定义的变量
t db '0','1','2','3','4','5','6','7'
  db '8','9','A','B','C','D','E','F'
pattern db "00000000:            |           |           |                             "

filename db 100  ;最多输入100个字符
         db ?    ;实际输入不知道
	 db 100 dup(0)  ;存储输入的字符

s db "00000000:            |           |           |                             "
openerror db "Cannot open file!"
input_tip db "Please input filename:"

handle dw 0
key dw 0

file_size dd 0

;char2hex函数用到的量
	char2hex_xx db 0
	;s db 75 dup(0)

;char2hex函数用到的量
	;the_offset dd 0
	;s db 75 dup(0)

;show_this_row函数用到的量
	row dw 0  ;行号
	bytes_on_row dw 0 ;当前行字节数
	the_offset dd 0
	buf db '0000000000000000'  

;show_this_page函数用到的量
	rows dw 0       ;一页有几行
	bytes_in_buf dw 0  ;当前页字节数
	the_offset_page dd 0
	buf_page db 256 dup(0)
	;the_offset dd 0

data ends


code segment use16
assume cs:code, ds:data

;---------------------------------------
clear:  ;清空所有可使用的寄存器的值
   mov eax, 0
   mov ebx, 0
   mov ecx, 0
   mov edx, 0
   mov esi, 0
   mov edi, 0 
ret

;---------------------------------------
char2hex:  ;把8位数转化成16进制格式
           ;输入:char2hex_xx db ，要转换的数
	   ;     di 表示要覆盖的s起始下标，运行完后di=di+2；
	   ;输出:在s的对应di位往后输出16进制结果2个字符

   push ax
   push si

   mov al ,char2hex_xx  ;处理高位，先右移再取四位
   shr al ,4
   and al ,0Fh
   mov ah ,0
   mov si,ax
   mov al,t[si]  ;转化为16进制符号
   mov s[di],al
   inc di

   mov al ,char2hex_xx  ;处理低位，取后四位
   and al ,0Fh
   mov ah ,0
   mov si,ax
   mov al,t[si]  ;转化为16进制符号
   mov s[di],al
   inc di
   
   pop si
   pop ax
ret

;---------------------------------------

long2hex: ;把32位数转化成16进制格式
          ;输入:the_offset ，要处理的32位数据
	  ;     di 表示要覆盖的s起始下标，运行完后di=di+8；
	  ;输出:在s的对应di位往后输出16进制结果8个字符
   push si
   push eax
   push bx

   mov si, 4
   mov eax,the_offset   ;取offset值为后续处理为16进制数做准备

char_by_char:
   cmp si, 0   ;for(i=0; i<4; i++)
   je long2hex_end
   rol eax, 8    ;左移八位，轮流取8位
   push eax
   and eax, 000000FFh ;取8位
   mov char2hex_xx, al   ;取得到的8位放入转为16进制数的输入
   pop eax
   call char2hex

   dec si
   jmp char_by_char

long2hex_end:

   pop bx
   pop eax
   pop si

   ret

;---------------------------------------

show_this_row:  ;显示当前一行
                ;输入: row,行号
	        ;      bytes_on_row,dw 当前行字节数
	        ;      the_offset,偏移
	        ;      buf，内容数组首地址
		;输出：显示一行值

   push bx  ;保存
   push si
   push di
   push ax
   push cx

   mov cx, 75  ;把pattern中的值全部复制到s中
   push es
   push ds
   pop es
   mov si, offset pattern
   mov di, offset s
   cld
   rep movsb
   pop es



   mov si, 0  ;用于循环
   mov di, 0
   call long2hex 

fill_xx:
   mov al, buf[si]  ;存入要处理的值到char2hex_xx
   mov char2hex_xx, al

   mov di,si   ;赋值要处理的下标位置
   add di,si
   add di,si
   add di,10

   call char2hex

   inc si
   cmp si, bytes_on_row  ;检查这一行是否输出完
   jb fill_xx

   ;进行下一个循环的预处理
   mov si, 0

fill_tile:  ;输出ASCII码对应的结果值
   mov al, buf[si]
   mov s[59+si],al
   inc si
   cmp si, bytes_on_row
   jb fill_tile


find_position:  ;处理vp = vp + row*80*2
   mov bl, 160
   mov ax, row
   mul bl
   mov bx, ax  ;bx存储了对应行的起始偏移量
   mov si, 0 ;循环预处理

show_row:
   mov al, s[si]    ;对应vp[i*2] = s[i]显示内容存入al
   push di
   mov di, si
   shl di, 1  ;di = 2*si
   add di, bx  ;di = 2*si  ；vp = vp + row*80*2 
   
   cmp si,59
   jb row_might_true
   jmp row_is_false

row_might_true:  ;检查是否是“|”
   mov ah, s[si]
   cmp ah, '|'
   je row_is_true
   jmp row_is_false

row_is_true:   ;是“|”
   mov ah, 0Fh  ;设定高亮白色

   mov word ptr es:[di], ax  ;进行显示
   pop di

   jmp row_continue

row_is_false:
   mov ah, 07h  ;设定白色

   mov word ptr es:[di], ax   ;进行显示
   pop di

row_continue:
   inc si
   cmp si, 75
   jb show_row

show_this_row_end:
   pop cx
   pop ax
   pop di
   pop si
   pop bx

ret

;---------------------------------------

clear_this_page:  ;清除屏幕0~15行
                  ;无输入
		  ;输出：80*16个20h。
   push eax
   push cx
   push di
   
   cld
   mov di, 0
   mov cx, 80*16/2  ;填入80*16个0020h
   mov eax, 00200020h
   rep stosd

   pop di
   pop cx
   pop eax

ret
;---------------------------------------


show_this_page: ;显示当前页
		;bytes_in_buf dw 0  ;当前页字节数
		;buf_page db 256 dup(0)  buf字符串数组
		;the_offset_page dd 0 偏移量
   push eax
   push bx
   push cx
   push si
   push di


   call clear_this_page

   mov ax , bytes_in_buf  ;rows = (bytes_in_buf + 15) / 16
   add ax ,15
   mov bl ,16
   div bl
   mov ah ,0
   mov rows, ax

   mov si, 0

show_this_page_begin:

   inc si      ;确认i == rows-1
   cmp si, rows
   je last_line
   jmp not_last_line

last_line:
   dec si
   mov ax ,si ;进行si*16，也就是i*16的处理
   mov bl, 16
   mul bl
   mov cx ,ax  ;cx存储了si*16，也就是i*16的值
   mov ax ,bytes_in_buf
   sub ax, cx
   mov bytes_on_row, ax  ;bytes_in_buf - i*16
   jmp show_this_page_continue

not_last_line:
   dec si
   mov ax ,si
   mov bl, 16
   mul bl
   mov cx ,ax  ;cx存储了si*16，也就是i*16的值
   mov bx, 16
   mov bytes_on_row, bx


show_this_page_continue:
   mov row, si  ;输入 row = i
   mov eax, the_offset_page
   add eax, ecx
   mov the_offset, eax  ;输入 offset+i*16

   push es   ;输入&buf[i*16]
   push ds
   pop es
   push si
   mov si, offset buf_page  ;把buf_page（相当于源代码的buf）
   add si, cx               ;在i*16开始的内容复制到buf中
   mov di, offset buf
   mov cx, bytes_on_row
   cld
   rep movsb

   pop si
   pop es

   call show_this_row  ;显示一行

   inc si
   cmp si, rows
   je show_this_page_end
   jmp show_this_page_begin


show_this_page_end:

   pop di
   pop si
   pop cx
   pop bx
   pop eax

ret

;---------------------------------------




main:
   mov ax, data
   mov ds, ax   ;数据段地址。
   mov ax, 0B800h
   mov es, ax   ;显存段地址输入es

   mov si, 0 ;取值循环
   mov ah, 2

input_tips_role: ;输出提示“Please input filename:”
   cmp si, 22
   je input_tips_end
   mov dl, input_tip[si]
   int 21h
   inc si
   jmp input_tips_role

input_tips_end:  ;输出换行和回车
   mov dl, 0Ah
   int 21h
   mov dl, 0Dh
   int 21h

;---------------------------------------
;输入文件名打开文件

input_filename:  ;输入文件名
   mov dx, offset filename
   mov ah, 0Ah
   int 21h
   mov al, filename[1]  ;读取实际输入的字符数
   mov si, 2
   mov ah, 0
   add si, ax          ;定位到输入字符串的结尾
   mov filename[si] , byte ptr 0   ;消除回车和换行
   mov filename[si+1] , byte ptr 0


open_file: ;打开文件，返回对应文件句柄
   mov ah, 2  ;换行
   mov dl, 0Ah
   int 21h
   mov dl, 0Dh
   int 21h

   mov ah, 3Dh
   mov al, 0; 对应_open()的第2个参数, 表示只读方式
   mov dx, offset filename
   add dx, 2
   int 21h
   mov handle, ax
   
   jc open_error  ;如果CF == 1 打开错误
   jmp open_success


;---------------------------------------
;如果文件打开错误
open_error:

   mov si, 0 ;取值循环
   mov ah, 2

open_error_role:  ;输出提示"Cannot open file!"
   cmp si, 17
   je open_error_end
   mov dl, openerror[si]
   int 21h
   inc si
   jmp open_error_role

open_error_end:

   mov dl, 0Ah  ;换行，退出
   int 21h
   mov dl, 0Dh
   int 21h
   jmp exit

;---------------------------------------
;如果文件打开正确

open_success:
              ;移动文件指针
   mov ah, 42h
   mov al, 2; 对应lseek()的第3个参数,
            ; 表示以EOF为参照点进行移动
   mov bx, handle
   mov cx, 0; \ 对应lseek()的第2个参数
   mov dx, 0; /
   int 21h
   mov word ptr file_size[2], dx
   mov word ptr file_size[0], ax
   mov the_offset_page, dword ptr 0
   call clear


;进行循环，开始显示画面
show_begin:
   mov eax, the_offset_page
   mov ebx, file_size
   sub ebx, eax ;n = file_size - offset,
   cmp ebx, 256 ;这里的ebx存储代替了变量n
   jae byte_256
   jmp byte_not_256

byte_256:
   mov bytes_in_buf, word ptr 256
   jmp show_continue

byte_not_256:
   mov bytes_in_buf, bx
   
show_continue:  ;移动文件指针lseek(handle, offset, 0)
   mov ah, 42h
   mov al, 0; 对应lseek()的第3个参数,
            ; 表示以偏移0作为参照点进行移动
   mov bx, handle
   mov cx, word ptr the_offset_page[2]; \cx:dx合一起构成
   mov dx, word ptr the_offset_page[0]; /32位值=offset
   int 21h
   
   ;读取文件中的bytes_in_buf个字节到buf中
   mov ah, 3Fh  ;_read(handle, buf, bytes_in_buf)
   mov bx, handle
   mov cx, bytes_in_buf
   mov dx, data
   mov ds, dx
   mov dx, offset buf_page
   int 21h

   call show_this_page  
   
   mov ah, 0 ;键盘输入，结果在ASCII码结果在AL，BIOS scan code在AH
   int 16h 

;---------------------------------------
;键盘判断

;define PageUp   0x4900
;define PageDown 0x5100
;define Home     0x4700
;define End      0x4F00
;define Esc      0x011B

   cmp ax, 4900h   ;switch(key)
   je pageup
   cmp ax, 5100h
   je pagedown
   cmp ax, 4700h
   je home
   cmp ax, 4F00h
   je the_end
   cmp ax, 011Bh
   jne show_begin
   jmp the_esc

pageup:
   mov eax, the_offset_page
   sub eax, 256
   mov the_offset_page, eax
   cmp eax, 0
   jl pageup_offset0
   jmp show_begin

pageup_offset0:
   mov the_offset_page, dword ptr 0
   jmp show_begin


pagedown:
   mov eax, the_offset_page
   add eax, 256
   cmp eax, file_size
   jb PageDown_true
   jmp show_begin

PageDown_true:
   mov the_offset_page, eax
   jmp show_begin


home:
   mov the_offset_page, dword ptr 0
   jmp show_begin

the_end:
   mov edx, 0    ;offset = file_size - file_size % 256;
   mov eax, file_size
   mov ebx, 256
   div ebx
   mov eax, file_size
   sub eax, edx
   mov the_offset_page, eax

   cmp eax, file_size
   je End_true
   jmp show_begin

End_true:
   mov eax, file_size
   sub eax, 256
   mov the_offset_page, eax
   jmp show_begin


the_esc:



close:
   mov ah, 3Eh  ;关闭文件
   mov bx, handle
   int 21h

exit:          ;退出
   mov ah, 4Ch
   mov al, 0
   int 21h

code ends
end main