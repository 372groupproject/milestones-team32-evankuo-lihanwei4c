class Board {

	// Internal representation for the board
	List theBoard = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];


	void clearBoard() {
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = 0; j < theBoard.length; j++) {
				theBoard[i][j] = 0;
			}
		}
	}


	// Places a piece at the given position. Returns true if the piece was place successfully and false 
	// if not (the column was full).
	bool placePieceAt(int row, int column, String playerOrComputer) {

		int currNum = 0;

		if (playerOrComputer.compareTo("player") == 0) {
			currNum = 1;
		}

		else {
			currNum = 2;
		}

		if (theBoard[row][column] == 0) {
			theBoard[row][column] = currNum;
			return true;
		}


		return false;
	}


	// Checks whether or not someone has won or lost
	int checkGameState() {

		// Check for player win vertical
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = theBoard[0].length - 1; j >= 0; j--) {

				if (theBoard[j][i] == 1) {
					if (j == 0) {
						return 1;
					}
				}

				else {
					break;
				}
			}
		}

		// Check for player win horizontal
		for (int i = 0; i < theBoard.length; i++) {

			for (int j = 0; j < theBoard[0].length; j++) {

				if (theBoard[i][j] == 1) {
					if (j == theBoard[0].length - 1) {
						return 1;
					}
				}

				else {
					break;
				}
			}
		}

		// Check for player win vertical top left to bottom right
		for (int i = 0; i < theBoard.length; i++) {
			if (theBoard[i][i] == 1) {
				if (i == theBoard[0].length - 1) {
					return 1;
				}
			}

			else {
				break;
			}
		}

		// Check for player win vertical top right to bottom left
		for (int i = theBoard.length - 1; i >= 0; i--) {
			if (theBoard[i][i] == 1) {
				if (i == 0) {
					return 1;
				}
			}

			else {
				break;
			}
		}




		// Check for comp win vertical
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = theBoard[0].length - 1; j >= 0; j--) {

				if (theBoard[j][i] == 2) {
					if (j == 0) {
						return 2;
					}
				}

				else {
					break;
				}
			}
		}


		// Check for comp win horizontal
		for (int i = 0; i < theBoard.length; i++) {

			for (int j = 0; j < theBoard[0].length; j++) {

				if (theBoard[i][j] == 2) {
					if (j == theBoard[0].length - 1) {
						return 2;
					}
				}

				else {
					break;
				}
			}
		}

		// Check for comp win vertical top left to bottom right
		for (int i = 0; i < theBoard.length; i++) {
			if (theBoard[i][i] == 2) {
				if (i == theBoard[0].length - 1) {
					return 2;
				}
			}

			else {
				break;
			}
		}


		// Check for player win vertical top right to bottom left
		for (int i = theBoard.length - 1; i >= 0; i--) {
			if (theBoard[i][i] == 2) {
				if (i == 0) {
					return 2;
				}
			}

			else {
				break;
			}
		}

		// Check for draw
		for (int i = 0; i < theBoard.length; i++) {
			for (int j = theBoard[0].length - 1; j >= 0; j--) {

				if (theBoard[j][i] != 0) {
					if (j == 0 && i == theBoard.length - 1) {
						return 0;
					}
				}

				else {
					break;
				}
			}
		}


		return -1;
	}

	// Print out the board
	void printBoard() {

		for (int i = 0; i < theBoard.length; i++) {

			String printOneRow = "";

			for (int j = 0; j < theBoard[i].length; j++) {

				if (theBoard[i][j] == 0) {
					printOneRow = printOneRow + "_" + " ";
				}

				else if (theBoard[i][j] == 1) {
					printOneRow = printOneRow + "O" + " ";
				}

				else {
					printOneRow = printOneRow + "X" + " ";
				}

			}

			print(printOneRow);

		}

	}


}