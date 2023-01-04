org 100h

mov palprime_array[0], 2 
mov cx, 998              
mov bx, 3               
mov di,2                 
    
    

main:
    mov temp[0],bx 
    mov temp[2],cx  
    
    reverse: 
    cmp bx,100      
    jge reverse_greater_than_100    
    xor dx,dx       
    mov ax, bx      
    mov bx,10       
    div bx          
    cmp ax,0        
    je is_prime     
    
    cmp ax,dx       
    je is_prime     
    jne reload      
    
    
    reverse_greater_than_100:
    xor dx,dx       
    mov bx,10       
    mov ax,temp[0]   
    div bx                 
    mov temp[4],dx  
    xor dx,dx       
    div bx          
    mov temp[6],dx  
    xor dx,dx       
    div bx          
    mov temp[8],dx  
    
    mov bx,100      
    mov ax, temp[4] 
    mul bx          
    mov temp[10],ax 
    
    mov bx,10       
    mov ax,temp[6]  
    mul bx          
    mov temp[12],ax 
    
    mov ax, temp[10]
    add ax, temp[12]
    add ax, temp[8]
    mov temp[14],ax 
       
    cmp temp[0],ax  
    je is_prime     
    jne reload       


    is_prime:       
    xor dx,dx       
    mov ax,temp[0] 
    mov bx,0002h    
    div bx          
    cmp dx,0        
    jz reload       
       
        l1:                                                                    
        mov ax,temp[0]                                      
        xor dx,dx      
        div bx         
        cmp dx,0       
        je reload      
        inc bx         
        cmp bx,ax      
        jge save_and_reload                  
        jne l1              
          
    
       
    
    save_and_reload:            
    mov bx, temp[0]             
    mov cx, temp[2]             
    mov palprime_array[di],bx   
    add di,2                    
    inc bx                      
    loop main                   

    reload:             
    mov bx,temp[0]       
    mov cx,temp[2]      
    inc bx              
    loop main           

ret                             

temp dw 100 dup(0)               
palprime_array dw 100 dup(0)