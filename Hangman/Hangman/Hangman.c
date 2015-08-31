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
	//C:/Users/Jacob/Desktop/Words.txt
	ptr_file = fopen("Words.txt", "r");

	for(x = 0; x < randnum; x++)
		fgets(ar, 100, ptr_file);

	return ar;

	fclose(ptr_file);

}

int Is_full(char* ar)
{

	int i;
	int flag = 0;

	for(i = 0; i < strlen(ar); i++)
		if(ar[i] == 95)
			return 0;

	return 1;
		
}

int Draw_hang_man()
{   
	static int counter = 1;
	int i;
	for(i = 0; i < counter; i++)
	{

		switch(i)
		{
		case 0:
			printf(" _____ ____  ");
			break;
		case 1:
			printf("|     |    | ");
			break;
		case 2:
			printf("|     |    |  ");
			break;
		case 3:
			printf("|    {8}   |  ");
			break;
		case 4:
			printf("|    /|\\   |  ");
			break;
		case 5:
			printf("|     |    |  ");
			break;
		case 6:
			printf("|    /|\\   |  ");
			break;
		case 7:
			printf("|   /   \\  |  ");
			break;
		case 8:
			printf("|__________|  ");
			break;
		}

		printf("\n");

	}	

	counter++;
	return counter; 
}

void main()
{
	int m;
	int x = 0;
	int i;
	int k = 100;
	int lflag = 0;
	int j = -2;
	char ch;
	int diff;
	int amt_drawn = 0;

	char * cp;

	char blank[80];
	char guessed[26];

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

	for(i = 0; i < 26; i++)
		guessed[i] = '-';

	blank[(strlen(cp) * 2) - 3] = 0;

	printf("Hangman Game!!! V. 1"); printf("\n--------------------\n");
	//printf("Enter difficulty (1 = Easy, 2 = Medium, 3 = Hard)\n");
	//scanf("%d", &diff);

	printf("Here is your word!\n\n");

	puts(blank); printf("\n");

	do{
    lflag = 0;
	j = -2;
	printf("Please guess a Character!\n");
	printf("Previosly missed characters:\n");
	for(m = 0; m < 26; m++)
		printf("%c", guessed[m]);
	printf("\n");

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
	{
		printf("Character not found\n\n");
		guessed[ch - 97] = ch;	
		amt_drawn = Draw_hang_man();
		printf("\n");
	}
	puts(blank);
	printf("\n");
	x++;
	}while(amt_drawn < 10 && !Is_full(blank));

	if(Is_full(blank))
		printf("You won!\n");
	else
		printf("You lose!\n");

}