/*
Gera trecho do código em Assembly (para parte2_v2.asm)
Resumo: Em determinada parte do código é necessário verificar qual linha de execução é corresponde à mantissa.
Autor: João Pedro Medrado Sena
Data: out 2022
*/

#include <iostream>

using namespace std;

void print(int x) {
	int p[4];
	// Conversão para binário
	for (int i = 0; i < 4; i++) {
		p[3-i] = ((1 << i) & x)?1:0;
	}
	
	// Imprime resultado
	for (int i = 0; i < 4; i++) {
		printf("%d", p[i]);
	}
}

int main() {
	for (int i = 0; i <= 15; i++) {
		// Linha Mb <=> i (ex.: M1110 <=> 14)
		printf("beq t1, t2, M");
		print(i);
		printf("\n");
		printf("addi t2, t2, 1\n");
	}
}
