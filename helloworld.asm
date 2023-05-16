        org     $3f00
start   ldx     #msg
loop    lda     ,x+
        beq     done
        jsr     [$a002]
        bra     loop
done    rts
msg     fcc     /HELLO WORLD/
        fcb     13
        fcb     0
        end
