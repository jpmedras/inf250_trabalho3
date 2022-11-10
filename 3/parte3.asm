addi t6,gp,0 #posicao da memoria

addi t0,x0,3 #k
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,2 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,2 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,2 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,3 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,1 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,2 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,2 #val
sw t0,0(t6)
addi t6,t6,4


addi t0,x0,0 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,3 #val
sw t0,0(t6)
addi t6,t6,4

addi t0,x0,2 #val
sw t0,0(t6)
addi t6,t6,4



addi t0,x0,-1 #val
sw t0,0(t6)

#controle do fim do vetor e inicio das respostas
addi t5,t6,0 # t5 tera o a ultima posicao que contem o -1
addi t6,t6,4

#loop para escrever os primeiros k valores como sendo os mais proximos
addi t0,gp,12 #pos vetor
addi t3,x0,0 #conta quantas interações

Loop1:addi t2,x0,0
lw t4, 0(t0)
lw t1, 4(gp)
bge t4,t1,Maior
sub t2,t1,t4

vMaior: addi t0,t0,4
lw t4,0(t0)
lw t1,8(gp)

bge t4,t1 Maior2
add t2,t2,t1
sub t2,t2,t4
vMaior2:
sw t2,0(t6)
addi t0,t0,4
addi t6,t6,4
lw t2,0(t0)
sw t2,0(t6)
addi t6,t6,4
addi t0,t0,4
lw t2, 0(t0)
lw t1,0(t5)

addi t3,t3,1

bne t1,t2, Loop1
jal x0,fimLoop1


Maior:
sub t2,t4,t1
jal x0, vMaior

Maior2:
add t2,t2,t4
sub t2,t2,t1
jal vMaior2



fimLoop1:
addi t0,x0,-1
sw t0,0(t6)


Buble:
addi t0,t5,4
jal x0,Compara
VCompara:
addi t3,t3,-1
bne t3,x0,Buble
jal x0,fBuble



Compara:
lw t2, 8(t0)
addi t1,x0,-1
beq t2,t1,VCompara

lw t1, 0(t0)


bge t1,t2, Troca
vTroca:
addi t0,t0,8
jal x0,Compara



Troca:
sw t2,0(t0)
sw t1,8(t0)
lw t1, 4(t0)
lw t2, 12(t0)
sw t2,4(t0)
sw t1,12(t0)
jal x0,vTroca


fBuble:


addi t0,x0,0
addi t1,x0,0
addi t2,x0,0

addi t5,t5,4


#Loop para verificar o que aparece mais vezes

addi t6,x0,0

Loop3:
lw t3,4(t5)
addi t4,x0,0
beq t3,t4, Ad0

addi t4,x0,1
beq t3,t4, Ad1

addi t4,x0,2
beq t3,t4, Ad2
vLoop3:
addi t5,t5,8

lw t3,0(gp)
addi t6,t6,1
bne t3,t6,Loop3 #enquanto não chegar no -1 continuar rodando o loop3
jal x0,fimLoop3

Ad0:
addi t0,t0,1
jal x0,vLoop3


Ad1:
addi t1,t1,1
jal x0,vLoop3

Ad2:
addi t2,t2,1
jal x0,vLoop3


fimLoop3:


bge t1,t0, Teste2
bge t2,t0, T2maior

addi t0,x0,0
jal x0, Fim


Teste2:
bge t2,t1, T2maior
addi t0,x0,1
jal x0,Fim



T2maior:
addi t0,x0,2



Fim:

sw t0,0(gp)
