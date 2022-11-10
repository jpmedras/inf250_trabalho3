/*
Gera trecho do código em Assembly (para parte2_v2.asm)
Resumo: Cada matissa possui um valor correspondente em decimal, calculado considerando o valor de cada fração correspondente. Ex.: 1010 -> 1 + 1/2 * 1 + 0 * 1/4 + 1 * 1/8 + 0 * 1/16
Autor: João Pedro Medrado Sena
Data: out 2022
*/

#include <iostream>

using namespace std;

void print(int m) {
	// Para cada algarismo da parte decimal (ex.: 1.7500 -> [0] = 7, [1] = 5, [2] = 0, [3] = 0)
	for (int i = 0; i < 4; i++) {
		int v = 48+(m%10);	// Gera código em ASCII
		m/=10;
		printf("###2^%d\n", -(4-i));	// Imprime comentário auxiliar
		printf("addi t2, x0, %d\n", v);	// t2 = v
		printf("sw t2, %d(gp)\n", 8+((3-i)*4));	// Armazena na memória
		printf("\n");
	}
	printf("j END\n");	// Pula para o final
	printf("\n");	// Espaço no código
}

// 2^exp (ineficiente)
int pow2(int exp) {
	if (exp == 0) return 1;
	return pow2(exp-1) * 2;
}

int main() {
	for (int i = 0; i <= 15; i++) {
		printf("M");
		for (int j = 3; j >= 0; j--)
			printf("%d", ((1 << j) & i)?1:0);
		printf(":\n");
		int m = 10000;
		for (int j = 0; j < 4; j++) {
			if ((1 << (3-j)) & i) m+= 10000/pow2(j+1);
		}
		print(m);
	}
}
