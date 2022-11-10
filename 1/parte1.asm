addi t0,x0,0b1000110 #representando os numeros: a
addi t1,x0,0b1000110 #b

srli t3,t0,4 #exp_a:separando os expoentes , deslocamento para direita de 4 vezes
srli t4,t1,4 #exp_b

andi t5,t0,0xF #pego as mantissas: m_a = a & 000 1111, pego os 4 últimos bits
andi t6,t1,0xF #m_b

ori t5,t5,0x10 #mantissas ligadas: ligar o bit implicito
ori t6,t6,0x10

mul t5,t5,t6 #multiplico mantissas gera numero de 10 bits

andi t6,t5,0x200 # ver se o b1 é ligado ou nao

addi s0,x0,0x200 #registro salvo
beq t6,s0,LIGADO

srli t5,t5,4 #se o b1 não estiver ligado, desloco de 4 para direita
add t3,t3,t4 #ajusto os expoentes
addi t3,t3,-3 #expoente final
j FINAL

LIGADO: #se b1 estiver ligado desvia para esse bloco

srli t5,t5,5 #desloco de 5 se tiver ligado
add t3,t3,t4 #expoentes
addi t3,t3,-3
addi t3,t3,1 #expoente final


FINAL: #concatenação do resultado

slli t3,t3,4
andi t5,t5,0xF
add t2,t3,t5
