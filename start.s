.cpu cortex-m3
.syntax unified

.section .data
    .align 4
    ram: .word 0x30000000
	@numero del 0 al 47

.section .text
    .global _start
    .thumb_func
_start:
    ldr r2, =ram    @ Cargar la dirección de 'ram' en r2
    mov r0, 0xA        @ Inicializar número con 7
    mov r1, #0        @ Inicializar contador con número el numero 2
    mov r3, #1        @inicalizar r3 con 1
    mov r4,#0		@inicializar r4 con 0

Fibo:
    cmp r0, #0
    beq dft
    cmp r0,#48
    bge nel
    add r5, r3, r4    @ suma de r3 y r4, guardar en r5
    mov r4,r3
    mov r3,r5
    add r2,r2,#0x01
    cmp r1,#14
    bge mayor
    str r5,[r2]   @guardara a la memoria
    add r1, r1, #1   @ suma 1 al contador
    cmp r1, r0        @ Comparar con  r 0
    b .      @ Si es igual a r0, que se acabae


    b Fibo           @ Repetir ciclo


fin:
    b fin             @ Bucle infinito
dft:
	str r0, [r2]
nel:
	b .
mayor:
        AND r6,r5,#0x03
	str r6, [r2]
	lsr r7,r5,#2
	AND r7,r7,#0x03
	add r2,r2,#1
	str r7, [r2]
	add r1, r1 ,#1
	cmp r1,r0
	beq Fibo
	cmp r1,#26
	bge ma2
	b .
ma2:
	AND r6,r5,#0x03
	str r6,[r2]
	lsr r7,r5,#2
	AND r7,r7,#0x03
	add r2,r2,#1
	str r7,[r2]
	lsr r8,r5,#4
	AND r8,r8,#0x03
	add r2,r2,#1
	str r8, [r2]
	add r1,r1, #1
	cmp r1,r0
	beq Fibo
	cmp r1, #38
	bge ma3
	b .

ma3:
	AND r6,r5,#0x03
        str r6,[r2]
        lsr r7,r5,#2
        AND r7,r7,#0x03
        add r2,r2,#1
	str r7,[r2]
        lsr r8,r5,#4
        AND r8,r8,#0x03
        add r2,r2,#1
        str r8, [r2]
	lsr r9,r5,#0x06
	AND r9,r9,#0x03
	add r2,r2,#1
	str r9,[r2]
        add r1,r1, #1
        cmp r1,r0
        beq Fibo
        b .



