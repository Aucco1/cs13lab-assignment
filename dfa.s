.global process_dfa_1
.global process_dfa_2
.text

process_dfa_1:
    mov $0, %eax
loop_start_1:
    movzbq (%rcx), %rdx
    test %rdx, %rdx
    jz loop_end_1
    cmp $49, %rdx
    je handle_one_1
    jmp next_char_1
handle_one_1:
    cmp $2, %eax
    je next_char_1
    inc %eax
next_char_1:
    inc %rcx
    jmp loop_start_1
loop_end_1:
    cmp $1, %eax
    je accept_1
    mov $0, %eax
    ret
accept_1:
    mov $1, %eax
    ret

process_dfa_2:
    mov $0, %eax
loop_start_2:
    movzbq (%rcx), %rdx
    test %rdx, %rdx
    jz loop_end_2
    cmp $48, %rdx
    je handle_zero_2
    cmp $49, %rdx
    je handle_one_2
    jmp next_char_2
handle_zero_2:
    mov $1, %eax
    jmp next_char_2
handle_one_2:
    cmp $0, %eax
    je state_ac_one_2
    cmp $1, %eax
    je state_b_one_2
    cmp $2, %eax
    je state_d_one_2
    cmp $3, %eax
    je state_e_one_2
state_ac_one_2:
    mov $0, %eax
    jmp next_char_2
state_b_one_2:
    mov $2, %eax
    jmp next_char_2
state_d_one_2:
    mov $3, %eax
    jmp next_char_2
state_e_one_2:
    mov $0, %eax
    jmp next_char_2
next_char_2:
    inc %rcx
    jmp loop_start_2
loop_end_2:
    cmp $3, %eax
    je accept_2
    mov $0, %eax
    ret
accept_2:
    mov $1, %eax
    ret