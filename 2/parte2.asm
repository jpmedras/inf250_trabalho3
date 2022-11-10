# Fazer um printf 2^e * 1.x onde e=-3 a +4 e x é parte fracionária
addi t0, x0, 0b001 # e
addi t1, x0, 0b1100 # x

# Calcula e-3
addi t0, t0, -3

# Parte 2^e

## Calcula '2'
addi t3, x0, 50 # inicializa em 50 ('2' em ASCII)
add t2, zero, t3 # adiciona ao resultado

## Calcula '^'
addi t3, x0, 94 # inicializa em 94 ('^' em ASCII)
slli t3, t3, 8 # arrasta 8 bits à esquerda
add t2, t2, t3 # adiciona ao resultado

## Calcula sinal
addi t3, x0, 43 # inicializa em 43 ('+' em ASCII)
bge t0, zero, sinal # verifica o sinal do expoente
addi t3, t3, 2 # armazena 45 ('-' em ASCII)
sinal: slli t3, t3, 16 # arrasta 16 bits à esquerda
add t2, t2, t3 # adiciona ao resultado

## Calcula e
bge t0, zero, expoente # verifica o sinal do expoente
addi t3, zero, -1 # calcula -1
mul t0, t0, t3 # inverte o sinal do expoente (caso seja negativo)
expoente: addi t3, t0, 48 # inicializa em 48 + e (e em ASCII)
slli t3, t3, 24 # arrasta 20 bits à esquerda
add t2, t2, t3 # adiciona ao resultado

## Escreve na memória
sw t2, 0(gp)

# Parte 1.x

## Parte 1.

### Calcula '1'
addi t3, x0, 49 ### inicializa em 49 ('1' em ASCII)
add t2, zero, t3 ### adiciona ao resultado

### Calcula '.'
addi t3, x0, 46 ### inicializa em 46 ('.' em ASCII)
slli t3, t3, 8 ### arrasta 8 bits à esquerda
add t2, t2, t3 ### adiciona ao resultado

## Escreve na memória
sw t2, 4(gp)

## Parte x

### Inicializa com 0 (armazena mantissa "em dicimal")
addi t3, zero, 0

### Verifica bit 4
bit4: andi t2, t1, 0b1000 # verifica valor do bit
beq t2, zero, bit3 # pula para o próximo bit caso bit seja 0
addi t3, t3, 2000 # adiciona 2000 à mantissa "em decimal"
addi t3, t3, 2000 # adiciona 2000 -> 2000 + 2000 = 4000 à mantissa "em decimal"
addi t3, t3, 1000 # adiciona 1000 -> 4000 + 1000 = 5000 à mantissa "em decimal"

### Verifica bit 3
bit3: andi t2, t1, 0b0100 # verifica valor do bit
beq t2, zero, bit2 # pula caso bit seja 0
addi t3, t3, 2000 # adiciona 2000 à mantissa "em decimal"
addi t3, t3, 500 # adiciona 500 -> 2000 + 500 = 2500 à mantissa "em decimal"

### Verifica bit 2
bit2: andi t2, t1, 0b0010 # verifica valor do bit
beq t2, zero, bit1 # pula caso bit seja 0
addi t3, t3, 1250 # adiciona 1250 à mantissa "em decimal"

### Verifica bit 1
bit1: andi t2, t1, 0b0010 # verifica valor do bit
beq t2, zero, mantissa # pula caso bit seja 0
addi t3, t3, 625 # adiciona 625 à mantissa "em decimal"

### Inicializa com 10 (base da divisão)
mantissa: addi t4, zero, 10

### Calcula o dígito 1
rem t2, t3, t4 # resto da divisão da mantissa por 10
addi t2, t2, 48 # cálcula dígito em ASCII
sw t2, 20(gp) # armazena na memória
div t3, t3, t4 # elimina dígito calculado

### Calcula o dígito 2
rem t2, t3, t4 # resto da divisão da mantissa por 10
addi t2, t2, 48 # cálcula dígito em ASCII
sw t2, 16(gp) # armazena na memória
div t3, t3, t4 # elimina dígito calculado

### Calcula o dígito 3
rem t2, t3, t4 # resto da divisão da mantissa por 10
addi t2, t2, 48 # cálcula dígito em ASCII
sw t2, 12(gp) # armazena na memória
div t3, t3, t4 # elimina dígito calculado

### Calcula o dígito 4
rem t2, t3, t4 # resto da divisão da mantissa por 10
addi t2, t2, 48 # cálcula dígito em ASCII
sw t2, 8(gp) # armazena na memória
