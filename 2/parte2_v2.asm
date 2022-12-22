# Fazer um printf 2^e * 1.x onde e=-3 a +4 e x é parte fracionária
addi t0, x0, 0b001 # e
addi t1, x0, 0b1100 # x

# Calcula e-3
addi t0, t0, -3

# Parte 2^e
addi t2, x0, 0 ## inicializa com 0 (armazena resultado)

## Calcula '2'
addi t3, x0, 50 ## inicializa em 50 ('2' em ASCII)
add t2, t2, t3 ## adiciona ao resultado

## Calcula '^'
addi t3, x0, 94 ## inicializa em 94 ('^' em ASCII)
slli t3, t3, 8 ## arrasta 8 bits à esquerda
add t2, t2, t3 ## adiciona ao resultado

## Calcula sinal
addi t3, x0, 43 ## inicializa em 43 ('+' em ASCII)
bge t0, zero, sinal ## verifica o sinal do expoente
addi t3, t3, 2 ## armazena 45 ('-' em ASCII)
sinal: slli t3, t3, 16 ## arrasta 16 bits à esquerda
add t2, t2, t3 ## adiciona ao resultado

## Calcula e
bge t0, zero, expoente ## verifica o sinal do expoente
addi t3, zero, -1 ## calcula -1
mul t0, t0, t3 ## inverte o sinal do expoente (caso seja negativo)
expoente: addi t3, t0, 48 ## inicializa em 48 + e (e em ASCII)
slli t3, t3, 24 ## arrasta 20 bits à esquerda
add t2, t2, t3 ## adiciona ao resultado

## Escreve na memória
sw t2, 0(gp)

# Parte 1.
addi t2, x0, 0 ## inicializa com 0 (armazena resultado)

## Calcula '1'
addi t3, x0, 49 ## inicializa em 49 ('1' em ASCII)
add t2, t2, t3 ## adiciona ao resultado

## Calcula '.'
addi t3, x0, 46 ## inicializa em 46 ('.' em ASCII)
slli t3, t3, 8 ## arrasta 8 bits à esquerda
add t2, t2, t3 ## adiciona ao resultado

## Escreve na memória
sw t2, 4(gp)

# Parte x

## Encontra a linha da mantissa
addi t2, x0, 0
beq t1, t2, M0000
addi t2, t2, 1
beq t1, t2, M0001
addi t2, t2, 1
beq t1, t2, M0010
addi t2, t2, 1
beq t1, t2, M0011
addi t2, t2, 1
beq t1, t2, M0100
addi t2, t2, 1
beq t1, t2, M0101
addi t2, t2, 1
beq t1, t2, M0110
addi t2, t2, 1
beq t1, t2, M0111
addi t2, t2, 1
beq t1, t2, M1000
addi t2, t2, 1
beq t1, t2, M1001
addi t2, t2, 1
beq t1, t2, M1010
addi t2, t2, 1
beq t1, t2, M1011
addi t2, t2, 1
beq t1, t2, M1100
addi t2, t2, 1
beq t1, t2, M1101
addi t2, t2, 1
beq t1, t2, M1110
addi t2, t2, 1
beq t1, t2, M1111

j END

M0000:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 48
sw t2, 16(gp)

###2^-2
addi t2, x0, 48
sw t2, 12(gp)

###2^-1
addi t2, x0, 48
sw t2, 8(gp)

j END

M0001:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 50
sw t2, 16(gp)

###2^-2
addi t2, x0, 54
sw t2, 12(gp)

###2^-1
addi t2, x0, 48
sw t2, 8(gp)

j END

M0010:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 53
sw t2, 16(gp)

###2^-2
addi t2, x0, 50
sw t2, 12(gp)

###2^-1
addi t2, x0, 49
sw t2, 8(gp)

j END

M0011:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 55
sw t2, 16(gp)

###2^-2
addi t2, x0, 56
sw t2, 12(gp)

###2^-1
addi t2, x0, 49
sw t2, 8(gp)

j END

M0100:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 48
sw t2, 16(gp)

###2^-2
addi t2, x0, 53
sw t2, 12(gp)

###2^-1
addi t2, x0, 50
sw t2, 8(gp)

j END

M0101:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 50
sw t2, 16(gp)

###2^-2
addi t2, x0, 49
sw t2, 12(gp)

###2^-1
addi t2, x0, 51
sw t2, 8(gp)

j END

M0110:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 53
sw t2, 16(gp)

###2^-2
addi t2, x0, 55
sw t2, 12(gp)

###2^-1
addi t2, x0, 51
sw t2, 8(gp)

j END

M0111:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 55
sw t2, 16(gp)

###2^-2
addi t2, x0, 51
sw t2, 12(gp)

###2^-1
addi t2, x0, 52
sw t2, 8(gp)

j END

M1000:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 48
sw t2, 16(gp)

###2^-2
addi t2, x0, 48
sw t2, 12(gp)

###2^-1
addi t2, x0, 53
sw t2, 8(gp)

j END

M1001:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 50
sw t2, 16(gp)

###2^-2
addi t2, x0, 54
sw t2, 12(gp)

###2^-1
addi t2, x0, 53
sw t2, 8(gp)

j END

M1010:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 53
sw t2, 16(gp)

###2^-2
addi t2, x0, 50
sw t2, 12(gp)

###2^-1
addi t2, x0, 54
sw t2, 8(gp)

j END

M1011:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 55
sw t2, 16(gp)

###2^-2
addi t2, x0, 56
sw t2, 12(gp)

###2^-1
addi t2, x0, 54
sw t2, 8(gp)

j END

M1100:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 48
sw t2, 16(gp)

###2^-2
addi t2, x0, 53
sw t2, 12(gp)

###2^-1
addi t2, x0, 55
sw t2, 8(gp)

j END

M1101:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 50
sw t2, 16(gp)

###2^-2
addi t2, x0, 49
sw t2, 12(gp)

###2^-1
addi t2, x0, 56
sw t2, 8(gp)

j END

M1110:
###2^-4
addi t2, x0, 48
sw t2, 20(gp)

###2^-3
addi t2, x0, 53
sw t2, 16(gp)

###2^-2
addi t2, x0, 55
sw t2, 12(gp)

###2^-1
addi t2, x0, 56
sw t2, 8(gp)

j END

M1111:
###2^-4
addi t2, x0, 53
sw t2, 20(gp)

###2^-3
addi t2, x0, 55
sw t2, 16(gp)

###2^-2
addi t2, x0, 51
sw t2, 12(gp)

###2^-1
addi t2, x0, 57
sw t2, 8(gp)

j END

END: nop
