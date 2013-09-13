#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main (int argc, char *argv[]){

	FILE *entrada;
	//char *nome = malloc(char*sizeof((int)strlen(argc[1])));
	char word[83];
	int count = 0;
	char c = 'a';
	int x = 0;
	entrada = fopen(argv[1],"r");
	printf("Testando!\n");
	while((c = getc(entrada)) != EOF){
		if (c != ' '){
			word[count] = c;
			if (c == '0')
				printf (" x ",word[count]);
			else
				printf (" %c ",word[count]);
			/*Bastava colocar count para comecar em 1?! */
			if (((count + 1) % 9) == 0 )
				printf ("\n");

			count++;
		}
	}
	printf ("\n");
	
	return 0;
}