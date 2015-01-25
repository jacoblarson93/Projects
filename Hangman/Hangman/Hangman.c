/*

Hangman game for you to enjoy

*/

#include "stdio.h"
#include "string.h"
#include "time.h"
#include "stdlib.h"
#include "conio.h"

time_t t;

char ar[80];

char* Get_word()
{

	FILE *ptr_file;
	
	int x;
	int randnum;
	srand((unsigned) time(&t));
	
	randnum = (rand() % 125) + 1;
	//printf("%d\n", randnum);
	
	ptr_file = fopen("C:/Users/Jacob/Desktop/Words.txt", "r");

	for(x = 0; x < randnum; x++)
		fgets(ar, 100, ptr_file);

	return ar;

	fclose(ptr_file);

}

void main()
{

	int i;
	int k = 100;
	int lflag = 0;
	int j = -2;
	char ch;

	char * cp;

	char blank[80];

	cp = Get_word();

	strlwr(cp);

	//for(i = 0; i < strlen(cp); i++)
		//printf("%c", cp[i]);

	for(i = 0; i < (strlen(cp) * 2) - 3; i++) // not sure why i have to subtract 3
	{
		k *= -1; //alternates 
		if(k < i)
			blank[i] = '_';
		if(k > i)
			blank[i] = ' ';
	}

	blank[(strlen(cp) * 2) - 3] = 0;

	printf("Hangman Game!!! V. 1"); printf("\n--------------------\n");

	printf("Here is your word!\n\n");

	puts(blank); printf("\n");

	printf("Please guess a Character!\n");

	ch = getche(); printf("\n");

	for(i = 0; i < strlen(cp); i++)
	{
		j += 2;
		if(ch == cp[i])
		{
			blank[j] = ch;
			lflag = 1;
		}
	}

	if(!lflag)
		printf("Character not found\n");

	puts(blank);

}