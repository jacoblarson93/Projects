/*

This program creates an interactive tic tac to game in "3d". Suitable for two players.

*/

#include "stdio.h"

unsigned char board[3][3][3];

void printboard()
{

	int row, col, layer;

	for(layer = 0; layer < 3; layer++) // triple nested loop prints 3d array to console
	{
		for(row = 0; row < 3; row++)
		{
			for(col = 0; col < 3; col++)
				printf("%c", board[layer][row][col]);
				
			printf("\n");	// prints line between rows	
		}	
		printf("\n\n"); // prints two lines between layers
	}
}

void main()
{

	int row, col, layer;

	for(layer = 0; layer < 3; layer++) // filling the array
		for(row = 0; row < 3; row++)
			for(col = 0; col < 3; col++)
				board[layer][row][col] = 46;

	do{

		printf("Player one, please enter layer, row, and col: "); //input for player 1
		scanf("%d", &layer);
		scanf("%d", &row);
		scanf("%d", &col);
		printf("\n");

		board[layer-1][row-1][col-1] = 88; // minus one because index starts at 0, 88 is ascii of x

		printboard();

		printf("Player two, please enter layer, row, and col: "); // input for player 2
		scanf("%d", &layer);
		scanf("%d", &row);
		scanf("%d", &col);
		printf("\n");

		board[layer-1][row-1][col-1] = 79; // 79 is ascii value of O

		printboard();

	}while(1); // will run forever

}